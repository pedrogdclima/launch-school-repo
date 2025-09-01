/*
While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:

1
1.0
1.2
3.2.3
3.0.0
4.2.3.0

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

- If version1 > version2, we should return 1.
- If version1 < version2, we should return -1.
- If version1 === version2, we should return 0.
- If either version number contains characters other than digits and the . character, we should return null.

Here is an example of version number ordering:

0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

Problem
- For two given strings representing version numbers, return -1, 0, or 1 depending on how the two arguments shoudl be ordered.
- If any argument contains characters other than digits and ., return null

Examples

console.log(
  compareVersions('1.5', '2.5') === -1,
  compareVersions('1.5', '1.5') === 0,
  compareVersions('3.2', '2.5') === -1,
  compareVersions('1.5', '2.5a') === null,
  compareVersions('3', '3.0') === 0,
);

Data
Input => two strings
Output => 1, -1, 0, or null

Algorithm
1. Check if either string contains any character that isn't (0-9 or .)
  - Return null if so

2. Split strings into arrays of string representing subversions
  - .split('.')

4. Sanitize arrays with unecessary trailing 0s

5. Iterate through one array and check if Number.(ele) of either array is larger than the other.
  - If so, return 1 or -1
  - If not, go to the next pair of elements and repeat from previous step
  - If we run out of element, the versions are equal
*/

const VALID_CHARS = /[^0-9.]|^\.|\.\.+|\.$/;

function compareVersions(version1, version2) {
  if (VALID_CHARS.test(version1) || VALID_CHARS.test(version2)) {
    return null;
  }
  [ version1, version2 ] = [version1, version2].map( version => {
    return version.split('.')
                  .filter( ele => ele !== '0' )
                  .map( ele => Number(ele));
  });
  for (let idx = 0; idx < version1.length || idx < version2.length; idx += 1) {
    let [ v1Num, v2Num ] = [version1[idx], version2[idx]];
    if (v1Num === v2Num) continue;
    if (v1Num === undefined || v1Num < v2Num) return -1;
    return 1;
  }
  return 0;
}

// My Test Cases
console.log(
  compareVersions('1.5', '2.5') === -1,
  compareVersions('1.5', '1.5') === 0,
  compareVersions('3.2', '2.5') === 1,
  compareVersions('1.5', '2.5a') === null,
  compareVersions('3', '3.0') === 0,
  compareVersions('2.16', '2.1') === 1,
);

// LS Test Cases
console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
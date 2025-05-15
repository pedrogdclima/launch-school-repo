function indexOf(firstString, secondString) {
  let keyLength = secondString.length;
  let currentTarget;
  let currentIndex = 0;

  while (firstString.length >= keyLength) {
    currentTarget = '';
    for (let i = 0; i < keyLength; i++) {
      currentTarget += firstString[i];
    }
    if (currentTarget === secondString) {
      return currentIndex;
    } else {
      currentIndex += 1;
    }
    firstString = dropFirstChar(firstString);
  }
  return -1;
}

function dropFirstChar(string) {
  let newString = '';
  for (let i = 1; i < string.length; i++) {
    newString += string[i];
  }
  return newString;
}

function lastIndexOf(fString, sString) {
  let startIndex = indexOf(reflectString(fString), reflectString(sString));
  if (startIndex === -1) return -1;
  return fString.length - sString.length - startIndex;
}

function reflectString(string) {
  let reflectedString = ''
  for (let i = (string.length - 1); i >= 0; i--) {
    reflectedString += string[i];
  }
  return reflectedString;
}

console.log(indexOf('hello', 'll'));
console.log(indexOf('hello', 'lll'));
console.log(indexOf('hello world', ' w'));
console.log(lastIndexOf('hello', 'l'));
console.log(lastIndexOf('hello', 'lll'));

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
/*

The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

- Counting from the rightmost digit and moving left, double the value of every  second digit

- For any digit that thus become 10 or more, subtract 9 from the result
  - 1111 becomes 2121
  - 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)

- Add all these digits together
  - 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
  - 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20

If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), then the number is valid according to the Luhn Formula; else it is not valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.


Start Time => 2:15

Problem
- For a given number string, return true if is passes the Luhn Formula, else false
- Ignore all non-numeric chars
- Luhn Formula:
  - Starting from the string's end, double the value of every 2nd digit
    - Subtract 9 from double if number is over 9
  - Add all digits
  - If sum is divisible by 10, return true, else false

Examples/Test Cases
'2121' => true
'2122' => false
'9555.8342' => true

Data
- Input => String of digits
- Output => Boolean

Algorithm
1. Remove all non-digits from input
    - string.match(regex)
2. Split string into array
3. Convert digits into integers
4. Double every 2nd from right number
  - Subtract 9 if result is over 9
5. Sum array of integers
6. Sum % 10 === 0

*/

function isLuhnValid(digits) {
  digits = digits.replace(/[^0-9]/g, '');
  let numbersArray = [...digits].map(digit => Number(digit));
  let doubledNumArray = numbersArray.reverse().map( (num, idx) => {
    if (idx % 2 === 0) return num;
    let doubledNum = num * 2;
    return (doubledNum > 9 ? doubledNum - 9 : doubledNum);
  }).reverse();
  return 0 === doubledNumArray.reduce((sum, num) => sum + num) % 10;
}

console.log(isLuhnValid('1111')); // false
console.log(isLuhnValid('CC87-63')); // true
console.log(isLuhnValid('21-22')); // false
console.log(isLuhnValid('2 1 2 1')); // true
console.log(isLuhnValid('9555.8342')); // true
console.log(isLuhnValid('2323 2005 7766 3554')); // true

// End Time => 2:51
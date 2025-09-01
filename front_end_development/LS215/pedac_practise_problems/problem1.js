// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

// The rules are as follows:

// - If the phone number is less than 10 digits, assume that it is a bad number.
// - If the phone number is 10 digits, assume that it is good.
// - If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// - If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// - If the phone number is more than 11 digits, assume that it is a bad number.

// For bad numbers, just a return a string of 10 0s.

// Start 12:00

// Problem
// - For a given string representing a phone number return a string of digits removing superflous characters (spaces, dots, dashes, parenthesis)
// - Return 10 '0' if the input is a bad number
//  - More than 11 digits
//  - 11 digits and the 1st is not '1'
//  - Fewer than 10 digits
//  - Any invalid characters

// Examples/Test Cases

// sanitizePhoneNumber('4168843206')
// sanitizePhoneNumber('14168843206')
// sanitizePhoneNumber('124168843206')
// sanitizePhoneNumber('44168843206')
// sanitizePhoneNumber('(416)884-3206')
// sanitizePhoneNumber('416 884 3206')
// sanitizePhoneNumber('416.884.3206')
// sanitizePhoneNumber('416+884g3206')
// sanitizePhoneNumber('416/884/3206')

// Data
// - Input => String -- Phone number to be cleaned up
// - Output => String -- Only digits of provided number (assuming valid)

// Algorithm
// 1. Check for any invalid characters
//  - Return '0000000000' if any found
// 2. Remove any superfluous chars
//  - .replace(/[(). -], '')
// 3. Check for string length
//  - If over 11 or under 10 return '0000000000'
// 4. Check if first digit is '1'
//  - If yes, drop it and contiue
//  - If no, return '0000000000'
// 5. Return string of 10 digits

const BAD_NUMBER = '0000000000';

function sanitizePhoneNumber(inputString) {
  if (/[^0-9() -.]/.test(inputString)) return BAD_NUMBER;
  inputString = inputString.replace(/[() -.]/g, '');
  let length = inputString.length;
  if (length < 10 || length > 11) return BAD_NUMBER;
  if (length === 10) {
    return inputString;
  } else if (inputString[0] === '1') {
    return inputString.slice(1);
  } else {
    return BAD_NUMBER;
  }
}

console.log(
  sanitizePhoneNumber('4169875544'),
  sanitizePhoneNumber('14169875544'),
  sanitizePhoneNumber('124169875544'),
  sanitizePhoneNumber('44169875544'),
  sanitizePhoneNumber('(416)987-5544'),
  sanitizePhoneNumber('416 987 5544'),
  sanitizePhoneNumber('416.987.5544'),
  sanitizePhoneNumber('416+987g5544'),
  sanitizePhoneNumber('416/987/5544'),
);

// End 12:32
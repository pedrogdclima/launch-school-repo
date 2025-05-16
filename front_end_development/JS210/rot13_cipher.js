// Rot13 ("rotate by 13 places") is a letter-substitution cipher
// that translates a String into a new String.

// For each character in the original String:

// - If the character is a letter in the modern English alphabet,
// change it to the character 13 positions later in the alphabet. Thus,
// a becomes n. If you reach the end of the alphabet, return
// to the beginning. Thus, o becomes b.
// - Letter transformations preserve case. A becomes N while a becomes n.
// - Don't modify characters that are not letters.
// Write a Function, rot13, that takes a String and returns that
// String transformed by the rot13 cipher.

// Write a Function, rot13, that takes a String and returns that
// String transformed by the rot13 cipher.

// A => 65
// Z => 90
// a => 97
// z => 122

const UPPERCASE_A = 65;
const UPPERCASE_Z = 90;
const LOWERCASE_A = 97;
const LOWERCASE_Z = 122;
const ABC_LENGTH = 26;
const ROT_NUM = 13;

function rot13(string) {
  let cipher = '';
  let currentCharCode;
  let newChar;
  for (let i = 0; i < string.length; i++) {
    currentCharCode = string.charCodeAt(i);
    if (!isCodeForLetter(currentCharCode)) {
      cipher += string[i];
    } else {
      newChar = String.fromCharCode(rotateCode(currentCharCode));
      cipher += newChar;
    }
  }

  return cipher;
}

function isCodeForLetter(code) {
  return isUpperLetter(code) || isLowerLetter(code);
}

function isUpperLetter(code) {
  return code >= UPPERCASE_A && code <= UPPERCASE_Z;
}

function isLowerLetter(code) {
  return code >= LOWERCASE_A && code <= LOWERCASE_Z;
}

function rotateCode(code) {
  let baseNum;
  let newCharCode;
  baseNum = isLowerLetter(code) ? LOWERCASE_A : UPPERCASE_A;
  newCharCode = (code - baseNum + ROT_NUM) % ABC_LENGTH;
  return newCharCode + baseNum;
}

console.log(rot13('Hello World!'));
console.log(rot13('AbCdE!'));
console.log(rot13(rot13('AbCdE!')));
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
  return code >= 65 && code <= 90;
}

function isLowerLetter(code) {
  return code >= 97 && code <= 122;
}

function rotateCode(code) {
  if (isLowerLetter(code)) {
    code += 13;
    if (code > 122) code -= 26;
  } else {
    code += 13;
    if (code > 90) code -= 26;
  }
  return code;
}

console.log(rot13('Hello World!'));
console.log(rot13('AbCdE!'));
console.log(rot13(rot13('AbCdE!')));
// Write a function that takes two arguments:
// - a string to be split
// - a delimiter character

// You may use the square brackets ([]) to access a character by
// index, and the length property to find the string length. However,
// you may not use any other properties or methods from JavaScript's
// built-in String class.

function splitString(string, delimiter) {
  let substring = '';
  for (i = 0; i < string.length; i++) {
    if (delimiter === '') {
      console.log(string[i]);
    } else if (string[i] === delimiter) {
      console.log(substring);
      substring = '';
    } else {
      substring += string[i];
    }
  }
  if (!!substring) console.log(substring);
}

splitString('hello world', ' ');
splitString('a|b|c', '|');

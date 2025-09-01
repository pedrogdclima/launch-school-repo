/*
Write a function called swap that takes a string as an argument, and returns a new string, where the alphabetic characters have taken the place of the numeric characters, and vice versa.

Start Time 4:03

Problem
- For a given string swap the positions of alphabetic characters and numeric characters. Characters that are neither, stay put.
- If you have more characters of one type than the other, the left overs are left unswapped.

Examples/Test Cases
See below

Data
- Input => One string containing any number of mixed characters
- Output => One string

Algorithm
- Iterate over string
  - If char is a letter add it to a list of letters to be swapped
  - If char is a number add it to a list of numbers to be swapped
- Iterate over string a second time
  - If a letter, replace it with the first number from the list of numbers
  - If a number, replace it with the first letter from the list of letters
  - If neither, keep if unchanged
*/

function swap(str) {
  let lettersArray = [];
  let numbersArray = [];
  for (let char of str) {
    if (/[A-Za-z]/.test(char)) lettersArray.push(char);
    if (/\d/.test(char)) numbersArray.push(char);
  }

  let swappedStr = '';
  for (let char of str) {
    if (/[A-Za-z]/.test(char)) {
      if (numbersArray.length == 0) {
        swappedStr += char;
      } else {
        swappedStr += numbersArray.shift();
      }
    } else if (/\d/.test(char)) {
      if (lettersArray.length == 0) {
        swappedStr += char;
      } else {
        swappedStr += lettersArray.shift();
      }
    } else {
      swappedStr += char;
    }
  }

  return swappedStr;
}

console.log(swap("1a2b3c") === "a1b2c3"); // true
console.log(swap("abcd123") === "123dabc"); // true
console.log(swap("") === ""); // true
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true
console.log(swap("123-4a#b$") === "ab3-41#2$"); // true
console.log(swap("ab1CD23") === "12a3DbC"); // true
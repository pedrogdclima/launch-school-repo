// Write a program that asks the user to enter an integer greater than 0,
// then asks if the user wants to determine the sum or the product of all
// numbers between 1 and the entered integer, inclusive.

const readline = require('readline-sync');

console.log('Enter an integer greater than 0');
let endtInt = Number(readline.prompt());
console.log('Would you like to sum (\"s\") or to multiply (\"m\")?')
let option = readline.prompt();
let result = 1;
for (let idx = 2; idx <= endtInt; idx += 1) {
  if (option === 's') {
    result += idx;
  } else if (option === 'm') {
    result *= idx;
  } else {
    console.log('Error')
    process.exit();
  }
}
console.log('The result is ' + result);

// Further Exploration
// What if the input was an array of integers instead of just a single
// integer? How would your computeSum and computeProduct functions change?
// Given that the input is an array, how might you make use of the
// Array.prototype.reduce() method?

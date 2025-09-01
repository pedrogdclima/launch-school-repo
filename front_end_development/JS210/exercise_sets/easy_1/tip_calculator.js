// Create a simple tip calculator. The program should prompt for a bill
// amount and a tip rate. The program must compute the tip, and then log
// both the tip and the total amount of the bill to the console. You can
// ignore input validation and assume that the user will put in numbers.

const readline = require('readline-sync');

console.log("What is the bill's total?");
let billTotal = Number(readline.prompt());
console.log("What is the tip's percentage?");
let tipPercent = Number(readline.prompt());
let tipValue = billTotal * (tipPercent / 100);
console.log('The tip is $' + tipValue.toFixed(2));
console.log('The total is $' + (billTotal + tipValue).toFixed(2));

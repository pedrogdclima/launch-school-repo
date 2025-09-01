// Build a program that asks the user to enter the length and width of a
// room in meters, and then logs the area of the room to the console in
// both square meters and square feet.
 
// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the
// readlineSync.prompt method to collect user input.

const readline = require('readline-sync');

console.log('What is the rooms length in meters?');
let length = Number(readline.prompt());
console.log('What is the rooms width in meters?');
let width = Number(readline.prompt());
let areaFeet = ((length * width) * 10.7639).toFixed(2);
console.log(' The room is ' + areaFeet + ' square feet.');

// Further Exploration
// Modify the program so that it asks the user for the input type (meters
// or feet). Compute for the area accordingly, and log it and its conversion
// in parentheses.
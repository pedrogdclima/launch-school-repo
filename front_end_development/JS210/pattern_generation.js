// Write a function that takes a number of rows as the argument nStars
// and logs a square of numbers and asterisks. For example, if nStars
// is 7, log the following pattern:

// generatePattern(7);

// // console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567

// You may assume that nStars is greater than 1 and less than 10.

function generatePattern(number) {
  let integers = ''
  for (i = 1; i <= number; i++) {
    integers += (i % 10);
    console.log(integers.padEnd(number, '*'));
  }
}

generatePattern(11);

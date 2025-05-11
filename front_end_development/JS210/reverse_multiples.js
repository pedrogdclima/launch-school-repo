// Write a function logMultiples that takes one argument number.
// It should log all multiples of the argument between 0 and 100
// (inclusive) that are also odd numbers. Log the values in descending
// order.

// You may assume that number is an integer between 0 and 100.

function logMultiples(number) {
  for (i=100; i > 0; i--) {
    if (i % number == 0 && i % 2 != 0) {
      console.log(i);
    }
  }
}

// function oddNumbersFor(number) {
//   for (i = 1; i <= number; i--) {
//     if (i % 2 != 0) {
//       console.log(i);
//     }
//   }
// }

logMultiples(21);

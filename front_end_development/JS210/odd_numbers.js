// Write a function that takes a positive integer as an argument,
// and logs all the odd numbers from 1 to the passed in number
// (inclusive). All numbers should be logged on separate lines.

function oddNumbersFor(number) {
  for (i = 1; i <= number; i++) {
    if (i % 2 != 0) {
      console.log(i);
    }
  }
}

oddNumbersFor(10);

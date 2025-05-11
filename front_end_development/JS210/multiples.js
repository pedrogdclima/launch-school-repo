// Write a function that logs the integers from 1 to 100 (inclusive)
// that are multiples of either 3 or 5. If the number is divisible by
// both 3 and 5, append an "!" to the number.

function multiples(number) {
  for (i = 1; i <= number; i++) {
    let multOf3 = ((i % 3) == 0);
    let multOf5 = ((i % 5) == 0);
    if (multOf3 && multOf5) {
      console.log(String(i) + '!');
    } else if (multOf3 || multOf5) {
      console.log(i);
    }
  }
}

multiples(100);
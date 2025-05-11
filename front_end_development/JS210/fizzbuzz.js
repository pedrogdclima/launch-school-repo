// Write a function that iterates over the integers from 1 to 100,
// inclusive. For multiples of three, log "Fizz" to the console. For
// multiples of five, log "Buzz". For numbers which are multiples of
// both three and five, log "FizzBuzz". For all other numbers, log
// the number.

function fizzBuzz() {
  for (i = 1; i < 101; i++) {
    multOf3 = i % 3 == 0
    multOf5 = i % 5 == 0
    if (multOf5 && multOf3) {
      console.log('FizzBuzz');
    } else if (multOf5) {
      console.log('Buzz');
    } else if (multOf3) {
      console.log('Fizz');
    } else {
      console.log(i);
    }
  }
}

fizzBuzz();

// function isPrime(number) {
//   result = true
//   for (i = 2; i < number; i++) {
//     if (number % i == 0) {
//       result = false;
//       break;
//     }
//   }
//   console.log(result);
// }

function isPrime(number) {
  if (number < 2) { return false; }
  if (number % 2 == 0) { return false; }
  div = 3;
  while (div < number) {
    if (number % div == 0) {
      return false;
    }
    div += 2;
  }
  return true;
}

console.log(isPrime(8));

// Write a function named checkGoldbach that uses Goldbach's Conjecture
// to log every pair of primes that sum to the number supplied as an
// argument. The conjecture states that "you can express every even
// integer greater than 2 as the sum of two primes". The function takes
// as its only parameter, an integer expectedSum, and logs all
// combinations of two prime numbers whose sum is expectedSum. Log the
// prime pairs with the smaller number first. If expectedSum is odd or
// less than 4, your function should log null.

// Your checkGoldbach function may call the isPrime function you wrote
// for a previous practice problem.

function checkGoldbach(number) {
  console.log('Goldbach Numbers for ' + number + ':');
  if (number < 4 || number % 2 != 0) {
    console.log(null);
    return;
  }
  let minusI;
  for (i = 1; i <= (number / 2); i++) {
    minusI = number - i;
    if (isPrime(i) && isPrime(minusI)) {
      console.log(i + ' ' + minusI);
    }
  }
}

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

checkGoldbach(6);
checkGoldbach(3);
checkGoldbach(12);
checkGoldbach(50);

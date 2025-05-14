// Create a function that computes the Greatest Common Divisor of
// two positive integers.

function gcd(num1, num2) {
  if (num1 === num2) return 'Identical numbers provided';
  let smNum;
  let lgNum;
  if (num1 > num2) {
    smNum = num2;
    lgNum = num1;
  } else {
    smNum = num1;
    lgNum = num2;
  }

  for (i = smNum; i > 0; i--) {
    if (lgNum % i === 0 && smNum % i === 0) return i;
  }
}

console.log(gcd(15, 89));

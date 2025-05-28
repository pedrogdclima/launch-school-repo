// Write a Function named octalToDecimal that performs octal to decimal conversion. When invoked on a String that contains the representation of an octal number, the Function returns a decimal version of that value as a Number. Implement the conversion yourself: do not use something else to perform the conversion for you.

function octalToDecimal(numberString) {
  let sum = 0
  let length = numberString.length;
  [...numberString].forEach((digit, idx) => {
    let power = length - idx - 1
    sum += Number(digit) * 8 ** power;
  });
  return sum;
}
console.log([
  octalToDecimal('1'),           // 1
  octalToDecimal('10'),          // 8
  octalToDecimal('130'),         // 88
  octalToDecimal('17'),          // 15
  octalToDecimal('2047'),        // 1063
  octalToDecimal('011')         // 9
]);
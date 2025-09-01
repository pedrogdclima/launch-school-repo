/*
Note: This is a hard problem that exceeds the level of difficulty you'll see in our assessments or in technical interviews.

You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

- "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
- "1-3, 1-2" --> 1, 2, 3, 11, 12
- "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
- "104-2" --> 104, 105, ... 112
- "104-02" --> 104, 105, ... 202
- "545, 64:11" --> 545, 564, 565, .. 611

Start Time => 3:51

Problem
- For a given string of digits, which may include separators to indicate an inclusive range, return an array of the integers alluded to in the input
- Numbers, and ranges are separated by commas
- Ranges are indicated with the used of either -, :, or ..
- Numbers are also described in a shorthand format which works since they are always given in acending order

Examples/Test Cases
- "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
- "1-3, 1-2" --> 1, 2, 3, 11, 12
- "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
- "104-2" --> 104, 105, ... 112
- "104-02" --> 104, 105, ... 202
- "545, 64:11" --> 545, 564, 565, .. 611

Data
- Input => String of numbers, commas, separators
- Output => Array of integers

Algorithm
- Iterate through string

*/

function writeInFull(previous, current) {
  let numOfDigits = current.length;
  current = [...current].reverse();
  
  current = Number([...previous].reverse().map( (digit, idx) => {
    if (current[idx] !== undefined) return current[idx];
    return digit;
  }).reverse().join(''));

  while (current < Number(previous)) {
    current += 10 ** numOfDigits;
  };
  return current;
}

function parseShortHandNumbers(digitsString) {
  let digitsArray = digitsString.split(', ');

  let numbersArray = [];
  
  digitsArray.forEach( (digit, index, array) => {
    let prevDigit = numbersArray[index - 1];

    if (/[-:]|(\.{2})/.test(digit)) {
      numbersArray.push(digit);
    } else if (prevDigit === undefined) {
      numbersArray.push(Number(digit));
    } else {
      digit = writeInFull(String(prevDigit), digit);
      numbersArray.push(digit);
    }
    // console.log(prevDigit, digit);
  });

  console.log(numbersArray);
  // let integerArray = [];

  // digitsString.split(', ')

  // return integerArray;
}

// console.log(writeInFull('1005', '01'));
// console.log(parseShortHandNumbers("101, 122, 1"));

console.log(parseShortHandNumbers("102, 01"))
console.log(parseShortHandNumbers("1, 3, 7, 2, 4, 1"));
// // 1, 3, 7, 12, 14, 21
console.log(parseShortHandNumbers("1-3, 1-2"));
// // 1, 2, 3, 11, 12
console.log(parseShortHandNumbers("1:5:2"));
// // 1, 2, 3, 4, 5, 6, ... 12
// console.log(parseShortHandNumbers("104-2"));
// // 104, 105, ... 112
// console.log(parseShortHandNumbers("104-02"));
// // 104, 105, ... 202
console.log(parseShortHandNumbers("545, 64:11"));
// // 545, 564, 565, .. 611

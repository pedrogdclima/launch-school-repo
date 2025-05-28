// Write a function named myOwnEvery that's similar to the Array.prototype.every method. It should take an array and a function as arguments, and return true if every element passed to the function evaluates as truthy.

function myOwnSome(array, func) {
  let output = false;
  array.forEach( element => {
    if (func(element)) {
      output = true;
      return;
    }
  });
  return output;
}

function myOwnEvery(array, func) {
  let output = true;
  array.forEach( element => {
    if (!func(element)) {
      output = false;
      return;
    }
  });
  return output;
}

let isAString = value => typeof value === 'string';
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));  // true
console.log(myOwnEvery(['a', 1, '1abc'], isAString));  // false
console.log(myOwnSome([[], 1, '1abc'], isAString));   // true
console.log(myOwnSome([1, 2, []], isAString));   // false
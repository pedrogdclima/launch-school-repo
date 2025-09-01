// Write a function that takes 5 string arguments, and returns an object
// with 3 properties:

// first: the first argument
// last: the last argument
// middle: the middle 3 arguments as a sorted array

// After writing the function, write some code to call the function.
// The arguments you provide should come from an array. You should
// create local variables named first, last, and middle from the return
// value.

// Use shorthand syntax wherever you can.

const myFunc = function myFunc(first, ...middle) {
  let last = middle.pop();
  let obj = { first, last, middle};
  return obj;
}
let array = ['a', 'b', 'c', 'd', 'e']
let { first, last, middle } = myFunc(...array);

console.log(first, last, middle);
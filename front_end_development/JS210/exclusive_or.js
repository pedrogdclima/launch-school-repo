// For boolean values, the || operator returns true if either or both
// of its operands are true, false if both operands are false. The &&
// operator, on the other hand, returns true if both of its operands
// are true, and false if either operand is false. This works great
// until you need only one of two conditions to be true, the so-called
// "exclusive or", or XOR.

// Write a function named isXor that takes two arguments, and returns
// true if exactly one argument is truthy, false otherwise. Your function
// should work with the boolean values of true and false, but also any
// JavaScript values based on their "truthiness".

function isXor(bool1, bool2) {
  bool1 = !!bool1;
  bool2 = !!bool2;
  if ((bool1 == true && bool2 == false) || (bool1 == false && bool2 == true)) {
    return true;
  } else {
    return false;
  }
}

console.log(isXor(true, false)); // true
console.log(isXor(true, true)); // false
console.log(isXor(false, false)); // false
console.log(isXor(false, true)); // true
console.log(isXor(0, '0')); // true
console.log(isXor(0, '')); // false
console.log(isXor(0, 1)); // true
console.log(isXor([], '0')); // false
console.log(isXor([], '')); // true

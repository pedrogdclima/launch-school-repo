// Write a Function named myForEach that is similar to the built-in Array.prototype.forEach method. Your Function should take an array and another Function as arguments. The Function passed to myForEach should reassign a variable in the outer scope. For instance, in the code fragment below, the Function passed to myForEach reassigns the min variable.

function myForEach(array, func) {
  for (let idx = 0; idx < array.length; idx += 1) {
    func(array[idx], idx, array);
  }
}


let numbers = [4, 5, 12, 23, 3];
let min = Infinity;
let max = 0;
let getMin = value => (min = value <= min ? value : min);
let getMax = value => (max = value >= max ? value : max);
myForEach(numbers, getMin);
myForEach(numbers, getMax);
console.log(min); // 3
console.log(max); // 23
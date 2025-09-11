// Create a processNTimes function that takes an array of numbers, a callback, and a number, n, as an argument. The function should utilize the processDataPromise function we wrote before and apply it to the input array of numbers n times. Here's an example:

// Example usage:
// const squareIt = (n) => n * n;
// processNTimes([1, 2, 3], squareIt, 3);
// After 3 seconds, logs: [1, 256, 6561]

// We get our resulting array because after the first invocation of processDataPromise, [1, 2, 3] becomes [1, 4, 9] ([1*1, 2*2, 9*9]). After the second, it becomes [1, 16, 81], and finally after the third processing, it becomes [1, 256, 6561].

// Here's the processDataPromise function that we wrote for a previous exercise:

function processDataPromise(numbers, callback) {
  return new Promise((resolve) => {
    setTimeout(() => {
      const processed = numbers.map(callback);
      resolve(processed);
    }, 1000);
  });
}

// function processNTimes(array, callback, n) {
//   if (n <= 0) return array;
//   array = array.map(callback);
//   return processNTimes(array, callback, n - 1);
// }

async function processNTimes(array, callback, n) {
  if (n <= 0) return array;
  newArrayPromise = await processDataPromise(array, callback);
  return processNTimes(newArrayPromise, callback, n - 1);
}

const squareIt = (n) => n * n;
processNTimes([1, 2, 3], squareIt, 3).then(console.log);

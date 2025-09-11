// Implement a function timeoutPromise(promise, ms) that takes a promise and a timeout duration in milliseconds. If the promise resolves before the timeout, return its result. Otherwise, reject with the message "Operation timed out".

// You can use the loadData function, which takes one second to resolve or reject, to test out your method.

// // Example usage:
// timeoutPromise(loadData(), 500)
//   .then(console.log)
//   .catch(console.error);
// // Expected output: "Operation timed out" (because it exceeds 500ms)

function loadData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve("Data loaded");
      } else {
        reject("Network error");
      }
    }, 250);
  });
}

function timeoutPromise(promise, ms) {
  let timeout = new Promise((_, reject) => {
    setTimeout(reject, ms, 'Process timed out')
  });
  return Promise.race([
    promise,
    timeout
  ]);
}

timeoutPromise(loadData(), 200)
  .then(console.log)
  .catch(console.log);

// console.log(Promise.resolve('test'))
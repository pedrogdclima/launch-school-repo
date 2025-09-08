// You have multiple instances of flakyService promises. Implement a strategy using Promise.allSettled() to execute all services but log all the different outcomes, whether fulfilled or rejected.


function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

const services = [flakyService(), flakyService(), flakyService()];

function logPromise(promise) {
  console.log(promise.value || promise.reason);
}

Promise.allSettled(services)
       .then((results) => results.forEach(logPromise));
// Write an async function to provide the same behavior as our promise chain in this code:

function operation() {
  return new Promise((resolve) => {
    console.log("Operation started");
    setTimeout(() => {
      resolve("Operation complete");
    }, 1000);
  });
}

// operation()
//   .then(console.log)
//   // Logs: Operation complete
//   .finally(() => {
//     console.log("Cleaning up resources...");
//     // Always logs after operation completion
//   });

async function callOperation() {
  let result;
  try {
    result = await operation();
    console.log(result);
  } catch (error) {
    console.error(error);
  } finally {
    console.log("Cleaning up resources...");
  }
}

callOperation();

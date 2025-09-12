// Update retryOperation to use async / await:

// function retryOperation(operationFunc) {
//   let attempts = 0;

//   function attempt() {
//     return operationFunc().catch((err) => {
//       if (attempts < 2) {
//         attempts++;
//         console.log(`Retry attempt #${attempts}`);
//         return attempt();
//       } else {
//         throw err;
//       }
//     });
//   }

//   return attempt().catch(() => console.error("Operation failed"));
// }

// async function retryOperation(operationFunc, n) {
//   let attempts = 0;

//   async function attempt() {
//     let result;
//     try {
//       if (attempts < n) {
//         result = await operationFunc();
//         console.log(result);
//       } else {
//         throw new Error('Out of attempts!');
//       }
//     } catch (e) {
//       if (e instanceof Error) {
//         console.error(e);
//       } else {
//         attempts++;
//         console.log(`Retry attempt #${attempts}`);
//         return attempt();
//       }
//     }
//   }
//   return attempt();
// }

function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

retryOperation(flakyService, 2);

// LS solution which separated the try/catch for a single attempt from the try/catch for the excessive number of attempts

async function retryOperation(operationFunc, n) {
  let attempts = 0;

  async function attempt() {
    try {
      return await operationFunc();
    } catch (e) {
      console.log(e);
      if (attempts < n) {
        attempts++;
        console.log(`Retry attempt #${attempts}`);
        return attempt();
      } else {
        throw e;
      }
    }
  }

  try {
    console.log(await attempt());
  } catch (e) {
    console.error('Out of attempts!');
  }
}
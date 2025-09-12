// When learning about promises, We wrote a flakyService function and used then and catch to manage its result. Now, rewrite the code that calls flakyService to use async / await instead. Don't change the flakyService function itself.

function flakyService() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Operation successful");
    } else {
      reject("Operation failed");
    }
  });
}

// flakyService().then(console.log).catch(console.error);

async function requestService() {
  let request;
  try {
    request = await flakyService();
    console.log(request);
  } catch (error) {
    console.error(error);
  }
}

requestService();
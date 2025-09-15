// Rewrite loadData to use async / await. Then, show how we would utilize the function instead of the existing call to then:

/*
function loadData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve("Data loaded");
      } else {
        reject("Network error");
      }
    }, 1000);
  }).catch(() => {
    console.error("An error occurred. Attempting to recover...");
    // Return a recovery promise
    return Promise.resolve("Using cached data");
  });
}

loadData().then(console.log);
// Logs "Data loaded" or "Using cached data"
*/

async function loadData() {
  try {
    return await new Promise((resolve, reject) => {
      setTimeout(() => {
        if (Math.random() > 0.5) {
          resolve("Data loaded");
        } else {
          reject("Network error");
        }
      }, 1000);
    })
  } catch (e) {
    console.log(e);
    console.log("An error occurred. Attempting to recover...");
    return "Using cached data";
  }
}

(async function () {
  let result = await loadData();
  console.log(result);
})();

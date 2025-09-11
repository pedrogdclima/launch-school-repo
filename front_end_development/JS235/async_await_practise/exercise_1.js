// Convert the downloadFilePromise function you saw previously to an asynchronous function named asyncDownloadFile. Utilize await to pause execution until the file download completes before logging the success message.

function downloadFilePromise() {
  return new Promise((resolve) => {
    console.log("Downloading file...");
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500);
  });
}

async function asyncDownloadFile() {
  function downloadFile() {
    return new Promise(resolve => {
      setTimeout(resolve, 1000, 'Download complete!');
    });
  }

  console.log('Downloading file...');
  let file = await downloadFile();
  return file;
}

asyncDownloadFile().then(console.log);

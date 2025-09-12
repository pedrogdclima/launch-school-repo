// Expand upon the previous problem to demonstrate that async functions are non-blocking. Write another makeCoffee function that should start a pot of coffee before we start getting ready for the day. After some delay, we should signal that the coffee is ready.

async function breakfast() {
  return new Promise( resolve => {
    console.log('Eating breakfast...');
    setTimeout(resolve, 2000);
  });
}

async function cleanup() {
  return new Promise( resolve => {
    console.log('Washing face...');
    setTimeout(resolve, 1000);
  })
}

async function makeCoffee() {
  console.log('Grinding beans...');
  setTimeout(console.log, 500, 'Brewing coffee...');
  return new Promise(resolve => {
    // console.log('Brewing coffee...');
    setTimeout(() => {
      console.log('Drinking coffee...');
      resolve();
    }, 3500)
  });
}

async function getReady() {
  makeCoffee();
  await breakfast();
  await cleanup();
}

getReady().finally(() => console.log('Ready for the day'));

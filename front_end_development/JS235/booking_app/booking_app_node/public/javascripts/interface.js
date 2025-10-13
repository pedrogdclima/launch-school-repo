import templates from "./templates.js";

const LoadingText = '<p>Fetching data from server!</p>';
const NoMatch = '<p>No matching data!</p>';

let display;

async function main() {

}

async function handleButton(event) {
  let func = event.target.getAttribute('name');
  if (!func) return;
  display.innerHTML = LoadingText;
  try {
    let response = await limitWaiting(fetch('/api/schedules'), 5000);
    let data = await response.json();
    if (data.length === 0) {
      display.innerHTML = NoMatch;
    } else {
      display.innerHTML = templates.schedulesByStaff(data);
    }
  } catch (error) {
    display.innerHTML = `<p>${error.message}</p>`;
  }

  //  finally {
  //   alert('Complete');
  // }
}

function limitWaiting(apiCall, delay) {
  return Promise.race([apiCall, new Promise((_, reject) => {
    setTimeout(() => {
      reject(new Error ('Timeout Error: Server took too long to respond'));
    }, delay);
  })]);
}

document.addEventListener('DOMContentLoaded', () => {
  display = document.getElementById('display');
  main();
  document.getElementById('buttons').addEventListener('click', handleButton);
});
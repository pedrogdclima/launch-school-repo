import templates from "./templates.js";

const LoadingText = '<p>Fetching data from server!</p>';
const NoMatch = '<p>No matching data!</p>';

let display;

async function handleButton(event) {
  let func = event.target.getAttribute('name');
  if (!func) return;
  switch (func) {
    case 'availableSchedules':
      availableSchedules();
      break;
    case 'addStaff':
      addStaff();
      break;
  }
}

async function availableSchedules() {
  try {
    display.innerHTML = LoadingText;
    let response = await limitWaiting(fetch('/api/schedules'), 5000);
    let data = await response.json();
    if (data.length === 1) {
      display.innerHTML = NoMatch;
    } else {
      display.innerHTML = templates.schedulesByStaff(data);
    }
  } catch (error) {
    display.innerHTML = `<p>${error.message}</p>`;
  }
}

function limitWaiting(apiCall, delay) {
  return Promise.race([apiCall, new Promise((_, reject) => {
    setTimeout(() => {
      reject(new Error ('Timeout Error: Server took too long to respond'));
    }, delay);
  })]);
}

function addStaff() {
  display.innerHTML = templates.addStaffForm();
}

async function handleSubmit(event) {
  event.preventDefault();
  let form = event.target;
  let formData = new FormData(form);
  let json = JSON.stringify(Object.fromEntries(formData.entries()));

  let response = await fetch(form.action, {
    method: form.method,
    headers: {
      'Content-Type': 'application/json'
    },
    body: json,
  });

  switch (response.status) {
    case 201:
      let data = await response.json();
      display.innerHTML = `<p>Staff (id: ${data.id}) added successfuly</p>`
      break;
    case 400:
      alert(await response.text());
      break;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  display = document.getElementById('display');
  document.getElementById('buttons').addEventListener('click', handleButton);
  document.addEventListener('submit', handleSubmit);
});

// event.preventDefault();
  // let form = event.target;
  // let data = new FormData(form);
  // if (Array.from(data.values()).includes('')) {
  //   alert('Invalid form');
  //   return;
  // }

  // console.log(Array.from(data.values()));
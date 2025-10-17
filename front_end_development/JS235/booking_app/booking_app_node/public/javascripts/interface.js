import templates from "./templates.js";

const LoadingText = '<p>Fetching data from server!</p>';
const NoMatch = '<p>No matching data!</p>';
const SuccessMessage = '\nOperation Successful';

let display;
let addScheduleNode;
let staffData;
let scheduleData;

async function handleButton(event) {
  let func = event.target.getAttribute('name');
  if (!func) return;
  switch (func) {
    case 'availableSchedules':
      displayAvailableSchedules();
      break;
    case 'addStaff':
      displayAddStaffForm();
      break;
    case 'addSchedule':
      displayAddScheduleForm();
      break;
    case 'bookSchedule':
      displayBookScheduleForm();
      break;
    case 'allStudents':
      logAllStudents();
      break;
    case 'allBookings':
      displayAllBookings();
      break;
    case 'cancelBooking':
      displayCancelBookingForm();
      break;
    case 'cancelSchedule':
      displayCancelScheduleForm();
      break;
  }
}

async function displayCancelScheduleForm() {
  scheduleData = await fetchScheduleData();
  staffData = await fetchStaffData();
  let scheduleOptions = templates.renderScheduleOptions(availableScheduleOptions());
  display.innerHTML = templates.renderCancelScheduleForm(scheduleOptions);
}

async function displayCancelBookingForm() {
  scheduleData = await fetchScheduleData();
  staffData = await fetchStaffData();
  let bookingOptions = templates.renderScheduleOptions(bookedScheduleOptions());
  display.innerHTML = templates.renderCancelBookingForm(bookingOptions);
}

async function displayAllBookings() {
  let datesResponse = await fetch('/api/bookings');
  let dates = await datesResponse.json();
  let allBookings = await Promise.all(dates.map(date => {
    return fetch(`/api/bookings/${date}`).then(response => response.json());
  }));
  let bookingsByDate = dates.map((date, index) => {
    return {
      date,
      bookings: allBookings[index],
    }
  });
  display.innerHTML = templates.renderBookingsByDate(bookingsByDate);
}

async function logAllStudents() {
  let response = await fetch('/api/students');
  let json = await response.json();
  json.map(({ email, name }) => `${name}: ${email}`)
      .forEach(stu => console.log(stu));
}

async function displayBookScheduleForm() {
  try {
    display.innerHTML = LoadingText;
    scheduleData = await fetchScheduleData();
    staffData = await fetchStaffData();
    if (scheduleData.length === 0) {
      display.innerHTML = NoMatch;
      return;
    }
    display.innerHTML = bookScheduleForm();
  } catch (error) {
    console.error(error);
    return;
  }
}

function bookScheduleForm() {
  let html;
  let data = availableScheduleOptions();
  let scheduleOptions = templates.renderScheduleOptions(data);
  html = templates.renderBookScheduleForm(scheduleOptions);
  return html;
}

function bookedScheduleOptions() {
  return scheduleData
          .filter(schedule => schedule.student_email !== null)
          .map( ({ id, staff_id, _2, date, time }) => {
          let name = staffData.find(staff => staff.id === staff_id).name
          return {
            id,
            name,
            date,
            time,
          };
          });
}

function availableScheduleOptions() {
  return scheduleData
          .filter(schedule => schedule.student_email === null)
          .map( ({ id, staff_id, _2, date, time }) => {
          let name = staffData.find(staff => staff.id === staff_id).name
          return {
            id,
            name,
            date,
            time,
          };
          });
}

async function displayAddScheduleForm() {
  try {
    staffData = await fetchStaffData();
    display.innerHTML = templates.addScheduleSetup();
    addScheduleNode = document.getElementById('schedules');
    document.getElementById('btnMore')
            .addEventListener('click', insertMoreScheduleFields);
    insertMoreScheduleFields();
  } catch (error) {
    display.innerHTML = `<p>${error.message}</p>`;
  }
}

async function fetchStaffData() {
  let response = await limitWaiting(fetch('/api/staff_members'), 5000);
  return await response.json();
}

async function fetchScheduleData() {
  let response = await limitWaiting(fetch('/api/schedules'), 8000);
  return await response.json();
}

function insertMoreScheduleFields() {
  let formCount = addScheduleNode.querySelectorAll('fieldset').length;
  let staffOptions = templates.renderStaffOptions(staffData);
  let newFormSpace = templates.moreScheduleFields(formCount, staffOptions);
  addScheduleNode.insertAdjacentHTML('beforeend', newFormSpace);
}

async function displayAvailableSchedules() {
  try {
    display.innerHTML = LoadingText;
    let scheduleData = await fetchScheduleData();
    if (scheduleData.length === 0) {
      display.innerHTML = NoMatch;
    } else {
      display.innerHTML = templates.schedulesByStaff(scheduleData);
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

function displayAddStaffForm() {
  display.innerHTML = templates.addStaffForm();
}

function scheduleFormDataToJson(form) {
  let serializedData = [];
  form.querySelectorAll('fieldset').forEach((_, index) => {
    let count = index + 1;
    serializedData.push({
      'staff_id': form[`staff_${count}`].value,
      'date': form[`date_${count}`].value,
      'time': form[`time_${count}`].value,
    });
  });
  return {'schedules': serializedData};
}

function bookingFormDataToJson(form) {
  return {
    id: Number(form['schedule'].value),
    student_email: form['email'].value,
  }
}

function displayNewStudentForm(email, sequence) {
  display.insertAdjacentHTML(
    'beforeend', templates.renderNewStudentForm(email, sequence)
  );
}

function newStudentFormDataToJson(form) {
  return {
    email: form['email'].value,
    name: form['name'].value,
    booking_sequence: Number(form['booking_sequence'].value),
  };
}

async function handleSubmit(event) {
  event.preventDefault();
  let form = event.target;
  let response;
  let headers = {'Content-Type': 'application/json'};
  let body;
  let method = form.method;

  switch (form.id) {
    case 'addStaffForm':
      let formData = new FormData(form);
      body = JSON.stringify(Object.fromEntries(formData.entries()));
      break;
    case 'addScheduleForm':
      body = JSON.stringify(scheduleFormDataToJson(form));
      break;
    case 'bookScheduleForm':
      body = JSON.stringify(bookingFormDataToJson(form));
      break;
    case 'newStudentForm':
      body = JSON.stringify(newStudentFormDataToJson(form));
      break;
    case 'cancelScheduleForm':
      form.action += form['schedule'].value;
      method = 'delete';
      headers = {};
      body = null;
      break;
    case 'cancelBookingForm':
      form.action += form['booking'].value;
      method = 'put';
      headers = {};
      body = null;
      break;
  }

  response = await fetch(form.action, {
    method,
    headers,
    body,
  });

  let logMessage = `${response.statusText}\n${SuccessMessage}`;
  body = await response.text();

  switch (response.status) {
    case 200:
    case 201:
      if (form.id === 'newStudentForm') {
        let prevForm = form.previousElementSibling;
        prevForm.dispatchEvent(new Event('submit', {
          bubbles: true, cancelable: true
        }));
      }
    case 204:
      form.reset();
      console.log(logMessage);
      break;
    case 400:
    case 404:
      console.log(body);
      if (form.id === 'bookScheduleForm') {
        let sequence = body.match(/\d+/g)[0];
        displayNewStudentForm(form['email'].value, sequence);
      }
      break;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  display = document.getElementById('display');
  document.getElementById('buttons').addEventListener('click', handleButton);
  document.addEventListener('submit', handleSubmit);
});

const templates = {

  schedulesByStaff(schedule) {
    return (
      `<p>
        Staff ID: ${schedule.staff_id}, Schedule ID: ${schedule.id}
      </p>`
    );
  },

  schedules(scheduleArray) {
    return scheduleArray.map(schedule => this.schedule(schedule))
                        .join('');
  },

  schedulesByStaff(scheduleArray) {
    let groupedSchedules = scheduleArray.reduce((output, schedule) => {
      let staffId = schedule.staff_id;
      let count = output.find(count => count.staffId === staffId);
      if (count) {
        count.numOfSchedules += 1;
      } else {
        count = {};
        count.staffId = staffId;
        count.numOfSchedules = 1;
        output.push(count);
      }
      return output;
    }, []);

    return groupedSchedules.map(count => {
      return (`<p>Staff ID: ${count.staffId} has ${count.numOfSchedules} schedule(s)</p>`);
    }).join('');
  },

  serverTimeout() {
    return (`<p>Request timed out. Please try again.</p>`);
  },

  addStaffForm() {
    return `<form id="addStaffForm" method="post" action="/api/staff_members">
      <dl>
        <dt>
          <label for="email">Email</label>
        </dt>
        <dd>
          <input type="email" id="email" name="email">
        </dd>
        <dt>
          <label for="name">Name</label>
        </dt>
        <dd>
          <input type="text" id="name" name="name">
        </dd>
      </dl>
      <input type="submit">
    </form>`
  },

  moreScheduleFields(index, staffOptions) {
    index += 1;
    return `<fieldset id="schedule_${index}">
      <legend>Schedule ${index}</legend>

      <div>
        <label for="staff_${index}">Staff Name:</label>
        <select id="staff_${index}" name="staff_${index}">${staffOptions}</select>
      </div>

      <div>
        <label for="date_${index}">Date:</label>
        <input type="text" id="date_${index}" name="date_${index}" placeholder="mm-dd-yy">
      </div>

      <div>
        <label for="time_${index}">Time:</label>
        <input type="text" id="time_${index}" name="time_${index}" placeholder="hh:mm">
      </div>

    </fieldset>`;
  },

  addScheduleSetup() {
    return `<form id="addScheduleForm" method="post" action="/api/schedules">
      <div id="schedules"></div>
      <input id="btnSubmit" type="submit">
      <button type="button" id="btnMore">Add Another</button>
    </form>`;
  },

  renderStaffOptions(staffData) {
    return staffData.map( ({_1, name, _2}, index) => {
      return `<option value="${index + 1}">${name}</option>`
    }).join('');
  },

  renderBookScheduleForm(options) {
    return `<form id="bookScheduleForm" method="post" action="/api/bookings">
      <div>
        <label for="schedule">Select Schedule:</label>
        <select id="schedule" name="schedule">${options}</select>
      </div>
      <div>
        <label for="email">Student Email:</label>
        <input type="email" id="email" name="email">
      </div>
    <input type="submit">
    </form>`;
  },

  renderScheduleOptions(scheduleData) {
    return scheduleData.map( ({id, name, date, time }) => {
      return `<option value="${id}">${name} | ${date} | ${time}</option>`
    }).join('');
  },

  renderNewStudentForm(email, sequence) {
    return `<form id="newStudentForm" method="post" action="/api/students">
      <h3>Please provide new student details</h3>
      <label for="email">Email:</label>
      <input type="email" name="email" id="email" value="${email}">
      <label for="name">Name:</label>
      <input type="text" name="name" id="name">
      <label for="booking_sequence">Booking Sequence:</label>
      <input type="text" name="booking_sequence" id="booking_sequence" value="${sequence}">
      <input type="submit">
    </form>`;
  },

  renderBookingsByDate(data) {
    return data.map( date => {
      return `<p>${date.date}</p>` + date.bookings.map(booking => {
        return `<p>${booking.toString().replaceAll(',', ' - ')}</p>`;
      }).join('');
    }).join('');
  },

  renderCancelBookingForm(options) {
    return `<form id="cancelBookingForm" method="put" action="/api/bookings/">
      <div>
        <label for="booking">Select Booking:</label>
        <select id="booking" name="booking">${options}</select>
      </div>
    <input type="submit">
    </form>`;
  },

  renderCancelScheduleForm(options) {
    return `<form id="cancelScheduleForm" method="delete" action="/api/schedules/">
      <div>
        <label for="schedule">Select Schedule:</label>
        <select id="schedule" name="schedule">${options}</select>
      </div>
    <input type="submit">
    </form>`;
  },
};

export default templates;
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
    return `<form method="post" action="/api/staff_members">
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

  // photo({ id, src, caption }) {
  //   return (
  //     `<figure data-id="${id}">
  //        <img src="${src}" />
  //        <figcaption>${caption}</figcaption>
  //      </figure>`
  //   );
  // },

  // photos(photosArray) {
  //   return photosArray.map(photo => this.photo(photo)).join('');
  // },

  // photoInformation({ title, created_at, id, likes, favorites }) {
  //   return (`
  //   <h2>${title}</h2>
  //   <p><time>Taken on ${created_at}</time></p>
  //   <div class="actions">
  //     <a href="/photos/like" data-id="${id}" data-property="likes" class="button like">
  //       ♡ ${likes ? likes : 0} Likes
  //     </a>
  //     <a href="/photos/favorite" data-id="${id}" data-property="favorites" class="button favorite">
  //       ☆ ${favorites ? favorites : 0} Favorites
  //     </a>
  //   </div>
  //   `);
  // },

  // comment({ gravatar, name, date, body }) {
  //   return (`
  //     <li>
  //       <article>
  //         <figure>
  //           <img src="${gravatar}" />
  //         </figure>
  //         <header>
  //           <h1>${name}</h1>
  //           <p><small><time>Posted ${date}</time></small></p>
  //         </header>
  //         <p>${body}</p>
  //       </article>
  //     </li>
  //     `);
  // },

  // comments(commentsArray) {
  //   return commentsArray.map(comment => this.comment(comment)).join('');
  // },
};

export default templates;
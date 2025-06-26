/*
Create an object factory for a student object. The student object should have the following methods and it should produce the expected results demonstrated in the sample code:

- info: Logs the name and year of the student.
- addCourse: Enrolls student in a course. A course is an object literal that has properties for its name and code.
- listCourses: Returns a list of the courses student has enrolled in.
- addNote: Adds a note property to a course. Takes a code and a note as an argument. If a note already exists, the note is appended to the existing one.
- updateNote: Updates a note for a course. Updating a note replaces the existing note with the new note.
- viewNotes: Logs the notes for all the courses. Courses without notes are not displayed.
*/

function createStudent(name, year) {
  let courses = [];

  function findCourse(code) {
    return courses.find(course => course.code === code);
  }

  return {
    info() {
      console.log(`${name} is a ${year} year student`)
    },
    listCourses() {
      console.log(courses);
    },
    addCourse(course) {
      courses.push(course);
    },
    addNote(courseCode, note) {
      let course = findCourse(courseCode);
      let notes = course.notes;
      if (notes !== undefined && notes.length > 0) {
        course.notes += `; ${note}`;
      }
      else {
        course.notes = note;
      }
      // course.notes ? course.notes = note : course.notes += `; ${note}`;
    },
    updateNote(courseCode, note) {
      let course = findCourse(courseCode);
      course.notes = note;
    },
    viewNotes() {
      courses.forEach( course => {
        let notes = course.notes;
        if (notes !== undefined && notes.length > 0) {
          console.log(`${course.name}: ${notes}`);
        }
      })
    }
  }
}

let foo = createStudent('Foo', '1st');
foo.info();
// "Foo is a 1st year student"
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advance Math: Difficult subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"
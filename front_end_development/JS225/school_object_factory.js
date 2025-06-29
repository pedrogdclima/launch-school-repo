/*
Create a school object. The school object uses the same kind of student object as the previous exercise. It has methods that use and update information about the student. Be sure to check out the previous exercise for the other arguments that might be needed by the school object. Implement the following methods for the school object:

- addStudent: Adds a student by creating a new student and adding the student to a collection of students. The method adds a constraint that the year can only be any of the following values: '1st', '2nd', '3rd', '4th', or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".
- enrollStudent: Enrolls a student in a course.
- addGrade: Adds the grade of a student for a course.
- getReportCard: Logs the grades of a student for all courses. If the course has no grade, it uses "In progress" as the grade.
- courseReport: Logs the grades of all students for a given course name. Only student with grades are part of the course report.

To test your code, use the three student objects listed below. Using the three student objects, produce the following values from the getReportCard and courseReport methods respectively.
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

function makeSchool() {
  const validYears = ['1st', '2nd', '3rd', '4th', '5th'];
  let students = [];
  return {
    addStudent(name, year) {
      if (validYears.includes(year)) {
        students.push(createStudent(name, year));
      } else {
        console.log('Invalid \'year\' value!');
      }
    },
    enrollStudent(name, code) {
      
    },
    addGrade() {

    },
    getReportCard() {
      
    },
    courseReport() {

    },
  }
}

let mySchool = makeSchool();

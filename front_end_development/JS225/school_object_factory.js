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
    name,
    year,
    info() {
      console.log(`${name} is a ${year} year student`)
    },
    listCourses() {
      return courses;
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
  let students = {};
  function validateStudent(name) {
    if (!(name in students)) {
      console.log(`No student named '${name}' in system`);
      return false;
    };
    return true;
  };
  return {
    addStudent(name, year) {
      if (validYears.includes(year)) {
        return students[name] = createStudent(name, year);
      } else {
        console.log('Invalid \'year\' value!');
      }
    },
    enrollStudent(studentObj, courseObj) {
      studentObj.addCourse(courseObj);
    },
    addGrade(studentObj, courseName, grade) {
      let courseIdx = studentObj.listCourses()
                                .find(course => course.name === courseName);
      let course = studentObj.listCourses()[courseIdx];
      course.grade = grade;
    },
    getReportCard(student) {
      let courses = student.listCourses();
      console.log(`== ${student.name}'s Report Card ==`);
      courses.forEach( course => {
        console.log(`${course.name}: ${course.grade || 'In Progress'}`);
      });
    console.log(`== == == == == == == == == == == ==`);
    },
    courseReport() {

    },
  }
}

let mySchool = makeSchool();
let courseCatalogue = {
  math: {name: 'Math', code: '100'},
  biology: {name: 'Biology', code: '120'},
  chemistry: {name: 'Chemistry', code: '150'},
  english: {name: 'English', code: '101'},
}
let pedro = mySchool.addStudent('Pedro', '2nd');
mySchool.enrollStudent(pedro, courseCatalogue.math);
mySchool.addGrade(pedro, 'Math', '82');
mySchool.getReportCard(pedro);
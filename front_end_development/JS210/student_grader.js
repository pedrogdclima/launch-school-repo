// Write a program to determine a student’s grade based on the average
// of three scores you get from the user. Use these rules to compute
// the grade:

// If the average score is >= to 90 then the grade is 'A'
// If the average score is >= to 70 and less than 90 then the grade is 'B'
// If the average score is >= to 50 and less than 70 then the grade is 'C'
// If the average score is less than 50 then the grade is 'F'

// You may assume that all input values are valid positive integers.

const readlineSync = require('readline-sync');

function processResponse(input) {
  if (input === 'N') {
    return 'N';
  } else if (Number.isNaN(Number(input)) || input === '') {
    console.log('Invalid response\nTerminating program');
    process.exit();
  } else {
    return Number(input);
  }
}

function gradeStudent() {
  console.log('Welcome to Student Grader!');
  let goOn = true;
  let count = 1;
  let cgpa = 0;
  while (goOn) {
    console.log('Submit grade ' + count + '. ("N" to stop)');
    response = processResponse(readlineSync.prompt());
    if (response === 'N') {
      goOn = false;
      count -= 1;
    }
    else {
      cgpa += response;
      count += 1;
    }
  }

  cgpa = cgpa / count
  console.log(count + ' grades submitted');
  console.log('CGPA of ' + cgpa);
  if (cgpa >= 90) {
    console.log('Grade A');
  } else if (cgpa >= 70) {
    console.log('Grade B');
  } else if (cgpa >= 50) {
    console.log('Grade C');
  } else {
    console.log('Grade F');
  }
}

gradeStudent();

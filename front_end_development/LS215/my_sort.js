let studentGrades = [
  { name: 'StudentA', grade: 90.1 },
  { name: 'StudentB', grade: 92 },
  { name: 'StudentC', grade: 91.8 },
  { name: 'StudentD', grade: 95.23 },
  { name: 'StudentE', grade: 91.81 },
];

function compareGrades(student1, student2) {
  if (student1.grade < student2.grade) {
    return 1;
  } else if (student1.grade > student2.grade) {
    return -1;
  } else {
    return 0;
  }
}

function mySort(array, func) {
  let swapped;
  do {
    swapped = false;
    for (let idx = 0; idx < array.length - 1; idx += 1) {
      if (func(array[idx], array[idx + 1]) > 0) {
        [ array[idx + 1], array[idx] ] = [array[idx], array[idx + 1]];
        swapped = true;
      }
    }
  } while (swapped);
  return array;
}

console.log(mySort(studentGrades, compareGrades));

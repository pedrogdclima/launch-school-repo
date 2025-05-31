// Exams and Exercises
// Grading areas include exams and exercises, with the following weights:
// Grading Area	Weight:
//  - Exam	65%
//  - Exercises	35%

// Each term has four exams, and several exercises. Every exam has a fixed maximum score of 100, while exercises have varied maximum score values and counts. The total maximum point value for all exercises in any term is always 100, regardless of how many exercises the students had to complete. For example, a term may have five exercises with possible score maximums of [30, 20, 10, 20, 20] while another term may have three exercises with possible score maximums of [20, 30, 50].

// To determine a student's grade, we first determine the student's average score from the four exams, then sum all the exercise scores. We then apply the weights to compute the student's final percent grade. Finally, we determine the letter equivalent grade from the student's percent grade we just computed.

// Percent Grade  |  Letter Equivalent
// 93 - 100       |         A
// 85 - 92        |         B
// 77 - 84        |         C
// 69 - 76        |         D
// 60 - 68        |         E
// 0 - 59         |         F

const EXAM_WEIGHT = 0.65;
const EXERCISE_WEIGHT = 0.35;
const LETTER_GRADE = { A: 93, B: 85, C: 77, D: 69, E: 60, F: 0};

function generateClassRecordSummary(scores) {
  let studentGrades = [];
  let exams = [];
  for (let studentKey in scores) {
    let studentScores = scores[studentKey].scores;
    studentGrades.push(studentGrade(studentScores));
    studentScores.exams.forEach( (exam, idx) => {
      exams[idx] ? exams[idx].push(exam) : exams[idx] = [exam];
    })
  }
  exams = exams.map(scoresToStats);
  return { studentGrades, exams };
}

function studentGrade(scores) {
  let exerciseGrade = totalGrade(scores.exercises);
  let examGrade = averageScore(scores.exams);
  return calculateFinalGrade(examGrade, exerciseGrade);
}

function totalGrade(scores) {
  return scores.reduce(sumScores);
}

function sumScores(sum, score) { return sum + score };

function averageScore(scores) {
  return Math.round(scores.reduce(sumScores) / scores.length * 10) / 10;
}

function calculateFinalGrade(exam, exercise) {
  let finalGrade = Math.round(exam * EXAM_WEIGHT + exercise * EXERCISE_WEIGHT);
  return `${finalGrade} (${letterForPercent(finalGrade)})`;
}

function letterForPercent(number) {
  for (let letter in LETTER_GRADE) {
    if (LETTER_GRADE[letter] > number) continue;
    return letter;
  }
}

function scoresToStats(scores) {
  let average = averageScore(scores);
  let minimum = minScore(scores);
  let maximum = maxScore(scores);
  return { average, minimum, maximum };
}

function minScore(scores) {
  return scores.reduce((prevGrade, score) => {
    if (prevGrade > score) return score;
    return prevGrade;
  })
}

function maxScore(scores) {
  return scores.reduce((prevGrade, score) => {
    if (prevGrade < score) return score;
    return prevGrade;
  })
}

let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
// objectHasProperty

function objectHasProperty(object, property) {
  let keys = Object.keys(object);
  return keys.indexOf(property) !== -1;
  // return !(object[property] === undefined);
}

// let person = { fName: 'Pedro', age: 32 };

// console.log(objectHasProperty(person, 'age'));
// console.log(objectHasProperty(person, 'lName'));

// incrementProperty

function incrementProperty(object, property) {
  if (objectHasProperty(object, property)) {
    object[property] += 1;
  } else {
    object[property] = 1;
  }
  return object[property];
}

// let scoreBoard = { teamA: 0, teamB: 0 };
// incrementProperty(scoreBoard, 'teamA');
// incrementProperty(scoreBoard, 'teamA');
// incrementProperty(scoreBoard, 'teamC');
// console.log(scoreBoard);

// wordCount

function wordCount(string) {
  let stringArray = string.split(' ');
  let result = {};

  for (let i = 0; i < stringArray.length; i++) {
    if (result[stringArray[i]]) {
      result[stringArray[i]] += 1;
    } else {
      result[stringArray[i]] = 1;
    }
  }
  return result;
}

console.log(wordCount('box car cat bag box'));
console.log(wordCount('a b c a a e b a'));
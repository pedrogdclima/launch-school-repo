/*
Write a function that returns the position of the closest active opponent. If two opponents are equidistant, return the opponent with the higher position on the board.


Problem
- For a given object containing some number of opponents and their positions, return the position of the closest opponent
- There will always be an active opponent
- Return null if first argument is an empty object
- If there are equidistant opponents, return the largest value

Examples/Test Cases
- See Below

Data
- Input => Two argument
  1. Object containing opponents 'name' and position (positive integer value)
  2. Positive integer value representing players position
- Output => Cosest opponent positional value

Algorithm
- Check for empty first argument and return null
- Assign first k/p to new variable 'closestOppo'
- Iterate over array of first arguments keys array
- If Key's paired value is closer than current closest k/v pair, reassign
- Return value associated to key

*/

// function findClosestOpponent(oppoPositions, myPosition) {
//   if (Object.keys(oppoPositions).length === 0) return null;
//   let closestOppo = null;
//   // Object.keys(oppoPositions).forEach( key => {
//   //   if (closestOppo === null) {
//   //     closestOppo = key;
//   //     continue;
//   //   }
//   //   if () {
      
//   //   }
//   // });

//   for (let key in oppoPositions) {
//     if (closestOppo === null) {
//       closestOppo = key;
//       continue;
//     }
//     let prevDiff = myPosition - oppoPositions[closestOppo];
//     let currDiff = myPosition - oppoPositions[key];
//     if (Math.abs(currDiff) < Math.abs(prevDiff)) {
//       closestOppo = key;
//     }
//     if (Math.abs(currDiff) === Math.abs(prevDiff)) {
//       if (currDiff > prevDiff) {
//         closestOppo = key;
//       }
//     }
//   }
//   return oppoPositions[closestOppo];
// }

/*

Start Time 4:18

Problem
- For a given object containing opponents names and positions(integers) find the opponent with the closest position to yours and return their position.
- If there are two equidistant opponents, return the one with the larger integer for its position

Examples/Test Cases
- See Below

Data
- Input => One object, some number of property value pairs. Properties are opponents names, values are integers representing their position
- Output => Single integer
  - If there are no opponents in the object, return null

Algorithm
- We need the opponent with the smallest difference between their position and the provided position
  - Math.abs(playerPosition - opponentPosition)
  - Keep the property name with the smallest result for the expression above
    - If they are the same, keep the one with the largest opponentPosition

Code

- Check if object is empty, return null if so
- Create variable to hold on to closest position so far
- Iterate over object with for in loop

*/

function findClosestOpponent(opponents, playerPosition) {
  if (Object.keys(opponents).length === 0) return null;
  let closest = null;
  for (let key in opponents) {
    if (closest === null) {
      closest = {
        key,
        diff: Math.abs(playerPosition - opponents[key]),
      };
      continue;
    }
    let newDiff = Math.abs(playerPosition - opponents[key])
    if (closest.diff < newDiff) {
      continue;
    } else if (closest.diff > newDiff) {
      closest = {
        key,
        diff: newDiff,
      };
      continue;
    }
    // console.log('here', opponents[key], opponents[closest.key]);
    if (opponents[key] > opponents[closest.key]) {
      console.log('here');
      closest = {
        key,
        diff: newDiff,
      };
    }
  }
  return opponents[closest.key];
}

console.log(findClosestOpponent({
  "Opponent 1" : 1,
  "Opponent 2" : 15,
  "Opponent 3" : 37
}, 10)); // 15

console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5
}, 3)); // 5

console.log(findClosestOpponent({
  "Opponent 1a" : 1,
  "Opponent 1b" : 5,
  "Opponent 1c" : 50,
  "Opponent 1d" : 100,
  "Opponent 1e" : null
}, 150)); // 100

console.log(findClosestOpponent({

}, 74)); // null

console.log(findClosestOpponent({
  "Atlas" : 1,
  "Luna" : 15,
  "" : 37
}, 10)); // 15

console.log(findClosestOpponent({
  "Opponent 1a" : null,
  "Opponent 1b" : 5,
  "Opponent 1c" : null,
  "Opponent 1d" : null,
  "Opponent 1e" : 200,
  "Opponent 1f" : 400
}, 300)); // 400
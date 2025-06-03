// In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal. Positions on the board equate to coordinate numbers. Given a set up like so:

// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ W _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ B _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _

// The white queen's position equates to (2, 3) and the black queen is at (5, 6). In this example the queens are on the same diagonal, and therefore can attack each other.

// Write a function which, given a string representation of the board with the two queens, returns true or false depending on whether the queens can attack each other or not.

/*

Problem
- Queens can attack eachother if they share:
 - A row value
 - A column value
 - A diagonal
- Return true if the queens can attack eachother, else return false

Examples
- Need to check for expected true value and:
 - Queens on the same spot
 - Invalid positinal values (anything that isn't an integer between 0 and 7)

isQueenAttack([0, 0], [7, 0]) // true
isQueenAttack([0, 0], [0, 7]) // true
isQueenAttack([0, 0], [7, 7]) // true
isQueenAttack([1, 1], [1, 1]) // false => Invalid input
isQueenAttack([1, -1], [8, 7]) // false => invalid input
isQueenAttack([1, 1], [3, 2]) // false

Data
- Input => Two sets of coordinates, one for each queen
 - Coordinates are composed of and array with two integers
- Output => Boolean

Algorithm
- Check coordinates for invalid values
- Check if queens share the row value
- Check if queens share the colum value
- Check if queens are in the same diagonal
 - Same diagonals are:
  - [0, 0] and [1, 1] and [2, 2]
  - [1, 0] and [2, 1] and [3, 2]
  - [0, 7] and [1, 6] and [2, 5]
  - If [Math.abs(ax - bx), Math.abs(ay - by)] === [1, 1] they share a diagonal
    return Math.abs(coordA[0] - coordB[0]) === 1
         && Math.abs(coordA[1] - coordB[1]) === 1;
  - If Math.abs((ax - bx) / (ay - by)) === 1

*/

// Code

function isMatchingDiagonal(coordA, coordB) {
  return Math.abs((coordA[0] - coordB[0]) / (coordA[1] - coordB[1])) === 1;
}

function isQueenAttack(whiteCoord, blackCoord) {
  if (whiteCoord[0] === blackCoord[0]) return 'same row';
  if (whiteCoord[1] === blackCoord[1]) return 'same column';
  if (isMatchingDiagonal(whiteCoord, blackCoord)) return 'same diagonal';
  return 'no attack path';
}

console.log(
  isQueenAttack([0, 0], [7, 0]), // true
  isQueenAttack([0, 0], [0, 7]), // true
  isQueenAttack([0, 0], [7, 7]), // true
  isQueenAttack([1, 2], [2, 3]),
  isQueenAttack([1, 1], [1, 1]), // false => Invalid input
  isQueenAttack([1, -1], [8, 7]), // false => invalid input
  isQueenAttack([1, 1], [3, 2]), // false
);
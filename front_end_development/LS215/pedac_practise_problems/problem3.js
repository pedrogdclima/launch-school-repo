/*
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Examples:

isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true

Start Time 5:38

Problem
- For a given string, check if its characters appear in the same block.
  - Can't use the same letter twice
  - Case insensitive

Examples/Test Cases

isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true

Data
- Input => String
- Output => Boolean

Algorithm
- Iterate over string checking block usage.
- Block will be an object where each letter will be a key and will hold another object as value. That object will be shared between same block letters.

0. Upcase string
1. For loop iterate over string
2. Check if block is already used
  - If yes, return false
  - If no, mark block as used
3. If for loop ends, return true

*/

// Object-based solution

function newBlockSet() {
  const BLOCKS = {
    BO: { used: false },
    XK: { used: false },
    DQ: { used: false },
    CP: { used: false },
    NA: { used: false },
    GT: { used: false },
    RE: { used: false },
    FS: { used: false },
    JW: { used: false },
    HU: { used: false },
    VI: { used: false },
    LY: { used: false },
    ZM: { used: false },
  };

  let blockSet = {};

  Object.keys(BLOCKS).forEach( blockKey => {
    let [firstChar, secondChar] = blockKey;
    blockSet[firstChar] = BLOCKS[blockKey];
    blockSet[secondChar] = BLOCKS[blockKey];
  });

  return blockSet;
}

function isBlockWord(string) {  
  let blockSet = newBlockSet();
  string = string.toUpperCase();
  
  for (let char of string) {
    if (blockSet[char].used) return false;
    blockSet[char].used = true;
  }
  return true;
}

// Array-based Solution

// function isBlockWord(string) {
//   let blocks = [
//     'BO', 'XK', 'DQ', 'CP', 'NA',
//     'GT', 'RE', 'FS', 'JW', 'HU',
//     'VI', 'LY', 'ZM'
//   ];
//   string = string.toUpperCase();

//   for (let char of [...string]) {
//     if (blocks.some( block => block.includes(char))) {
//       blocks = blocks.filter( block => !block.includes(char));
//     }
//     else {
//       return false
//     }
//   }
//   return true
// }

console.log(
  isBlockWord('BATCH') === true,
  isBlockWord('BUTCH') === false,
  isBlockWord('jest') === true,
  isBlockWord('floW') === true,
  isBlockWord('APPLE') === false,
  isBlockWord('apple') === false,
  isBlockWord('apPLE') === false,
  isBlockWord('Box')  === false,
);
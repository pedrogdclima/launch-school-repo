// Implement a function that takes a String as an argument and returns
// an object that contains a count of the repeated characters.

function repeatedCharacters(string) {
  string = string.toLowerCase();
  let countObject = {};
  for (let i in string) {
    let currentChar = string[i];
    if (string.indexOf(currentChar) == i) continue;
    if (!countObject[currentChar]) {
      countObject[currentChar] = 2;
    } else {
      countObject[currentChar] += 1;
    }
  }

  console.log(countObject);
}

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
// Implement a factory function for our country objects following the template laid out below:

let chile = makeCountry('The Republic of Chile', 'South America');
let canada = makeCountry('Canada', 'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

// chile.getDescription();       // "The Republic of Chile is located in South America."
// canada.getDescription();      // "Canada is located in North America."
// southAfrica.getDescription(); // "The Republic of South Africa is located in Africa."

// function makeCountry(name, continent) {
//   return {
//     name,
//     continent,
//     getDescription() {
//       console.log(`${this.name} is located in ${continent}.`)
//     }
//   }
// }

// We've decided that we want to track which countries we've visited, and which we haven't. Alter the factory function so that the object it returns includes a property visited with a value of false.

// This situation seems a bit problematic, though. Suppose we want to add a country that we've already visited. Alter the factory function to use an optional visited parameter with a default value of false.

// function makeCountry(name, continent, visited) {
//   if (visited === undefined) visited = false;
//   return {
//     name,
//     continent,
//     visited,
//     getDescription() {
//       console.log(`${this.name} is located in ${continent}.`)
//     }
//   }
// }

// Let's add a method to our country objects that lets us visit them. Implement a method visitCountry that sets the visited property to true.

// function makeCountry(name, continent, visited) {
//   if (visited === undefined) visited = false;
//   return {
//     name,
//     continent,
//     visited,
//     getDescription() {
//       console.log(`${this.name} is located in ${continent}.`)
//     },
//     visit() {
//       this.visited = true;
//     },
//   }
// }

// Finally, let's update our getDescription function to reflect the visited data. Assuming that canada.visited is false, your code should look like this:

function makeCountry(name, continent, visited) {
  if (visited === undefined) visited = false;
  return {
    name,
    continent,
    visited,
    getDescription() {
      console.log(`${this.name} is located in ${continent}.`)
      console.log(`I have${this.visited ? '' : 'n\'t'} visited ${this.name}.`)
    },
    visit() {
      this.visited = true;
    },
  }
}

canada.visit();

chile.getDescription();
canada.getDescription();
southAfrica.getDescription(); 
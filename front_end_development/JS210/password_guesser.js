// Write a password guessing program that tracks how many times the user
// enters the wrong password. If the user enters the password wrong three
// times, log 'You have been denied access.' and terminate the program.
// If the password is correct, log 'You have successfully logged in.'
// and end the program.

const readlineSync = require("readline-sync");
const PASSWORD = 'password';

function guessPassword() {
  let userGuess = '';
  for (turn = 1; turn < 4; turn++) {
    console.log('Enter guess number ' + turn);
    userGuess = readlineSync.prompt();
    if (PASSWORD === userGuess) {
      console.log('Correct password\nLogin successful');
      return;
    } else {
      console.log('Incorrect password');
    }
  }
  console.log('Too many attemps. Access denied.');
}

guessPassword();

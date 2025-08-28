
const Words = ['apple', 'banana', 'orange', 'pear'];
const MaxBadGuesses = 6;
const Messages = {
  noWords: 'I am out of words!',
  youWon: 'Congratulations! You won!',
  youLost: 'Too bad. You are out of guesses...'
};

class Game {
  
  constructor() {
    this.setupGame();
  }

// The selected word should be stored as an array of letters (e.g., ['a', 'p', 'p', 'l', 'e'])

  setupGame() {
    this.guessCounter = 0;
    this.badGuessesLeft = MaxBadGuesses;
    this.guessedLetters = [];
    this.solution = this.newWord();
    this.attemptState = this.newAttempt();
  }

  newWord() {
    if (Words.length === 0) throw new Error('No words left');
    return Words.splice(Math.floor(Math.random() * Words.length), 1)
                .pop().split('');
  }

  newAttempt() {
    return ' '.repeat(this.solution.length).split('');
  }

  makeGuess(letter) {
    // check if already guessed
    if (this.isAlreadyGuessed(letter)) return false;


    // check if good guess
    if (this.isGoodGuess(letter)) {
    // if yes, show letter in word
      this.solution.forEach( (char, index) => {
        if (char === letter) {
          this.attemptState[index] = letter;
        }
      })
    } else {
    // if no, subtract one from counter
      this.badGuessesLeft -= 1;
    // add to guessed letters list
      this.guessedLetters.push(letter);
    }
    this.guessCounter += 1;

    // console.log(this.attemptState, this.solution, this.guessedLetters, this.guessCounter, ',', this.badGuessesLeft);
  }

  isWon() {
    return !this.attemptState.includes(' ');
  }

  isLost() {
    return this.badGuessesLeft === 0;
  }

  isAlreadyGuessed(letter) {
    return this.guessedLetters.includes(letter);
  }

  isGoodGuess(letter) {
    return this.solution.includes(letter);
  }
}

function drawSpaces(parent, state) {
  let heading = parent.firstElementChild;
  parent.textContent = '';
  parent.appendChild(heading);
  state.forEach(char => {
    let span = document.createElement('span');
    span.textContent = char;
    parent.appendChild(span);
  })
}
function refreshDisplay() {
  drawSpaces(Spaces, game.attemptState);
  drawSpaces(Guesses, game.guessedLetters);
  Apples.className = `guess_${6 - game.badGuessesLeft}`;
}

let game = new Game();

const Apples = document.querySelector('#apples');
const Spaces = document.querySelector('#spaces');
const Guesses = document.querySelector('#guesses');
const Message = document.querySelector('#message');
const Body = document.querySelector('body');

refreshDisplay();

function guessLetter(event) {
  let letter = event.key;
  if (!/^[a-z]$/.test(letter)) return;
  game.makeGuess(letter);
  refreshDisplay();
  let arr = [game.isWon(), game.isLost()];
  if (arr[0]) {
    Message.textContent = Messages['youWon'];
    Body.classList.add('win');
  }
  if (arr[1]) {
    Message.textContent = Messages['youLost'];
    Body.classList.add('lose');
  }
  if (arr.includes(true)) {
    document.removeEventListener('keyup', guessLetter);
  }
}

document.addEventListener('keyup', guessLetter)

document.querySelector('a').addEventListener('click', event => {
  event.preventDefault();
  game.setupGame();
  refreshDisplay();
  Message.textContent = '';
  document.addEventListener('keyup', guessLetter)
  Body.classList.remove('win', 'lose');
});

// let myGame = new Game();
// myGame.makeGuess('l');
// myGame.makeGuess('a');
// myGame.makeGuess('e');
// myGame.makeGuess('r');
// myGame.makeGuess('p');
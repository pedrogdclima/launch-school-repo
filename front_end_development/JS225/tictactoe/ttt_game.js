/*
- Verbs


- Nouns
Player
Computer
Board
Marker

*/

const readline = require("readline-sync");

// const prompt = `Choose a square: `;

// choice = readline.question(prompt);

class Space {
  constructor(position) {
    this.position = position;
    this.status = null;
  }

  toString() {
    if (this.status === null) return `${this.position}`;
    return `${this.status}`;
  }
}

class Board {
  constructor() {
    this.spaces = [];
    for (let position = 1; position < 10; position++) {
      this.spaces.push(new Space(String(position)));
    }
  }

  isWonLine(indexies) {
    let spaces = indexies.map( index => this.spaces[index] );
    if (spaces.some( space => space.status === null )) return false;
    if (spaces.every( space => space.status === 'X' )) return true;
    if (spaces.every( space => space.status === 'O' )) return true;
    return false;
  }

  makeGrid() {
    return [
      '     |     |     ',
      `  ${this.spaces[6]}  |  ${this.spaces[7]}  |  ${this.spaces[8]}  `,
      '     |     |     ',
      '-----+-----+-----',
      '     |     |     ',
      `  ${this.spaces[3]}  |  ${this.spaces[4]}  |  ${this.spaces[5]}  `,
      '     |     |     ',
      '-----+-----+-----',
      '     |     |     ',
      `  ${this.spaces[0]}  |  ${this.spaces[1]}  |  ${this.spaces[2]} `,
      '     |     |     ',
    ].join('\n')
  }

  availableSpaces() {
    return this.spaces
               .filter( space => space.status === null )
               .map( space => space.position );
  }

  isWon() {
    let winningLines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    return winningLines.some( line => this.isWonLine(line), this );
  }

  playable() {
    return this.spaces.some( space => space.status === null );
  }

  printBoard() {
    console.log(this.makeGrid())
  }

  markSpace(player, position) {
    this.spaces[(Number(position) - 1)].status = player.mark;
  }
}

class Player {
// Data
// - Name
// - Marker type
// - Choose space
}

class Computer {
  constructor(marker) {
    this.mark = marker;
  }

  toString() {
    return 'Computer';
  }

  takeTurn(validChoices) {
    let choice;
    while (!validChoices.includes(choice)) {
      choice = String(Math.floor(Math.random() * 10));
    }
    return choice;
  }
}

class Human {
  constructor(marker) {
    this.mark = marker;
  }

  toString() {
    return 'You';
  }

  takeTurn(validChoices) {
    let choice;
    while (!validChoices.includes(choice)) {
      choice = readline.question('Choose position: ');
    }
    return choice;
  }
}

class Game {
  constructor() {
    this.setup();

    while (!this.board.isWon() && this.board.playable()) {
      this.board.printBoard();
      this.playerTurn();
    }

    if (this.board.isWon()) {
      console.log(`${this.lastPlayer} won!`)
    } else {
      console.log('It\s a draw!');
    }
  }

  playerTurn() {
    let choice = this.currentPlayer().takeTurn(this.board.availableSpaces());
    this.board.markSpace(this.lastPlayer, choice);
  }

  currentPlayer() {
    if (this.lastPlayer !== this.player1) {
      this.lastPlayer = this.player1;
      return this.player1;
    } else {
      this.lastPlayer = this.player2;
      return this.player2;
    }
  }

  setup() {
    console.log('Welcome to Tic tac Toe');
    this.board = new Board();
    this.player1 = new Human('X');
    this.player2 = new Computer('O');
  }

}

new Game();

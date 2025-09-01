/*
- Verbs


- Nouns
Player
Computer
Board
Marker

*/

import readline from 'readline-sync';
import chalk from 'chalk';

class Space {
  constructor(position) {
    this.position = position;
    this.status = null;
  }

  toString() {
    if (this.status === null) return chalk.grey(`${this.position}`);
    return chalk.blue.bold(`${this.status}`);
  }
}

class Board {
  constructor() {
    this.spaces = {};
    for (let position = 1; position < 10; position++) {
      this.spaces[String(position)] = new Space(String(position));
    }
  }

  isWonLine(positions) {
    let spaces = positions.map( position => this.spaces[position] );
    if (spaces.some( space => space.status === null )) return false;
    if (spaces.every( space => space.status === 'X' )) return true;
    if (spaces.every( space => space.status === 'O' )) return true;
    return false;
  }

  makeGrid() {
    return [
      '     |     |     ',
      `  ${this.spaces['7']}  |  ${this.spaces['8']}  |  ${this.spaces['9']}  `,
      '     |     |     ',
      '-----+-----+-----',
      '     |     |     ',
      `  ${this.spaces['4']}  |  ${this.spaces['5']}  |  ${this.spaces['6']}  `,
      '     |     |     ',
      '-----+-----+-----',
      '     |     |     ',
      `  ${this.spaces['1']}  |  ${this.spaces['2']}  |  ${this.spaces['3']}  `,
      '     |     |     ',
    ].join('\n');
  }

  availableSpaces() {
    return Object.values(this.spaces)
               .filter( space => space.status === null )
               .map( space => space.position );
  }

  isWon() {
    let winningLines = [
      ['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'],
      ['1', '4', '7'], ['2', '5', '8'], ['3', '6', '9'],
      ['1', '5', '9'], ['3', '5', '7']
    ]
    return winningLines.some( line => this.isWonLine(line), this );
  }

  playable() {
    return Object.values(this.spaces).some( space => space.status === null );
  }

  printBoard() {
    console.clear();
    console.log(this.makeGrid());
  }

  markSpace(player, position) {
    this.spaces[position].status = player.mark;
  }
}

class Player {
  toString() {
    return this.name;
  }
}

class Computer extends Player {
  constructor(marker) {
    super();
    this.name = 'Computer';
    this.mark = marker;
  }

  // Computer chooses random available space
  // takeTurn(validChoices) {
  //   let choice;
  //   while (!validChoices.includes(choice)) {
  //     choice = String(Math.floor(Math.random() * 10));
  //   }
  //   return choice;
  // }

  // Commputer plays optimally

//   In the following code, we're adding some strategy for the computer. The strategy is as follows:

// If the computer can win with a single play, make that play.
// If the computer can't win with a single play, but the human can, then try to block that play.
// If neither player can win with a single play and the center square is empty, play the center square.
// If none of the above conditions apply, pick a square at random.

  takeTurn(board) {

  }

}

class Human extends Player {
  constructor(marker) {
    super();
    this.mark = marker;
    this.name = this.chooseName();
  }

  chooseName() {
    let choice;
    do {
      choice = readline.question('You name: ');
    } while (choice.length <= 0)
    return choice;    
  }

  takeTurn(board) {
    let validChoices = board.availableSpaces();
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
    let choice = this.currentPlayer().takeTurn(this.board);
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


document.addEventListener('DOMContentLoaded', event => {
  
  function newRandNumber() {
    return Math.floor(Math.random() * 100) + 1;
  }
  let answer = newRandNumber();
  let inputEle = document.querySelector('#guess');
  let formEle = document.querySelector('form');
  let paraEle = document.querySelector('p');
  let paraEleStartingMessage = paraEle.textContent;
  let guess = '';
  let guessCounter = 0;
  let submitButton = event.target.querySelector('input[type="submit"');
  
  document.addEventListener('submit', event => {
    event.preventDefault();
    guess = parseInt(inputEle.value, 10);
    guessCounter += 1;
    let counterMessage = `\n\r\n\rGuess counter: ${guessCounter}`
    let message;
    if (guess > answer) message = "You guessed too high!";
    if (guess < answer) message = "You guessed too low!";
    if (guess === answer) {
      message = "You guessed correctly!";
      submitButton.disabled = true;
    }
    paraEle.textContent = message + counterMessage;
  });

  document.querySelector('a')
          .addEventListener('click', event => {
    event.preventDefault();
    answer = newRandNumber();
    guessCounter = 0;
    submitButton.disabled = false;
    paraEle.textContent = paraEleStartingMessage;
  });

  
});

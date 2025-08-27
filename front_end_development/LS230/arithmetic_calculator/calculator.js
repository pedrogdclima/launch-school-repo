document.addEventListener('DOMContentLoaded', event => {
  let resultNode = document.querySelector('#result');
  let firstNumber = document.querySelector('#first-number');
  let secondNumber = document.querySelector('#second-number');
  let operator = document.querySelector('#operator');
  
  document.addEventListener('submit', event => {
    event.preventDefault();
    let result;
    let numbers = [firstNumber.value, secondNumber.value].map( n => Number(n));
    switch (operator.value) {
      case '+':
        result = numbers[0] + numbers[1];
        break;
      case '-':
        result = numbers[0] - numbers[1];
        break;
      case '*':
        result = numbers[0] * numbers[1];
        break;
      case '/':
        if (numbers[1] === 0) {
          alert("Division by '0' not allowed!")
        } else {
          result = numbers[0] / numbers[1];
        }
        break;
    }
    resultNode.textContent = result.toString();
  });
});

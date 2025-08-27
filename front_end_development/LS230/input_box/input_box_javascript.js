
document.addEventListener('DOMContentLoaded', event => {
  
  let textField = event.target.querySelector('.text-field');
  let cursorInterval;

  textField.addEventListener('click', event => {
    event.stopPropagation();
    if (!textField.classList.contains('focused')) {
      textField.classList.add('focused');
      cursorInterval = setInterval(() => {
        textField.classList.toggle('cursor');
      }, 500);
    };
  });

  event.currentTarget.addEventListener('click', event => {
    textField.classList.remove('focused', 'cursor');
    clearInterval(cursorInterval);
  })

  document.addEventListener('keydown', event => {
    if (textField.classList.contains('focused')) {
      let key = event.key;
      let text = textField.querySelector('.content').textContent;

      if (key === 'Backspace' || key === 'Delete') {
        text = text.slice(0, -1);
      } else if (key.length === 1) {
        text += key;
      }
      textField.querySelector('.content').textContent = text;
    }
  })

});

document.addEventListener('DOMContentLoaded', event => {
  
  let list = document.querySelector('#grocery-list');
  
  document.addEventListener('submit', event => {
    event.preventDefault();
    let newName = document.querySelector('#name').value;
    let newQuantity = document.querySelector('#quantity').value;
    if (newName.trim().length === 0) return;
    let newItem = document.createElement('li');
    newItem.textContent = `${newQuantity || 1} ${newName}`;
    list.appendChild(newItem);
    event.target.reset();
  });
})
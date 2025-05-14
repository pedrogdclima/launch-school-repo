function toLowerCase(string) {
  loweredString = '';
  let currentCharCode;
  for (let i = 0; i < string.length; i++) {
    currentCharCode = string.charCodeAt(i);
    if (currentCharCode > 64 && currentCharCode < 91) {
      let loweredChar = String.fromCharCode(currentCharCode + 32);
      loweredString += loweredChar;
    } else {
      loweredString += string[i];
    } 
  }
  return loweredString;
}

console.log(toLowerCase('AbC'));
console.log(toLowerCase('aBc'));
console.log(toLowerCase('123'));

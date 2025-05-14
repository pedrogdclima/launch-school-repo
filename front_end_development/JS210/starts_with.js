function startsWith(string, substring) {
  for (let i = 0; i < substring.length; i++) {
    if (string[i] === substring[i]) {
      continue;
    } else {
      return false;
    }
  }
  return true;
}

console.log(startsWith('abc', 'a'));
console.log(startsWith('abc', 'b'));
console.log(startsWith('abc', 'ab'));
console.log(startsWith('abc', ''));
console.log(startsWith('abc', 'abcd'));

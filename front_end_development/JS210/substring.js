function substring(string, start, length) {
  let outputSubstring = '';
  if (start < 0) start += string.length;
  for (let i = start; outputSubstring.length < length; i++) {
    if (!string[i]) break;
    outputSubstring += string[i];
  }
  return outputSubstring;
}

console.log(substring('abcde', 1, 3));
console.log(substring('abcde', 2, 9));
console.log(substring('abcde', -2, 2));

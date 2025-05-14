function trim(string) {
  while (string[0] === ' ') {
    string = string.slice(1);
  }
  while (string.at(-1) === ' ') {
    string = string.slice(0, -1);
  }
  console.log('-' + string + '-');
}

trim('  abc  ');
trim(' a b c ');
trim('a b c ');
trim(' a b c');
trim('');
trim('  ');

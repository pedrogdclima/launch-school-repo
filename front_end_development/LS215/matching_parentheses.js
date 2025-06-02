// Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

function isBalanced(string) {
  let onlyParentheses = string.replaceAll(/[^()]/g, '');
  count = 0;
  for (let idx = 0; idx < onlyParentheses.length; idx += 1) {
    switch (onlyParentheses[idx]) {
      case '(':
        count += 1;
        break;
      case ')':
        count -= 1;
        break;
    }
    if (count < 0) return false;
  }
  return count === 0;
}

console.log(
  isBalanced('What (is) this?'),        // true
  isBalanced('What is) this?'),         // false
  isBalanced('What (is this?'),         // false
  isBalanced('((What) (is this))?'),    // true
  isBalanced('((What)) (is this))?'),   // false
  isBalanced('Hey!'),                   // true
  isBalanced(')Hey!('),                 // false
  isBalanced('What ((is))) up(')        // false
)
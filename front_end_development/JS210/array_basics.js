// indexOf

function indexOf(array, value) {
  for (let i = 0; i < array.length; i++) {
    if (array[i] === value) return i;
  }
  return -1;
}

// console.log(indexOf(['a', 'b', 'c'], 'c'));
// console.log(indexOf(['a', 'b', 'c'], 1));

// lastIndexOf

function lastIndexOf(array, value) {
  for (let i = (array.length - 1); i >= 0; i--) {
    if (array[i] === value) return i;
  }
  return -1;
}

// console.log(lastIndexOf(['a', 'b', 'a'], 'a'));
// console.log(lastIndexOf(['a', 'b', 'a'], 'c'));

// slice

function slice(array, startIndex, endIndex) {
  let newArray = [];
  for (let i = startIndex; i < endIndex; i++) {
    newArray.push(array[i]);
  }
  return newArray;
}

// console.log(slice([1, 2, 3, 4, 5], 0, 2));
// console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));

// splice

function splice(array, startIndex, length) {
  let newArray = [];
  for (let i = startIndex; i < array.length; i++) {
    if (i < (startIndex + length)) {
      newArray.push(array[i]);
    }
    array[i] = array[i + length];
  }
  array.length = (array.length - length);
  return newArray;
}

// let array = ['a', 'b', 'c', 'd', 'e', 'f'];
// console.log(splice(array, 1, 4));
// console.log(array);

// join

// function join(array, separator) {
//   let newArray = [];
//   let string = '';
//   for (let i = 0; i < array.length; i++) {
//     newArray[i * 2] = array[i];
//   }
//   for (let i = 1; i < newArray.length; i += 2) {
//     newArray[i] = separator;
//   }
//   for (let i = 0; i < newArray.length; i++) {
//     string += newArray[i];
//   }
//   return string;
// }

function join(array, separator) {
  string = '';
  for (let i = 0; i < array.length; i++) {
    string += String(array[i]);
    if ((array.length - i) === 1) {
      continue;
    }
    string += separator;
  }
  return string;
}

// console.log(join([1, 2, 3, 4], '+'));

// arraysEqual

function arraysEqual(array1, array2) {
  if (array1.length !== array2.length) return false
  for (let i = 0; i < array1.length; i++) {
    if (array1[i] !== array2[i]) return false;
  }
  return true;
}

// console.log(arraysEqual([1], [1]));                            // true
// console.log(arraysEqual([1], [2]));                            // false
// console.log(arraysEqual([1, 2], [1, 2, 3]));                   // false
// console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));    // true
// console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));   // false
// console.log(arraysEqual([1, 'hi', true], [1, 'hello', true])); // false
// console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));    // false

// sort

function sortDescending(array) {
  const desc = (a, b) => String(b).charCodeAt(0) - String(a).charCodeAt(0);
  let newArray = slice(array, 0, array.length);
  return newArray.sort(desc);
}

// let array = [1, 2, 3, 4];
// console.log(sortDescending(array));
// console.log(array);

// let strArray = ['a', 'b', 'c'];
// console.log(sortDescending(strArray));
// console.log(strArray);

// unique elements

function uniqueElements(array) {
  let uniqueArray = [];
  for (let i = 0; i < array.length; i++) {
    if (indexOf(uniqueArray, array[i]) === -1) {
      uniqueArray.push(array[i]);
    }
  }
  return uniqueArray;
}

// console.log(uniqueElements(['a', 'a', 'b', 'a', 'c', 'b']));

// missing numbers

function missing(array) {
  let result = [];
  for (let i = 0; i < (array.length - 1); i++) {
    let diff = array[i + 1] - array[i];
    if (diff === 1) continue;
    for (let add = 1; add < diff; add++) {
      result.push(array[i] + add);
    }
  }
  return result;
}

// console.log(missing([-2, 1, 2, 3, 5, 7]));

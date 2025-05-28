// For this practice problem, we'll represent rectangles as Arrays with two elements: a height and a width.

// Write a Function named totalArea that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.

function totalArea(rectangleArray) {
  let multiply = (prevEle, currEle) => prevEle * currEle;
  let sum = (prevEle, currEle) => prevEle + currEle;
  let areaArray = rectangleArray.map( ele => {
    return ele.reduce(multiply);
  })
  return areaArray.reduce(sum);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141

// Now, write a second Function named totalSquareArea. This Function should calculate the total area of a set of rectangles, just like totalArea. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.

console.log(rectangles);

function totalSquareArea(rectangleArray) {
  return totalArea(rectangleArray.filter( ele =>  ele[0] === ele[1] ));
}

console.log(totalSquareArea(rectangles));    // 121
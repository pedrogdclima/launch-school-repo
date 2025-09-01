/*
Implement encoding and decoding for the rail fence cipher.

The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded. It was already used by the ancient Greeks.

In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag). Finally the message is then read off in rows.

For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:

'WECRLTEERDSOEEFEAOCAIVDE' <=> 'WEAREDISCOVEREDFLEEATONCE' in 3

W . . . E . . . C . . . R . . . L . . . T . . . E => WECRLTE
. E . R . D . S . O . E . E . F . E . A . O . C . => ERDSOEEFEAOC
. . A . . . I . . . V . . . D . . . E . . . N . . => AIVDEN

railsArray = [[], [], []]
railsArray.forEach((rail, railIdx) => {
  stepSize = func
  for (let strIdx = railIdx; strIdx < string.length; strIdx += stepSize) {

  }
});

'ESXIEECSR' <=> 'EXERCISES' in 4

E . . . . . S . . . . . _ => ES_
. X . . . I . E . . . _ . => XIE
. . E . C . . . S . _ . . => ECS
. . . R . . . . . _ . . . => R_

E 0 / 1
X 2 / 3
E 5 / 6
R 8 / 9
C 6 / 7
I 3 / 4
S 1 / 2
E 4 / 5
S 7 / 8

'ACEGIBDFHJ' <=> 'ABCDEFGHIJ' in 2

A . C . E . G . I . => ACEGI 
. B . D . F . H . J => BDFHJ

A . . . . . . . C . 
. B . . . . . B . . 
. . C . . . A . . . 
. . . A . C . . . . 
. . . . 4 . . . . . 

function whichRail(numOfRails, charIdx) {
  5
}

When 1, space is always 0
When 2, space is always 1
When 3, space is 3, then 1, then 3
When 4, space is 5, then 3, then 1
When 5, space is 7
When 6, space is 9

railsArray = [[] * railsNum]
           = [[], [], []] => for 3 rails




*/
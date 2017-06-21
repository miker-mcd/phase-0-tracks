// RELEASE 0: FIND THE LONGEST PHRASE

// write a function that takes an array of words or phrases and returns the longest word or phrase in the array. So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". This is a logical reasoning challenge, so try to reason through this based on what you already know, rather than Googling the fanciest solution or looking up built-in sorting functions. Note that "some string".length will do what you expect in JS.
// var string = "some string";
var array = ["longest phrase","longer phrase","long phrase"];

console.log(array[0].length);

// PSEUDOCODE

// Input: A container of different words (array)
// Output: A container of words with the longest word at the end (array)
// Set counter to zero
// Set empty container to fill ordered words into
// WHILE counter is less than length of the container of words
  // IF word length at counter is less than or equal to the last word in the container
    // Push the word at the counter to the empty container
  // ELSE
    // Push the last word into the empty container.
// ENDIF
// ENDWHILE


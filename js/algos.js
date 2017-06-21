// RELEASE 0: FIND THE LONGEST PHRASE

// PSEUDOCODE

// Input: A container of different words (array)
// Output: A container of words with the longest word at the beginning (array)
// Set counter to one
// WHILE counter is less than length of the container of words minus one
  // IF the word length at counter is greater than the first word in the container
    // Make the word at the counter, the first word in the container
  // ENDIF
// Add one to counter
// ENDWHILE

// DRIVER CODE

var words = ["long","longest","longliest", "longer", "hi"];

console.log(words);

function longest_word(array) {
  for (var i = 1; i < words.length - 1; i++) {
    if (words[i].length > words[0].length) {
    words[0] = words[i]
    }
  }
  console.log(words[0]);
}
longest_word(words);
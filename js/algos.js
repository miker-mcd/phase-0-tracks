// RELEASE 0: FIND THE LONGEST PHRASE

// PSEUDOCODE

// LongestWord function
// Input: A container of different words (array)
// Output: A container of words with the longest word at the beginning (array)
// Set counter to one
// WHILE counter is less than length of the container of words minus one
  // IF the word length at counter is greater than the first word in the container
    // Make the word at the counter, the first word in the container
  // ENDIF
// Add one to counter
// ENDWHILE

function longestWord(wordList) {
  for (var i = 1; i < wordList.length - 1; i++) {
    if (wordList[i].length > wordList[0].length) {
    wordList[0] = wordList[i]
    }
  }
  console.log(wordList[0]);
}

// RELEASE 1: FIND A KEY-VALUE MATCH

// PSEUDOCODE
// findMatch function
// Input: Two containers (Objects)
// Output: True or False (Boolean)
// FOR EACH key in first object AND second object
  // IF one key AND value pair matches a key AND value pair in the second object
    // RETURN True
  // ELSE IF no pairs match
    // RETURN False
  // ENDIF
// ENDFOREACH

function findMatch(object1, object2) {
var is_match = false;
  for (var key in object1 && object2) {
    if ((key in object1 == key in object2) && (object1[key] == object2[key])) {
      var is_match = true;
      return is_match;
  } else if ((key in object1 != key in object2) && (object1[key] != object2[key])) {
      return is_match;
    }
  }
}

// RELEASE 2: GENERATE RANDOM TEST DATA

//Write a function that takes an integer for length, and builds and returns an array of strings of the given length. So if we ran your function with an argument of 3, we would get an array of 3 random words back (the words don't have to be actual sensical English words -- "nnnnfph" totally counts). The words should be of randomly varying length, with a minimum of 1 letter and a maximum of 10 letters. (This involves a new trick, generating a random number, that you'll have to look up, but the solution on how to do so is relatively straightforward.)

// Random Letter function
// Input: none
  // Create alphabet string
  // Create a random number between one and twenty-six
  // Use the random number to match to the same index position in the alphabet
  // RETURN the letter
// Output: letter (string)

function randomLetter() {
var alphabet = "abcdefghijklmnopqrstuvwxyz";
var letter = alphabet[Math.floor((Math.random() * 26) + 1)];
  return letter;
}

// Random Word Function
// Input: A random number between 1 and 10 representing the length of a word (integer)
  // Set an empty container string to add letters to
  // Set a counter to zero
  // WHILE the counter is less than a random number between 1 and 10 representing the length of a word
    // Generate a letter and add to the empty string container
  // Increase the counter by one
  // ENDWHILE
// Output: A string of random letters (string)

function randomWord() {
var word = ""
  for (var i = 0; i < Math.floor((Math.random() * 10) + 1); i++) {
    var word = word + randomLetter();
  }
return word;
}

// Random Word List function
// Input: A number representing the length of the list (integer)
    // Set an empty container to add words to
    // Set counter to zero
    // WHILE counter is less than the given length of words in the list
      // Create a random word and push into empty container
      // Increase the counter by one
    // ENDWHILE
// Output: A container of random words of varying lengths (array)

function randomWordList(num) {
var wordList = []
  for (i = 0; i < num; i++) {
  wordList.push(randomWord());
}
return wordList
}

// DRIVER CODE

// Math.floor((Math.random() * 26) + 1);

// Test longestWord function
var words = ["long","longest","longliest", "longer", "hi"];

// longestWord(words);

var fruits = ["apples","strawberries","bananas","mangoes", "watermelon"];

// longestWord(fruits);

// Test findMatch function
var person1 = {name: "Steven", age: 54, birthplace: "California", likesPizza: false};
var person2 = {name: "Tamir", age: 54, birthplace: "Vancouver", likesTacos: true};

// console.log(findMatch(person1, person2));

var pet1 = {name: "Peter", legs: 8, canWalk: false};
var pet2 = {name: "Buddy", legs: 4, canBark: true};

// console.log(findMatch(pet1, pet2));

// Test RandomWordList function
console.log(randomWordList(3));
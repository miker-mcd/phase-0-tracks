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


// DRIVER CODE

// Test longestWord function
var words = ["long","longest","longliest", "longer", "hi"];

longestWord(words);

var fruits = ["apples","strawberries","bananas","mangoes", "watermelon"];

longestWord(fruits);

// Test findMatch function
var person1 = {name: "Steven", age: 54, birthplace: "California", likesPizza: false};
var person2 = {name: "Tamir", age: 54, birthplace: "Vancouver", likesTacos: true};

console.log(findMatch(person1, person2));

var pet1 = {name: "Peter", legs: 8, canWalk: false};
var pet2 = {name: "Buddy", legs: 4, canBark: true};

console.log(findMatch(pet1, pet2));
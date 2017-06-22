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

function longest_word(array) {
  for (var i = 1; i < words.length - 1; i++) {
    if (words[i].length > words[0].length) {
    words[0] = words[i]
    }
  }
  console.log(words[0]);
}

// RELEASE 1: FIND A KEY-VALUE MATCH

// In algos.js, write a function that takes two objects and checks to see if the objects share at least one key-value pair. Here are some sample objects and their expected return values:

// yourFunction({name: "Steven", age: 54}, {name: "Tamir", age: 54}); #  true
// yourFunction({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}); #  true
// These both return true because at least one key-value pair matches between the two objects.
// If no pairs match (and keep in mind that the two objects may not even have any of the same keys), the function should return false. To make your life easier, don't worry about whether a property is a string ('age') or an identifier name (age). Those can be considered equivalent.
// Again, try to reason through the problem using the basics you've already learned, rather than looking up slick search functions that will do the job for you. We'd rather see you write code that you actually understand!

// PSEUDOCODE
// Input: Two objects
// Output: True or False
// FOR EACH key in first object
  // IF AT LEAST one key-value pair matches a key-value pair in the second object
    // RETURN True
  // ELSE no pairs match
    // RETURN False
  // ENDIF
// ENDFOREACH

var person1 = {name: "Steven", age: 54};
var person2 = {name: "Tamir", age: 54};

for (var key in person1) {
  console.log(person1[key]);
}

// DRIVER CODE

var words = ["long","longest","longliest", "longer", "hi"];

// longest_word(words);
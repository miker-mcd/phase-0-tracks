// PSEUDOCODE

// Reverse string function
// Input: String
// Set an empty container to add the letters into
// Set counter to the length of the word minus one
// WHILE the counter is greater than or equal to zero
  // Add the letter to the container
  // Decrease the counter by one
// ENDWHILE
// Output: Reversed string

// DRIVER CODE

function reverse_string() {
var string = "hello";
var new_string = ""; // empty string to add letters into
for (var i = (string.length - 1); i >= 0; i--) {
  var new_string = new_string + string[i]; // adds a letter into the empty string container at each index as it loops through the word
}
  console.log(new_string);
}

// reverse_string();

// Call function with string of choice and store the result in a variable
function reverse_string(string) {
var new_string = "";
for (var i = (string.length - 1); i >= 0; i--) {
  var new_string = new_string + string[i];
}
  return new_string
}

var reverse_coffee = reverse_string("COFFEE");
console.log(reverse_coffee);

// Print the variable if a condition is true
if (1 == 2) {
  console.log(reverse_coffee);
} else {
  console.log("No coffee for you!");
}
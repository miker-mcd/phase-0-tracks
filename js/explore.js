// PSEUDOCODE

// Reverse string function
// Input: String
// Set counter to the length of the string
// WHILE counter is greater than or equal to zero
  // Print EACH letter of the string that is the same as the counter
  // Decrease the counter by one
// ENDWHILE
// Output: Reversed string

// DRIVER CODE

var str = "hello"
// console.log(str[5]);
for (var i = (str.length - 1); i >= 0; i--) {
  console.log(str[i]);
}
// PSEUDOCODE

// Reverse string function
// Input: String
// Set counter to the length of the string minus one
// WHILE counter is greater than or equal to zero
  // Add the letter to the letter minus the count
  // Decrease the counter by one
// ENDWHILE
// Output: Reversed string

// DRIVER CODE

var str = "hello";
// console.log(str[5]);
for (var i = (str.length - 1); i >= 0; i--) {
  // console.log(str[i]);
  var new_string = new_string + str[i]
  // console.log(str[i] += str[i - 1])
}

console.log(new_string);
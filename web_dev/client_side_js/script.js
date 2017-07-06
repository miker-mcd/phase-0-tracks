// Test the script.js file is running
console.log("Is this working?");

// Change the font color of the strong element to green
var greats = document.getElementsByTagName("strong");
var great = greats[0];
great.style.color = "green";

// Change the ul background to pink
var ul_backs = document.getElementsByTagName("ul");
var ul_back = ul_backs[0];
ul_back.style.background = "pink";

// Create a new li and add to page
var newli = document.createElement("li");
var node = document.createTextNode("relatively quiet");
newli.appendChild(node);
ul_back.appendChild(newli);

// Loop through a collection of nodes of a certain class and apply the same effect to all of them
var important = document.getElementsByClassName("special");
for (var i = 0; i < important.length; i++) {
  important[i].style.fontSize = "20px";
}

// Add event listener that hides the lizard photo when user clicks the blend button
function blend(event) {
  var photo = document.getElementById("lizard-photo");
  photo.style.visibility = "hidden";
}

// Add event listener that reveals the lizard photo when the user clicks the reveal button
function reveal(event) {
  var photo = document.getElementById("lizard-photo");
  photo.style.visibility = "visible";
}

// Test the event listeners
var button = document.getElementById("button1");
button.addEventListener("click", blend);

var buttons = document.getElementsByTagName("button");
var button = buttons[1];
button.addEventListener("click", reveal);
console.log("Is this working?");

var greats = document.getElementsByTagName("strong");
var great = greats[0];
great.style.color = "green";

var ul_backs = document.getElementsByTagName("ul");
var ul_back = ul_backs[0];
ul_back.style.background = "pink";

function blend(event) {
  var photo = document.getElementById("lizard-photo");
  photo.style.visibility = "hidden";
}

function reveal(event) {
  var photo = document.getElementById("lizard-photo");
  photo.style.visibility = "visible";
}
// var photo = document.getElementById("lizard-photo");
// var buttons = document.getElementsByTagName("button");
// var button = buttons[0];

var button = document.getElementById("button1");
button.addEventListener("click", blend);

var buttons = document.getElementsByTagName("button");
var button = buttons[1];
button.addEventListener("click", reveal);
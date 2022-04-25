console.log();
// Randomness
//

// Random Background Image function
function randomBackground() {
  var randomNumber = Math.floor(Math.random() * 12) + 101;
  console.log(randomNumber);
  var path = "url(images/bgs/LandingBG" + randomNumber + ".png)";
  console.log(path);
  document.getElementById("bgImage").style.backgroundImage = path;
}

window.onload = randomBackground;

console.log();

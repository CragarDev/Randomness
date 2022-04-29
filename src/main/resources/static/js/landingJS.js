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

  var randomNumber2 = Math.floor(Math.random() * 20) + 101;
  console.log(randomNumber2);
  var pathAnimal = "images/LandingAnimals/a" + randomNumber2 + ".PNG";
  console.log(pathAnimal);
  document.getElementById("animalImage").scr = pathAnimal;
}

// Random Animal Image function
// function randomAnimal() {
//   var randomNumber = Math.floor(Math.random() * 20) + 101;
//   console.log(randomNumber);
//   var path = "url(images/LandingAnimals/a" + randomNumber + ".png)";
//   console.log(path);
//   document.getElementById("animalImage").style.backgroundImage = path;
// }

window.onload = randomBackground;

console.log();

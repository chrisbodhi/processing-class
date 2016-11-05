var tailLength = 50;
var xPos = new Array(tailLength);
var yPos = new Array(tailLength);
var oppX = new Array(tailLength);
var oppY = new Array(tailLength);

function setup() {
  var canvas = createCanvas(windowWidth, windowHeight);
  canvas.parent("p5canvas");
  pixelDensity(2);
  
  // init the arrays
  for (var i = 0; i < tailLength; i++) {
    xPos[i] = 0;
    yPos[i] = 0;
    oppX[i] = 0;
    oppY[i] = 0;
  }
}

function draw(){
  background(0);
  
  // shift all of the values
  xPos = [...xPos.slice(1), 0];
  yPos = [...yPos.slice(1), 0];

  oppX = [...oppX.slice(1), 0];
  oppY = [...oppY.slice(1), 0];  

  // set the x and y positions
  xPos[tailLength - 1] = mouseX;
  yPos[tailLength - 1] = mouseY;
  
  oppX[tailLength - 1] = width - mouseX;
  oppY[tailLength - 1] = height - mouseY;
  
  // draw 'em all
  for (var i = 0; i < tailLength; i++) {
    noStroke();
    var radius = i * 2.5;
    fill(0 + (i * 5));
    ellipse(xPos[i], yPos[i], radius, radius);
    ellipse(oppX[i], oppY[i], radius, radius);
  }
}


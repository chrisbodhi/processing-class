// surfin zebra
int waveWidth;
int xPos1;
int xPos2;
int xPos3;
int xPos4;

float angle = 0;
float offset = 200;
float scalar = 40;
float speed = 0.05;
float wavePosY;

void setup() {
  size(480, 320);
  waveWidth = 125; 
  xPos1 = 0;
}

void draw() {
  background(135, 206, 250);

  fill(127, 255, 212);
  noStroke();
  
  // wave
  wavePosY = offset + sin(angle) * scalar;
  arc(xPos1, wavePosY, waveWidth, 100, PI, PI * 2);
  angle += speed;

  // sea
  rect(0, height/2, width, height);
  
  // check against the sum to prevent jumping at end of the canvas 
  if (xPos1 <= (width + waveWidth)) {
    xPos1 += 3;
  } else {
    xPos1 = waveWidth * -1;
  }
}
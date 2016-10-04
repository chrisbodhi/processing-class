float xPos;
float yPos;

void setup() {
  size(640, 480);
  frameRate(20);
  noLoop();
  
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  background(242);
  
  fill(101, 202, 101);
  ellipse(xPos, yPos, 50, 50);

  xPos = random(25, width);
  yPos = random(25, height);
}

void mouseClicked() {
  loop();
}
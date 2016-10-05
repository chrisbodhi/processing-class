float xPos;
float yPos;
float xLimit;
float yLimit;
float speed = 0;
float accel = 0.1;

void setup() {
  size(640, 480);
  frameRate(20);
  noLoop();
  
  xPos = width/2;
  yPos = height/2;
  
  xLimit = width - 25;
  yLimit = height - 25;
}

void draw() {
  background(242);
  
  fill(101, 202, 101);
  ellipse(xPos, yPos, 50, 50);
  
  if (yPos < yLimit && xPos < xLimit) {
    xPos += speed;
    yPos += speed;
    speed += accel;
    println(xPos, yPos);
  }
  if (yPos > yLimit) {
    xPos += speed;
    yPos -= speed;
    speed += accel;
    println(xPos, yPos);
  }
  
  if (xPos > xLimit) {
    xPos -= speed;
    yPos -= speed;
    speed += accel;
    println(xPos, yPos);
  }
}

void mouseClicked() {
  loop();
}
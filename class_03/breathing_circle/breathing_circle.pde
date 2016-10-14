int ballSize;
int breathe;

void setup() {
  size(500, 500);
  
  ballSize = 50;
  breathe = 1;
}

void draw() {
  background(255);
  display();
  breathing();
}

void display() {
  fill(255,0,0);
  ellipse(width/2, height/2, ballSize, ballSize);
}

void breathing() {
  ballSize += breathe;
  
  if (ballSize > 100 || ballSize < 0) {
    breathe *= -1;
  }
}
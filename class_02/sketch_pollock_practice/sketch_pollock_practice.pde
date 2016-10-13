void setup() {
  size(600, 400);
  pixelDensity(2);
  background(255);
}

void draw() {
  //stamp(100, 50);
  //stamp(200, 100);
  //stamp(100, 300);
  //stamp(20, 10);
  //stamp(400, 50);
  //stamp(-100, -77);
  //stamp(-130, -300);
  
  //float randX = random(width);
  //float randY = random(height);
  //stamp(randX, randY);
  
  stamp(mouseX, mouseY);
}

void blueRect(float x, float y) {
  stroke(0, 0, 255);
  strokeWeight(3);
  noFill();
  rect(x, y, x, y);
}

void greenLine(float x, float y) {
  strokeWeight(10);
  stroke(0, 255, 0);
  line(x, y, x + 50, y);
}

void purpleCircle(float x, float y) {
  noStroke();
  fill(255, 0 , 255);
  ellipse(x, y, 50, 50);
}

void stamp(float x, float y) {
  greenLine(x * 1.5, y);
  blueRect(x, y * 0.8);
  purpleCircle(x * 2, y * 3);
}
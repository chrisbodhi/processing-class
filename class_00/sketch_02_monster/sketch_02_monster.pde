void setup() {
  size(500, 500);
}

// overstimulated color monster
void draw() {
  background(random(100, 255), random(100, 255), random(100, 255));
  // body
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  ellipse(250, 250, 181, 181);
  // head
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  ellipse(250, 150, 150, 80);
}
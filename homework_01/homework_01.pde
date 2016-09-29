void setup() {
  size(640, 360);
  smooth(8);
  // ref img: https://goo.gl/images/42uTvP
}

void draw() {
  // stinger
  fill(0);
  triangle(width/2 - 110, height / 2, width/2 - 70, height / 2 + 5, width/2 - 70, height / 2 - 5);
  
  // body
  fill(239, 201, 0);
  ellipse(width/2, height/2, 160, 120);
  
  // face
  fill(0);
  ellipse(width/2 + 25, height/2, 5, 5);
  ellipse(width/2 + 60, height/2, 5, 5);
  ellipse(width/2 + 40, height/2 + 20, 15, 10);
  
  // legs
  ellipse(width/2 + 10, height/2 + 60, 5, 20);
  
  println(mouseX, mouseY);
}
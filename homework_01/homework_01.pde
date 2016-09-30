int halfW;
int halfH;

void setup() {
  size(640, 360);
  smooth(8);
  // ref img: https://goo.gl/images/42uTvP
}

void draw() {
  halfW = width / 2;
  halfH = height / 2;
  background(200);
  
  // stinger
  fill(0);
  triangle(halfW - 110, halfH, halfW - 70, halfH + 5, halfW - 70, halfH - 5);
  
  // behind wing
  fill(0, 20);
  bezier(halfW - 40, halfH - 40, halfW - 80, 20, halfW + 10, 30, halfW + 10, halfH - 40);

  
  
  // body
  fill(239, 201, 0);
  ellipse(halfW, halfH, 160, 120);
  
  // face
  fill(0);
  ellipse(halfW + 25, halfH, 5, 5);
  ellipse(halfW + 60, halfH, 5, 5);
  ellipse(halfW + 40, halfH + 20, 15, 10);
  
  // legs
  ellipse(halfW + 10, halfH + 60, 5, 20);
  
  // forward wing
  fill(0, 20);
  bezier(halfW - 10, halfH - 50, halfW - 20, 0, halfW + 80, 40, halfW + 40, halfH - 35);
  
  println(mouseX, mouseY);
}
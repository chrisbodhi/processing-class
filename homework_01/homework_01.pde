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

  // behind legs
  fill(0);
  ellipse(halfW + 30, halfH + 60, 5, 20);
  ellipse(halfW - 5, halfH + 62, 5, 20);
  ellipse(halfW - 35, halfH + 55, 5, 20);
  
  // body
  fill(239, 201, 0);
  ellipse(halfW, halfH, 160, 120);
  strokeWeight(3);
  noFill();
  arc(halfW, halfH, 60, 120, PI * .5, PI * 1.5);
  arc(halfW - 30, halfH, 50, 110, PI * .5, PI * 1.5);
  arc(halfW - 40, halfH, 60, 100, PI * .5, PI * 1.5);

  // face
  fill(0);
  ellipse(halfW + 25, halfH, 5, 5);
  ellipse(halfW + 60, halfH, 5, 5);
  ellipse(halfW + 40, halfH + 20, 15, 10);
  
  // forward legs
  ellipse(halfW + 10, halfH + 60, 5, 20);
  ellipse(halfW - 20, halfH + 61, 5, 20);
  ellipse(halfW - 55, halfH + 50, 5, 20);
  
  // forward wing
  fill(0, 20);
  bezier(halfW - 10, halfH - 50, halfW - 20, 0, halfW + 80, 40, halfW + 30, halfH - 40);
  
  println(mouseX, mouseY);
}
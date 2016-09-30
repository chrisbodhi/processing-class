float firstThirdW;
float firstThirdH;

float lastThirdW;
float lastThirdH;

void setup() {
  size(640, 480);
  smooth(8);
  // ref img: https://goo.gl/images/42uTvP
}

void draw() {
  firstThirdW = width * 0.3;
  firstThirdH = height * 0.3;

  lastThirdW = width * 0.6;
  lastThirdH = height * 0.6;
  background(200);
  
  //**
  // The one on the left
  //**
  // stinger
  fill(0);
  triangle(firstThirdW - 110, firstThirdH, firstThirdW - 70, firstThirdH + 5, firstThirdW - 70, firstThirdH - 5);
  
  // behind wing
  fill(0, 20);
  bezier(firstThirdW - 40, firstThirdH - 40, firstThirdW - 80, 20, firstThirdW + 10, 30, firstThirdW + 10, firstThirdH - 40);

  // behind legs
  fill(0);
  ellipse(firstThirdW + 30, firstThirdH + 60, 5, 20);
  ellipse(firstThirdW - 5, firstThirdH + 62, 5, 20);
  ellipse(firstThirdW - 35, firstThirdH + 55, 5, 20);
  
  // body
  fill(239, 201, 0);
  ellipse(firstThirdW, firstThirdH, 160, 120);
  strokeWeight(3);
  noFill();
  arc(firstThirdW, firstThirdH, 60, 120, PI * .5, PI * 1.5);
  arc(firstThirdW - 30, firstThirdH, 50, 110, PI * .5, PI * 1.5);
  arc(firstThirdW - 40, firstThirdH, 60, 100, PI * .5, PI * 1.5);

  // face
  fill(0);
  ellipse(firstThirdW + 25, firstThirdH, 5, 5);
  ellipse(firstThirdW + 60, firstThirdH, 5, 5);
  ellipse(firstThirdW + 40, firstThirdH + 20, 15, 10);
  
  // forward legs
  ellipse(firstThirdW + 10, firstThirdH + 60, 5, 20);
  ellipse(firstThirdW - 20, firstThirdH + 61, 5, 20);
  ellipse(firstThirdW - 55, firstThirdH + 50, 5, 20);
  
  // forward wing
  fill(0, 20);
  bezier(firstThirdW - 10, firstThirdH - 50, firstThirdW - 20, 0, firstThirdW + 80, 40, firstThirdW + 30, firstThirdH - 40);

  //**
  // The one on the right
  //**
  // stinger
  fill(0);
  triangle(lastThirdW - 110, lastThirdH, lastThirdW - 70, lastThirdH + 5, lastThirdW - 70, lastThirdH - 5);
  
  // behind wing
  fill(0, 20);
  bezier(lastThirdW - 40, lastThirdH - 40, lastThirdW - 80, 120, lastThirdW + 10, 150, lastThirdW + 10, lastThirdH - 40);

  // behind legs
  fill(0);
  ellipse(lastThirdW + 30, lastThirdH + 60, 5, 20);
  ellipse(lastThirdW - 5, lastThirdH + 62, 5, 20);
  ellipse(lastThirdW - 35, lastThirdH + 55, 5, 20);
  
  // body
  fill(239, 201, 0);
  ellipse(lastThirdW, lastThirdH, 160, 120);
  strokeWeight(3);
  noFill();
  arc(lastThirdW, lastThirdH, 60, 120, PI * .5, PI * 1.5);
  arc(lastThirdW - 30, lastThirdH, 50, 110, PI * .5, PI * 1.5);
  arc(lastThirdW - 40, lastThirdH, 60, 100, PI * .5, PI * 1.5);

  // face
  fill(0);
  ellipse(lastThirdW + 25, lastThirdH, 5, 5);
  ellipse(lastThirdW + 60, lastThirdH, 5, 5);
  ellipse(lastThirdW + 40, lastThirdH + 20, 15, 10);
  
  // forward legs
  ellipse(lastThirdW + 10, lastThirdH + 60, 5, 20);
  ellipse(lastThirdW - 20, lastThirdH + 61, 5, 20);
  ellipse(lastThirdW - 55, lastThirdH + 50, 5, 20);
  
  // forward wing
  fill(0, 20);
  bezier(lastThirdW - 10, lastThirdH - 50, lastThirdW - 20, 100, lastThirdW + 80, 150, lastThirdW + 30, lastThirdH - 40);
  
  println(mouseX, mouseY);
}
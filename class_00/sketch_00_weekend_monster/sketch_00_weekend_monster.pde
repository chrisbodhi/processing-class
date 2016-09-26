PShape horns;
PShape teeth;

void setup() {
  size(500, 500);
  background(199);
  
  // horn setup
  horns = createShape();
  horns.beginShape();
  horns.vertex(100, 60);
  horns.vertex(100, 100);
  horns.vertex(320, 100);
  horns.vertex(320, 60);
  horns.vertex(340, 120);
  horns.vertex(80, 120);
  horns.endShape(CLOSE);
  
  // teeth setup
  teeth = createShape();
  teeth.fill(255);
  teeth.beginShape();
  teeth.vertex(180, 150);
  teeth.vertex(185, 160);
  teeth.vertex(190, 150);
  teeth.vertex(195, 160);
  teeth.vertex(200, 150);
  teeth.vertex(205, 160);
  teeth.vertex(210, 150);
  teeth.vertex(215, 160);
  teeth.vertex(220, 150);
  teeth.vertex(225, 160);
  teeth.vertex(230, 150);
  teeth.vertex(235, 160);
  teeth.vertex(240, 150);
  teeth.endShape(CLOSE);

}

void draw() {
  strokeWeight(1);
  fill(255);
  
  // horns
  shape(horns);
  
  // head
  ellipse(210, 135, 150, 110);
  
  // --- face ---
  // eyes
  strokeWeight(random(1, 5));
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(180, 115, random(10, 15), random(10, 15));
  ellipse(240, 115, random(10, 15), random(10, 15));
  
  strokeWeight(1);
  
  // mouth
  fill(0);
  arc(210, 150, 60, 40, 0, PI);
  line(180, 150, 240, 150);
  
  // teeth
  shape(teeth);
  
  // debugging
  println(mouseX, mouseY);
}
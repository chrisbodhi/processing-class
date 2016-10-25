// http://algorithmicbotany.org/papers/abop/abop-ch4.pdf

int numberOfFlorets = 1000;
float angleFloret = radians(137.5);
int c = 3;

void setup() {
  size(500, 500); // a+ tumblr dimensions
  pixelDensity(2);
}

void draw() {
  background(255);
  // moves the origin to the center of the canvas
  translate(width/2, height/2);

  for(int i = 1; i <= numberOfFlorets; i++) {
    float theta = i * angleFloret;
    float radius = c * sqrt(i);

//    naive approach
//    float x = radius * cos(theta) + width/2;
//    float y = radius * sin(theta) + height/2;

    // no need to add since we used `translate`
    float x = radius * cos(theta);
    float y = radius * sin(theta);

    fill(44, 245, 147);
    // how to radiate out a color as the fill?
    // one at a time, working its way through
    // the whole piece?
    ellipse(x, y, 10, 10);
  }
  
  // animate
  angleFloret += 0.00001;
}
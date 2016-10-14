int tailLength = 50;
int[] xPos = new int[tailLength];
int[] yPos = new int[tailLength];
int[] oppX = new int[tailLength];
int[] oppY = new int[tailLength];

void setup() {
  size(500, 500);
  pixelDensity(2);
  
  // init the arrays
  for (int i = 0; i < tailLength; i++) {
    xPos[i] = 0;
    yPos[i] = 0;
    oppX[i] = 0;
    oppY[i] = 0;
  }
}

void draw(){
  background(0);
  
  // shift all of the values
  for (int i = 0; i < tailLength - 1; i++) {
    xPos[i] = xPos[i + 1];
    yPos[i] = yPos[i + 1];
    
    oppX[i] = oppX[i + 1];
    oppY[i] = oppY[i + 1];
  }
  
  // set the x and y positions
  xPos[tailLength - 1] = mouseX;
  yPos[tailLength - 1] = mouseY;
  
  oppX[tailLength - 1] = width - mouseX;
  oppY[tailLength - 1] = height - mouseY;
  
  // draw 'em all
  for (int i = 0; i < tailLength; i++) {
    noStroke();
    fill(0 + (i * 5));
    ellipse(xPos[i], yPos[i], i, i);
    ellipse(oppX[i], oppY[i], i, i);
  }

}
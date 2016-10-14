# Array, Maths, and more

_13 October 2016_

- function review

```
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
```

# arrays

- basic data structure

```
int ballX;
int ballX2;

// all of the functions called for each ball
// redundant af, fear of arthritis
```

`int[] ballXArray = new int[100];` to make a 100-long array
`TYPE[] VARIABLE_NAME = new TYPE[length];` 

- _TYPE_ has to be the same on both sides of the assignment
- _length_ can be a number or an expression that evals to a number or a variable representing a number

*in ball_bounce_functions*

```
int[] ballXArray = new int[3];
int[] speedArray = new int[3];

...
void setup() {
    size(500, 500);
    pixelDensity(2);
    noStroke();

    // initalize the ball position
    ballXArray[0] = 50;
    ballXArray[1] = 130;
    ballXArray[2] = 200;
    // ballXArray = [50, 130, 200];

    speedArray[0] = 5;
    speedArray[1] = 8;
    speedArray[2] = 2;
    // speedArray = [5, 8, 2];
}
```

then use a `for` loop, first in setting up:

``
for (int i = 0; i < ballXArray.length; i++) {
  ballXArray[i] = int(random(0, 500));
  speedArray[i] = int(random(2, 8));
}
```

...then when drawing:

```
void move() {
  for (int i = 0; i < 3; i++) {
    ellipse(ballXArray[i], height/2, 100, 100);
  }
}
```

...and so forth.


_todo: onclick, make circle with reverberations like waves on water_

## Objects Stuff

_later_

## Midterm

- write out how to draw a thing
- draw what gets drawn based on conditional
- use a loop to draw five circles
- function that averages four numbers
- two or three sentences about objects


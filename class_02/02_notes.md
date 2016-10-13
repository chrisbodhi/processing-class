# Functions and Objects

`pixelDensity(2)` for Retina displays to smooth out the curves

## Functions

- `rect`, `line`, `ellipse`, `size`, `println`, `random`, `setup`, `draw`

- anatomy of a function declaration

```
returnType functionName(parameters) {
    // code block of function
}
```

```
void drawRedCircle() {
    fill(255, 0, 0);
    ellipse(100, 100, 30, 30);
}
```

```
void ball(int r, int g, int b) {
  noStroke();
  fill(r, g, b);
  ellipse(100,y,30,30);
}
```

- using arguments: `rect(x, y, width, height);`

`colorMode(HSB, width)` -- hue, saturation, brightness; default is `RGB`; width sets the range which remaps the max value [default being 255 for RGB]

`ball(mouseX, width, width)`

- In function definition, arguments gotta have their type declared: `void addTwo(int newNum){...}`

## Return types

We need them!

## Example: distance formula

from a fixed point, determine how far away the mouse is
uses the pythagorean formula!

float dx = x2 - x1;
float dy = y2 - y1;

float c = sqrt(dx*dx + dy*dy);


# Objects

sloths that have attributes and functions/methods

classes!




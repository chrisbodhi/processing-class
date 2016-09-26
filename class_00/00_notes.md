#creating generative sculptures with everyday objects using processing [P5 401]
##jerome martinez
### Sept. 22, 2016


###overview

- lecture/guided exercises
- based on 'learning processing' book by daniel shiffman
- homeworks
- office hours
- exhibit!

###processing

- written in java
- is a framework
- who uses it? humans!
- why use it? concepts are agnostic to programming languages
- what do i need to know to be good at it? not a ton of math, practice at it, do it

##Basics

###pixels and the grid

- the origin, `(0, 0)``
- working all in positive numbers
- origin is in _top left_ corner

- `size(width, height);`
- `background(number);` for grayscale
- `point(x, y);` needs two values
- `line(x, y, x2, y2);` needs two points; second in relation to first, not from the origin, as I originally tried
- `stroke(r, g, b);` takes three values, RGB, for color
  - subtractive coloring, not pigmative
- `strokeWeight(number)` for line heaviness

- lots of other primitives, like bezier curve

###shapes

- `ellipse(x, y, width, height);` origin is center
- `rect(x, y, width, height);` origin is top left

- `ellipseMode(mode);`
- `rectMode(mode);`
- modes: corners, corner, or center

_recreating piet mondri? art in processing_

##More 2D & Interface

- `quad()` for any quadrilateral shape; takes four points, natch
- `curve()` for tangents and bezier curves
- `triangle()` like `quad`, with three points
- [docs are here](processing.org/reference) to get info about function stuff
- `println(string)` to print to console; useful for debugging, lol fml

##Basic Interaction

- `setup()`
  - contains setup instructions; runs once
- `draw()`
  - runs in a loop, which is called the draw loop; stops when the window closes
  - will continue running and looping, even if static elements are in the `draw` block
- tweak mode
  - only available to code in `draw`
- mouseX, mouseY
  - tracking where mouse is
  - dynamic variable in draw loop
  - `rect(mouseX, mouseY, 50, 50)` to have the box follow the mouse
  - `point(mouseX, mouseY)`
- pmouseX, pmouseY
  - uses _p_revious mouse position to connect it to the current value
  - would be used to draw a line, for example
  - using `mouseX` and `mouseY` makes it dots because draw rate isn't as fast as mouse movement
- taking `background` out of code means that redrawn shapes persist
  - ending of solitaire on Windows, for instance

- `random(num);` returns random number before zero and num  

_ruler for processing canvas?_
_code snippets for ide?_
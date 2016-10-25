# Algorithms &amp; Exhibit Info

_20 october 2016_

### recap

arrays!

```
int[] aBunchOfNumbers;

void setup() {
    size(500, 500);
    aBunchOfNumbers = new int[15];
    for (int i = 0; i < aBunchOfNumbers.length; i++) {
        int randomNumber = int(random(0, height));
        aBunchOfNumbers[i] = randomNumber;
    }
}

void draw() {
    background(255);
    for (int i=0; i < aBunchOfNumbers.length; i++) {
        fill(int(random(0, 255)));
        ellipse(width/2, aBunchOfNumbers[i], 30, 30);
    }
}
```

## Algorithms

_al gore rhythms_

a step of steps for following a process

_findMaximum algo_

**phyllotaxis**: spiral formations in plants and fruits and shells and all over nature

vogel's formula

* * *

exhibition ideas

- projecting on a nude model
- projecting on a meditating human
- photo booth with our images projected onto viewers; projection mapping with viewer as canvas, capture themselves as part of the art
- wifi hotspot, connect to get image with randomly seeded something or other

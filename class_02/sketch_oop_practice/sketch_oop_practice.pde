void setup() {
  Sloth larry = new Sloth();
  println(larry);
  println(larry.armLength);
  larry.sleep();
  
  Sloth fasty = new Sloth(50000);
  println(fasty.speed); // 50000
}

class Sloth {
  float posx;
  float posy;

  // declaring attributes
  int hairAmount;
  float armLength;
  float speed;
  boolean isHungry;
  
  // constructor function
  // no need to declare values
  Sloth() {
    // casting the type
    hairAmount = int(random(0, 20));
    armLength = random(0, 10);
    speed = random(0, 5);
    isHungry = true;
  }
  
  // overloading
  // passing in args
  Sloth(float expSpeed) {
    // casting the type
    hairAmount = int(random(0, 20));
    armLength = random(0, 10);
    speed = expSpeed;
    isHungry = true;
  }
  
  void crawl() {
    posx += armLength + speed;
  }
  
  void eat(int foodAmount) {
    if (foodAmount == 0) {
      isHungry = true;
    } else {
      isHungry = false;
    }
  }

  void sleep() {
    println("zzzzzzzzzzz");
  }
}
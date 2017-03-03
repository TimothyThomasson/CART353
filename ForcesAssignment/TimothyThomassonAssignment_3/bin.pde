

class Bin {


  PVector position;
  PVector velocity;
  PVector acceleration;
  int mass;
  float c = 0.001;


  //Constructor
  Bin() {
    position = new PVector(width * 0.5, height * 0.5);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 50;
    recycleBin = loadImage("recycleBin.png");
  }


  void applyForce(PVector force) {
    //the bin position x
    println("binPosX", bin.position.x);
    println("mineSweeperXStart", width/2+100);
    println("mineSweeperXEnd", (width/2+100)+177);
    float x = force.x;
    float y = force.y;

    //check if the bin's x position is in minesweeper zone 
    //if it is it launches the bin across the screen 
    if (bin.position.x >= width/2+100 && bin.position.x <= (width/2+100)+177 && bin.position.y >= 200 && bin.position.y <= 200+259) {
      if (force.x != 0) {
        if (force.x < 0) { 
          x = force.x + 0.7;
          println("slowdownleft");
        } else if (force.x > 0) {
          x = force.x - 0.7;
          println("slowdownr");
        }
      } 

      if (force.y != 0) {
        if (force.y < 0) { 
          x = force.y + 0.7;
          println("slowdownleft");
        } else if (force.y > 0) {
          x = force.y - 0.7;
          println("slowdownr");
        }
      }
    } 




    acceleration.add(new PVector(x, y));
  }

  //get key presses and apply forces
  void move(float force) {
    if (key == 'w' || key == 'W') {
      bin.applyForce(new PVector(0, -force * mass));
    }
    if (key == 's' || key == 'S') {
      bin.applyForce(new PVector(0, force * mass));
    }
    if (key == 'a' || key == 'A') {
      bin.applyForce(new PVector(-force * mass, 0));
    }
    if (key == 'd' || key == 'D') {
      bin.applyForce(new PVector(force * mass, 0));
    }
  }


  void update() {
    velocity.add(acceleration);
    position.add(velocity);

    if (position.x < mass / 2) {
      position.x = mass / 2;
      velocity.x = 0;
    }
    if (position.x > (width - mass / 2)) {
      position.x = width - mass / 2;
      velocity.x = 0;
    }
    if (position.y < mass / 2) {
      position.y = mass / 2;
      velocity.y = 0;
    }
    if (position.y > (height - mass / 2)) {
      position.y = height - mass / 2;
      velocity.y = 0;
    }

    //reset the acceleration to zero
    acceleration.mult(0);
  }


  void display() {

    image(recycleBin, position.x, position.y);
  }
}

class Icons {


  //class variables
  PImage iconImage;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass; 


  //constructor for icon
  Icons(PImage file, int x, int y) {
    //load icon image
    iconImage = file;
    println(x, y);
    //set icon position
    position = new PVector(x, y);

    //default icon velocity and acceleration
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    mass = 0;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    image(iconImage, position.x, position.y);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }
  }
}

class Icon {


  //class variables
  PImage iconImage;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass; 
  float g = 0.4;


  //constructor for icon
  Icon(PImage file, int x, int y) {
    //load icon image
    iconImage = file;
    //set icon position
    position = new PVector(x, y);
    //default icon velocity and acceleration
    //velocity = new PVector(random(-5, 5), random(-5, 5));
    acceleration = new PVector(0, 0);

    mass = 5;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update(Bin bin) {


    velocity = attract(bin, 50);
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {

    image(iconImage, position.x, position.y);
  }

  void checkEdges() {

    if (position.x > width-65) {
      position.x = width-65;
      velocity.x *= -1;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -5;
    }

    if (position.y > height-65) {
      position.y = height-65;
      velocity.y *= -1;
    } else if (position.y < 0) {
      position.y = 0; 
      velocity.y *= -5;
    }
  }

  // our attract method, which takes a mover as well as a multiplier (which impacts on direction)
  PVector attract(Bin bin, float multiplier) {
    PVector force = PVector.sub(position, bin.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * bin.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength * multiplier);                                         // Get force vector --> magnitude * direction
    return force;
  }
}
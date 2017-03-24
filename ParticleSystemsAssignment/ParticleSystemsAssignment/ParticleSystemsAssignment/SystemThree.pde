
// ======================================================

class Termites extends Particle {

  float topspeed;

  Termites(PVector l) {
    super(l);
    topspeed = 1000.0;
  }

  // we override Particle's update method
  void update() {
    velocity.add(acceleration);
    position.add(velocity);

    
    lifespan -= 0.1;

    checkEdges();
  }

  // we override Particle's display method
  void display() {
    stroke(#674D2D, lifespan);
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading());
    ellipse(0, 0, 10, 5);
    popMatrix();
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
  }
}
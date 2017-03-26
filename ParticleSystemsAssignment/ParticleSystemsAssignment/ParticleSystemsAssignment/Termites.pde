
// ======================================================

class Termites extends Particle {

  float topspeed;

  Termites(PVector l) {
    super(l);
    topspeed = 1000.0;
  }


  //METHOD TO UPDATE THE POS
  void update() {
    velocity.add(acceleration);
    position.add(velocity);

    
    lifespan -= 0.1;

    checkEdges();
  }

//METHOD TO DISPLY THIS CHANGE FOR THE PARTICLE
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
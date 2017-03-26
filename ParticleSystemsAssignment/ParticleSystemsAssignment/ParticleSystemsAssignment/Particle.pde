
// ======================================================
class Particle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  //METHOD TO UPDATE THE POS
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // METHOD TO DISPLY
  void display() {
    noStroke();
    fill(255, lifespan);
    ellipse(position.x, position.y, 12, 12);
  }

  // WHEN TO KILL PARTICLE?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
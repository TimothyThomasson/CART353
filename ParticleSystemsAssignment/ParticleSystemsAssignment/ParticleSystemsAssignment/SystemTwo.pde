
// ======================================================

class Dart extends Particle {

  float randomPoint;
  int randomVert;

  Dart(PVector l) {
    super(l);
      randomPoint = random(50);
  }


  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 0.2;
  
  }
  // Inherits update() from parent

  // we override Particle's display method
  void display() {
    stroke(0, lifespan);
    strokeWeight(1);
    fill(255, lifespan);
    pushMatrix();

    translate(position.x, position.y);
    rotate(velocity.heading());

    // draw a dart-like thing
    noFill();
    stroke(255);
    quad(randomPoint, -randomPoint, randomPoint, randomPoint, randomPoint*3, randomPoint, randomPoint*2,-randomPoint);
  }
}
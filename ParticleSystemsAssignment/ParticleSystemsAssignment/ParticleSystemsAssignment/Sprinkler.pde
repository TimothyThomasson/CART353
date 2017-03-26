
// ======================================================

//EXTEND PARTICLE SYSTEM TO USE METHODS
class Sprinkler extends Particle {

  Sprinkler(PVector l) {
    super(l);
  }

  //CHANGE PARTICLE DISPLAY METHOD
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(255, lifespan);
    pushMatrix();
    translate(position.x, position.y);
    float theta = map(position.x+=(mouseX/100), 0, width, 0, TWO_PI);
    rotate(theta);
    ellipse(0, 0, 4, 4);
    popMatrix();
  }
}
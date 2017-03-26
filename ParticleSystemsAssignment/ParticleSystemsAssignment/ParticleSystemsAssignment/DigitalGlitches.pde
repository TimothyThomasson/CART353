
// ======================================================

class Glitches extends Particle {

  float randomPoint;
  int randomVert;

  Glitches(PVector l) {
    super(l);
      randomPoint = random(50);
  }


  //METHOD TO UPDATE THE POS
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 0.2;
  
  }



  void display() {
    stroke(0, lifespan);
    strokeWeight(1);
    fill(255, lifespan);
    pushMatrix();

    translate(position.x, position.y);
    rotate(velocity.heading());

//DRAW THE GLITCHES AT RANDOM SPOTS
    noFill();
    stroke(255);
    quad(randomPoint, -randomPoint, randomPoint, randomPoint, randomPoint*3, randomPoint, randomPoint*2,-randomPoint);
  }
}
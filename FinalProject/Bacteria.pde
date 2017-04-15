
// MAKES USE OF 'Punktiert' LIBRARY TO EMIT / CREATE BACTERIA LIKE OBJECTS 

import punktiert.math.Vec;
import punktiert.physics.*;

class Bacteria {

  LeapMotion leap;

  // PHYSICS OBJ
  VPhysics physics;

  // NUM OF PARTICLES
  int amount = 1300;

  // ======================================================
  // CONSTRUCTOR 
  Bacteria(LeapMotion leap) {

    this.leap = leap;
  }

  public void display() {

    noStroke();
    fill(0, 255);

    // CREATE PHYSICS SYSTEM 
    physics = new VPhysics(width, height);
    physics.setfriction(.1f);
    //CREATE ARRAY OF PARICLES
    for (int i = 0; i < amount; i++) {
      //val for arbitrary radius
      float rad = random(5, 30);
      //vector for position
      Vec pos = new Vec (random(rad, width-rad), random(rad, height-rad));
      //create particle (Vec pos, mass, radius)
      VParticle particle = new VParticle(pos, 1, rad);
      //add Collision Behavior
      particle.addBehavior(new BCollision());
      //add particle to world
      physics.addParticle(particle);
    }

    background(255);
    Hand rightHandOnScreen = leap.getRightHand();
    physics.update();

    for (VParticle p : physics.particles) {
      ellipse(p.x, p.y, p.getRadius()*2, p.getRadius()*2);
    }

    Finger finger = rightHandOnScreen.getFingers().get(0); 
    PVector fingerPosition = finger.getPosition();
    physics.addParticle(new VParticle(new Vec(fingerPosition.x, fingerPosition.y), 1, random(5, 20)).addBehavior(new BCollision()));
  }

  void setupScenario() {
  }
}
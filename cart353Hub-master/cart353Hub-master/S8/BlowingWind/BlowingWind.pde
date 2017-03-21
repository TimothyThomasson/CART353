// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
import ddf.minim.*;

Minim minim;
AudioInput in;
ParticleSystem ps;

void setup() {
  size(640, 360);
  ps = new ParticleSystem();

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw() {
  background(255);

  // add gravity force to all
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);

  float leftSide = 0;
  float rightSide = 0;

  // I'm averaging the abs value of both the left input and right input
  // this will tell me about how much sound is coming in
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    leftSide += Math.abs(in.left.get(i));
    rightSide += Math.abs(in.right.get(i));
  }

  leftSide /= in.bufferSize();
  rightSide /= in.bufferSize();

  // if the left input is over a certain threshold
  if (leftSide >= 0.01) {
    
    // make a kind of wind vector with a rightwards force
    PVector left = new PVector(leftSide * 10, 0);
    ps.applyForce(left);
  }

  // my microphone is only on the left side of my computer so the rightside feed is identical to the
  // left side feed - this is commented out for now
  /*if (rightSide >= 0.01) {
   
   // make a kind of wind vector with a leftwards force i.e. mult by -1 for x val
   PVector right = new PVector(-1 * rightSide * 10, 0);
   ps.applyForce(right);
   }*/

  for (int i = 0; i < 5; i++) {
    ps.addParticle();
  }
  ps.run();
}
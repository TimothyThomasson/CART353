
// THIS SCENARIO CREATES A RANDOM SHAPE IF USER MAKES A FIST

class RandomShapeGenerator {

  //CREATE OBJECTS FOR LIBS
  LeapMotion leap;

  //CREATE VARIABLES FOR SHAPE
  float sizeOfSphereObject;
  float sizeOfAbstractObject;
  int sphereDetailOne;
  int sphereDetailTwo;

  // ======================================================
  // CONSTRUCTOR 
  RandomShapeGenerator(LeapMotion leap) {

    this.leap = leap;
  } // END - CONSTRUCTOR

  // ======================================================
  void display() {
    background(#FAE928);
    stroke(#ADA9A9);
    strokeWeight(2);
    lights();
    for (Hand hand : leap.getHands ()) {
      // draw the waveforms so we can see what we are monitoring


      sizeOfSphereObject = 350;
      sizeOfAbstractObject = 250 - (200*hand.getGrabStrength());

      //(50* hand.getGrabStrength());

      if (hand.getGrabStrength() == 1) {
        sphereDetailOne = int(random(1, 15));
        sphereDetailTwo = int(random(1, 9));
        background(int(random(255)), int(random(255)), int(random(255)));
      } 

      //noFill();
      //pushMatrix();
      //translate(width/2, height/2);
      //rotateY(radians(frameCount));
      //sphereDetail(6);
      //sphere(sizeOfSphereObject + in.right.get(i+1)*50 );
      //popMatrix();
      ////println(hand.getPosition());
      ambientLight(50, 50, 0);
      spotLight(255,0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 1);

      fill(#2F3134);
      pushMatrix();
      translate(width/2, height/2);
      rotateZ(radians(hand.getPitch()));
      rotateX(radians(hand.getRoll()));
      rotateY(radians(hand.getYaw()));
      sphereDetail(sphereDetailOne, sphereDetailTwo);
      sphere(sizeOfAbstractObject);
      popMatrix();
    }
  }

  // ======================================================
  void setupScenario() {
  }
}
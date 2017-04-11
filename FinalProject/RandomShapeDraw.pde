

// THIS SCENARIO CREATES A RANDOM SHAPE that paints across canvas
class RandomShapeDraw {

  //CREATE OBJECTS FOR LIBS
  Minim minim;
  AudioInput in;
  LeapMotion leap;

  //CREATE VARIABLES FOR SHAPE
  float sizeOfSphereObject;
  float sizeOfAbstractObject;
  int sphereDetailOne;
  int sphereDetailTwo;

  // ======================================================
  // CONSTRUCTOR 
  RandomShapeDraw(LeapMotion leap) {

    this.leap = leap;
  } // END - CONSTRUCTOR

  // ======================================================
  void display() {

    strokeWeight(1);
    for (Hand hand : leap.getHands ()) {
      // draw the waveforms so we can see what we are monitoring

      //sizeOfAbstractObject = 1250 - (200*hand.getGrabStrength());

      //(50* hand.getGrabStrength());
      Hand rightHandOnScreen = leap.getRightHand();
      if (hand.getGrabStrength() == 1) {
        sphereDetailOne = int(random(1, 12));
        sphereDetailTwo = int(random(1, 7));


        stroke(int(random(255)), 0, int(random(255)));
      } else {
        sphereDetailOne = 4;
        sphereDetailTwo = 9;
      }

      if (rightHandOnScreen != null) {


        Finger finger = rightHandOnScreen.getFingers().get(0); 
        PVector fingerPosition = finger.getPosition();

        sizeOfAbstractObject =  1000;

        pushMatrix();
        noFill();
        shapeMode(CENTER);
        //scale(0,0,fingerPosition.z*4);
        translate(fingerPosition.x, fingerPosition.y);
        rotateZ(radians(hand.getPitch()));
        rotateX(radians(hand.getRoll()));
        rotateY(radians(hand.getYaw()));
        sphereDetail(sphereDetailOne-1, sphereDetailTwo-2);
        sphere(sizeOfAbstractObject);
        popMatrix();
      }
    }
  }
  // ======================================================
  void setupScenario() {
    //background(#FAE928);
  }
}

// THIS CLASS IS MAKES THE 'INTRO' SCREEN FOR THE WHOLE PROJECT

// ======================================================
// Re-IMPORT JUST IN CASE
import processing.video.*;
import processing.sound.*;

// ======================================================
//CALIBRATION (INTRO / TUTORIAL)
class Calibration {

  // LEAP
  LeapMotion leap;

  //// MOVIE (HAD TO COMMENT OUT BECAUSE IT WAS NOT LOADING PROPERLY IN CLASS, MOVED TO MAIN
  //Movie brixton;
  //// Movie ampersandDatabend;

  // SOUND
  SoundFile beep;
  SoundFile glitch;

  // ======================================================
  //int numPixels;
  //int blockSize = 10;
  //color myMovieColors[];
  //PFont myFont;

  //CREATE BOOLEANS FOR TARGET CHECK
  boolean targetOneIsTouched;
  boolean targetTwoIsTouched;
  boolean targetThreeIsTouched;
  boolean targetFourIsTouched;
  boolean allTargetsTouched;

  //CREATE BOOLEAN TO SEE IF SOUND TRIGGERED
  boolean isSoundOneTriggered; 
  boolean isSoundTwoTriggered; 
  boolean isSoundThreeTriggered; 
  boolean isSoundFourTriggered;
  boolean isSoundGlitchTriggered = true;

  //MAKE VARIABLE TO HOLD LEAP HAND POSITIONS GLOBALLY
  float xPosition;
  float yPosition;

  //MAKE CONDITIONAL FOR GAME START 
  boolean gameStart;

  // ======================================================
  Calibration(PApplet app, LeapMotion leap) {

    // SET
    this.leap = leap;

    //// BACKGROUND VIDEO
    //brixton = new Movie(app, "Brixton.mp4");
    //brixton.loop();
    //brixton.volume(0);

    // END VIDEO
    // ampersandDatabend = new Movie(app,"ampersandDatabendTrim.mp4");

    // INIT POSITION
    xPosition = 0.0;
    yPosition = 0.0;

    //// INIT DISTORTION
    //numPixels = width / blockSize;
    //myMovieColors = new color[numPixels * numPixels];

    // INIT SOUNDS
    beep = new SoundFile(app, "beep.wav");
    glitch = new SoundFile(app, "glitch.mp3");

    //INIT ALL THE TARGET BOOLEANS
    targetOneIsTouched = false;
    targetTwoIsTouched = false;
    targetThreeIsTouched = false;
    targetFourIsTouched = false;
    allTargetsTouched = false;
  }

  // ======================================================
  void display() {

    // *****  THIS IS COMMENTED OUT BECASUE THE VIDEO HAD TO BE INTEGRATED INTO THE MAIN  *****

    ////DISPLAY THE VID
    //image(brixton, width/2, height/2);
    //translate(0, 0);
    //imageMode(CENTER);

    ////CREATE PIXELATION EFFECT :) 
    //for (int j = 0; j < numPixels; j++) {

    //  for (int i = 0; i < numPixels; i++) {

    //    //alpha();
    //    imageMode(CENTER);
    //    //tint(150, 5, 150, 200);
    //    //WILL START VIDEO ONCE HAND IS DETECTED AND xPosition changes
    //    fill(myMovieColors[j*numPixels + i], xPosition*i);
    //    rect(i*blockSize, j*blockSize, blockSize-1, blockSize-1);

    //  }

    //}

    // START DRAWING TARGETS FOR 'CALIBRATION'
    displayTarget(250, 200, #FA1414);
    displayTarget(1650, 200, #FA1414);
    displayTarget(1650, 870, #FA1414);
    displayTarget(250, 870, #FA1414);

    // POSSIBLE ALTERNATIVE COLOUR #36D329
    fill(#FA1414);
    textAlign(CENTER);
    textSize(85);
    //fontTing = loadFont("DialogInput.bolditalic",80);
    myFont = createFont("DialogInput.bolditalic.vlw", 80);
    textFont(myFont);
    text("PLEASE CALIBRATE SYSTEM", width/2, height/2);

    // ~~
    
    // CALL TO CHECK IF TARGET TOUCHED
    check();
    // RESET STROKE AND STROKEWEIGHT
    stroke(0);
    strokeWeight(1);

    // CALL TO SHOW CROSSHAIR
    crossHair();
    // RESET STROKE AND STROKEWEIGHT
    stroke(0);
    strokeWeight(1);
  }

  //FUNCTION FOR DISPLAYING TARGET, TAKES IN POSITIONS
  void displayTarget(int posX, int posY, color c) {

    stroke(c);
    strokeWeight(6);
    smooth(4);
    noFill();
    ellipseMode(CENTER);
    ellipse(posX, posY, 150, 150);
    ellipse(posX, posY, 100, 100);
    ellipse(posX, posY, 50, 50);
    ellipse(posX, posY, 25, 25);
  }

  // ======================================================
  void crossHair() {
    Hand rightHandOnScreen = leap.getRightHand();

    if (rightHandOnScreen != null) {

      Finger finger = rightHandOnScreen.getFingers().get(0); 
      PVector fingerPosition = finger.getPosition();
      translate(fingerPosition.x-80, fingerPosition.y-45);
      stroke(#FA1414);
      strokeWeight(6);
      line(90, 0, 90, 90);
      line(45, 45, 135, 45);

      xPosition = fingerPosition.x;
      yPosition = fingerPosition.y;
    }
  }

  //
  // *****************************************************************
  // 

  // ======================================================
  // CHECK THE SHIT 
  void check() {

    if (xPosition >= 210 && xPosition <= 275 && yPosition >= 185 && yPosition <= 220 && targetOneIsTouched == false) {
      targetOneIsTouched = true;
      isSoundOneTriggered = true;
      //stroke(255);
    } 
    if (xPosition >= 1600 && xPosition <= 1685 && yPosition >= 185 && yPosition <= 220 && targetTwoIsTouched == false) {
      targetTwoIsTouched = true;
      isSoundTwoTriggered = true;
      stroke(255);
    } 
    if (xPosition >= 210 && xPosition <= 275 && yPosition >= 835 && yPosition <= 900 && targetThreeIsTouched == false) {
      targetThreeIsTouched = true;
      isSoundThreeTriggered = true;
      stroke(255);
    } 
    if (xPosition >= 1600 && xPosition <= 1685 && yPosition >= 835 && yPosition <= 900 && targetFourIsTouched == false) {
      targetFourIsTouched = true;
      isSoundFourTriggered = true;
      stroke(255);
    }

    if (targetOneIsTouched && isSoundOneTriggered == true) {
      //PLAY BEEP NOISE
      beep.play();
      isSoundOneTriggered = false;
    }
    if (targetTwoIsTouched && isSoundTwoTriggered == true) {
      //PLAY BEEP NOISE
      beep.play();
      isSoundTwoTriggered = false;
    }
    if (targetThreeIsTouched && isSoundThreeTriggered == true) {
      //PLAY BEEP NOISE
      beep.play();
      isSoundThreeTriggered = false;
    }
    if (targetFourIsTouched && isSoundFourTriggered == true) {
      //PLAY BEEP NOISE
      beep.play();
      isSoundFourTriggered = false;
    }

    //CHANGE THE COLOUR OF TARGETS DEM
    if (targetOneIsTouched) {
      displayTarget(250, 200, 255);
      stroke(0);
      //translate(250, 200);
      //strokeWeight(0);
    }
    if (targetTwoIsTouched) {
      displayTarget(1650, 200, 255);
      stroke(0);
      //translate(250, 200);
      //strokeWeight(0);
    }

    if (targetThreeIsTouched) {
      displayTarget(250, 870, 255);
      stroke(0);
      //translate(250, 200);
      //strokeWeight(0);
    }

    if (targetFourIsTouched) {
      displayTarget(1650, 870, 255);

      //stroke(0);
      //translate(250, 200);
      //strokeWeight(0);
    }


    //
    // *****************************************************************
    //

    // END CALIBRATION THING

    if (targetOneIsTouched && targetTwoIsTouched && targetThreeIsTouched && targetFourIsTouched && allTargetsTouched == false && isSoundGlitchTriggered ==true) {
      // isSoundGlitchTriggered = true;
      allTargetsTouched = true;
    }


    if (allTargetsTouched && isSoundGlitchTriggered) {
      glitch.play();
      isSoundGlitchTriggered = false;
      allTargetsTouched = false;
      gameStart = true;
      //START TIMER
    }
  }
}
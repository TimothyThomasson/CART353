
// TIMOTHY THOMASSON -- FINAL PROJECT 
// CART 353
// RILLA KHALED
// 2017-04-11

// This project attempts to embrace the notion of interaction for the sake of interaction.
// As the user, it is your job to play around with what seems like a random ensemble of experiences.

// ======================================================
// IMPORTS
import de.voidplus.leapmotion.*; 
import processing.video.*;
import processing.sound.*;
import ddf.minim.*;

// DECLARE LEAP MOTION OBJECT
LeapMotion leap;

// ======================================================
// ARRAY THAT HOLDS REFERENCE TO SCENARIO CLASSES
String[] scenarios;
int activeScenarioIndex;
boolean gameActive;

// DECLARE INTRO CALIBRATION
Calibration calibration;

// DECLARE TIMER STUFF
int timePassed;
int timeStart;

// DECLARE SCENARIO CLASSES
Box box;
RandomShapeGenerator randomShapeGenerator;
RandomShapeGeneratorTwo randomShapeGeneratorTwo;
HandAnimation handAnimation;
RandomObjects randomObjects;
RandomShapeDraw randomShapeDraw;
//Bacteria bacteria;
//ScenarioEight scenarioEight;
//ScenarioNine scenarioNine;
//ScenarioTen scenarioTen;

// INTRO VIDEO PLAYED DURING CALIBRATION (HARD TO DISPLAY WITHIN CLASS BECAUSE OF 'movieEvent(Movie m)' )
Movie brixton;

// GLOBABL VARIABLES FOR INTRO VID
int numPixels;
int blockSize = 10;
color myMovieColors[];
PFont myFont;

// DECLARE TRANSITION SOUND OBJECT
SoundFile transitionSound;

// DECALRE VIDEO TO PLAY AS SCENARIOS TRANSITION FROM ONE TO THE NEXT
Movie ampersandDatabend;

// ======================================================
// INITIALIZE ARTWORK
void setup() {

  // INIT LEAP OBJECT
  leap = new LeapMotion(this);

  // INIT GAME ACTIVE
  gameActive = false;

  // SET SIZE OF WINDOW 
  //fullScreen(P3D);
  size(1920, 1080, P3D);

  background(0);

  //ANTI-ALIASING 
  smooth(4);

  // ======================================================
  // STUFF FOR INTRO VIDEO 

  stroke(0);
  strokeWeight(1);

  // BACKGROUND VIDEO (THIS CANNOT BE PUT INTO THE CALIBRATION CLASS AND EASILY DISPLAYED)
  brixton = new Movie(this, "Brixton.mp4");
  brixton.loop();
  brixton.volume(0);

  // INIT DISTORTION
  numPixels = width / blockSize;
  myMovieColors = new color[numPixels * numPixels];

  stroke(0);
  strokeWeight(1);

  // ======================================================

  // INIT SCENARIO CLASSES
  box = new Box(leap);
  randomShapeGenerator = new RandomShapeGenerator(leap);
  randomShapeGeneratorTwo = new RandomShapeGeneratorTwo(leap);
  handAnimation = new HandAnimation(leap);
  randomObjects = new RandomObjects(leap);
  randomShapeDraw = new RandomShapeDraw(leap);
  //bacteria = new Bacteria(leap);
  //scenarioEight = new ScenarioEight();
  //scenarioNine = new ScenarioNine();
  //scenarioTen = new ScenarioTen();

  // *** INITIALZE SCENARIOS LIST ***
  scenarios = new String[6];

  // LOAD SCENARIO REFERENCES INTO ARRAY
  scenarios[0] = "Box";  
  scenarios[1] = "RandomShapeGenerator"; 
  scenarios[2] = "RandomShapeGeneratorTwo";
  scenarios[3] = "HandAnimation";
  scenarios[4] = "RandomObjects";
  scenarios[5] = "RandomShapeDraw";
  //scenarios[6] = "Bacteria";
  //scenarios[7] = "scenarioEight";
  //scenarios[8] = "scenarioNine";
  //scenarios[9] = "scenarioTen";

  // INIT AND START CALIBRATION
  calibration = new Calibration(this, leap);

  // INIT TRANSITION SOUND
  transitionSound = new SoundFile(this, "glitch.mp3");

  // INIT TRANSITION VIDEO
  ampersandDatabend = new Movie(this, "Brixton2.mp4");
  ampersandDatabend.volume(0);
}

// ======================================================  
void draw() {

  // CHECK FOR CALIBRATION DONE AND GAME INACTIVE
  if (calibration.gameStart && !gameActive) {

    //
    // START GAME !
    //

    // INIT THE TIMER STUFF
    timeStart = getSeconds();
    timePassed = 0;

    // CHOOSE A RANDOM SCENARIO
    pickRandom();

    // MAKE THE GAME ACTIVE
    gameActive = true;
    println("Started");

    // IF GAME IS STILL NOT ACTIVE PLAY BACKGROUND VIDEO FOR INTRO CALIBRATION
  } else if (!gameActive) {

    //DISPLAY THE VID
    background(0);
    image(brixton, width/2, height/2, 200, 200);
    translate(0, 0);
    imageMode(CENTER);

    //CREATE PIXELATION EFFECT :) 
    for (int j = 0; j < numPixels; j++) {

      for (int i = 0; i < numPixels; i++) {

        //alpha();
        imageMode(CENTER);
        //tint(150, 5, 150, 200);
        //WILL START VIDEO ONCE HAND IS DETECTED AND xPosition changes
        fill(myMovieColors[j*numPixels + i], mouseX*i);
        rect(i*blockSize, j*blockSize, blockSize-1, blockSize-1);
      }
    }
  }


  // CHECK IF GAME IS ACTIVE
  if (gameActive) {

    if (scenarios[activeScenarioIndex] == "Box") {
      box.display();
    } else if (scenarios[activeScenarioIndex] == "RandomShapeGenerator") {
      randomShapeGenerator.display();
    } else if (scenarios[activeScenarioIndex] == "RandomShapeGeneratorTwo") {
      randomShapeGeneratorTwo.display();
    } else if (scenarios[activeScenarioIndex] == "HandAnimation") {
      handAnimation.display();
    } else if (scenarios[activeScenarioIndex] == "RandomObjects") {
      randomObjects.display();
    } else if (scenarios[activeScenarioIndex] == "RandomShapeDraw") {
      randomShapeDraw.display();
    } else if (scenarios[activeScenarioIndex] == "Bacteria") {
      Bacteria bc = new Bacteria(leap);
      bc.display();
    } else if (scenarios[activeScenarioIndex] == "scenarioEight") {
      //scenarioEight.display();
    } else if (scenarios[activeScenarioIndex] == "scenarioNine") {
      // scenarioNine.display();
    } else if (scenarios[activeScenarioIndex] == "scemarioTen") {
      //scenarioTen.display();
    }
  } else {

    // DISPLAY CALIBRATION
    calibration.display();
  }

  // CHECK FOR ELAPSED TIME
  checkTimer();
}
// ======================================================
void pickRandom() {

  println("Picking new scenario");

  // SAVE LAST INDEX
  int lastIndex = activeScenarioIndex;

  // LOOP UNTIL A UNIQUE INDEX PUT
  while (lastIndex == activeScenarioIndex) {

    // PICK A RANDOM INDEX OF THE SCENARIOS ARRAY
    activeScenarioIndex = int(random(scenarios.length));
  }

  // HERE WE LET EACH SCENARIO SET UP ITS OWN BACKGROUND ETC
  if (scenarios[activeScenarioIndex] == "Box") {
    box.setupScenario();
  } else if (scenarios[activeScenarioIndex] == "RandomShapeGenerator") {
    randomShapeGenerator.setupScenario();
  } else if (scenarios[activeScenarioIndex] == "RandomShapeGeneratorTwo") {
    randomShapeGeneratorTwo.setupScenario();
  } else if (scenarios[activeScenarioIndex] == "HandAnimation") {
    handAnimation.setupScenario();
  } else if (scenarios[activeScenarioIndex] == "RandomObjects") {
    randomObjects.setupScenario();
  } else if (scenarios[activeScenarioIndex] == "RandomShapeDraw") {
    randomShapeDraw.setupScenario();
  } else if (scenarios[activeScenarioIndex] == "scenarioSeven") {
    //scenarioSeven.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioEight") {
    //scenarioEight.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioNine") {
    // scenarioNine.display();
  } else if (scenarios[activeScenarioIndex] == "scemarioTen") {
    //scenarioTen.display();
  }
}

// ======================================================
void checkTimer() {

  // LOG 
  println("Seconds: "+getSeconds());
  println("Time Elapsed: "+(getSeconds() - timeStart));

  // CALC TIME PASSED
  timePassed = getSeconds() - timeStart;

  // CHECK TIME PASSED
  if (timePassed >= 20) {

    // RESET TIMER
    timeStart = getSeconds();
    timePassed = 0;

    // LOG
    println("Switch");

    if (gameActive) {
      // PLAY TRANSITION SOUND
      transitionSound.play();
      // PLAY TRANSITION VIDEO
      image(ampersandDatabend, width/2, height/2);
    }  

    // PICK RANDOM
    pickRandom();
  }
}

int getSeconds() {

  return millis()/1000;
}


// CALLED EVERY TIME  A NEW FRAME IS AVAILABLE TO READ
void movieEvent(Movie m) {
  m.read();
  m.loadPixels();

  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      myMovieColors[j*numPixels + i] = m.get(i, j);
    }
  }
}

// TIMOTHY THOMASSON FINAL PROJECT
// CART 353
// RILLA KHALED

// ======================================================

// IMPORT LEAP LIBRARY
import de.voidplus.leapmotion.*; 

// DECLARE LEAP MOTION OBJECT
LeapMotion leap;

// ======================================================

// ARRAY THAT HOLDS REFERENCE TO SCENARIO CLASSES
String[] scenarios;
int activeScenarioIndex;

// DECLARE SCENARIO CLASSES
Head head;
Animation animation;
ScenarioThree scenarioThree;

// ======================================================
// INITIALIZE ARTWORK
void setup() {

  // INIT LEAP OBJECT
  leap = new LeapMotion(this);

  // SET SIZE OF WINDOW 
  size(2000, 1000, P3D);

  // INIT SCENARIO CLASSES
  head = new Head();
  animation = new Animation();
  scenarioThree = new ScenarioThree();

  // INITIALZE SCENARIOS LIST
  scenarios = new String[3];

  // LOAD SCENARIO REFERENCES INTO ARRAY
  scenarios[0] = "Head";  
  scenarios[1] = "animation"; 
  scenarios[2] = "scenarioThree";

  // CHOOSE A RANDOM SCENARIO
  pickRandom();
}
// ======================================================  
void draw() {

  if (scenarios[activeScenarioIndex] == "Head") {
    head.display();
  } else if (scenarios[activeScenarioIndex] == "animation") {
    animation.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioThree") {
    scenarioThree.display();
  }

  // CHECK FOR ELAPSED TIME
  checkTimer();
}
// ======================================================
void pickRandom() {

  //
  // REMOVE EVENT LISTENERS FROM ACTIVE SCENARIO
  //

  if (scenarios[activeScenarioIndex] == "Head") {
    head.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "animation") {
    animation.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioThree") {
    scenarioThree.destroyEventListeners();
  }


  // PICK A RANDOM INDEX OF THE SCENARIOS ARRAY
  activeScenarioIndex = int(random(scenarios.length)); 


  // LOAD EVENT LISTENERS FOR NEW SCENARIO
  if (scenarios[activeScenarioIndex] == "Head") {
    head.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "animation") {
    animation.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioThree") {
    scenarioThree.loadEventListeners();
  }
}



void checkTimer() {

  //// GET HOW MANY SECONDS SINCE RUN TIME
  //int seconds = int(millis() / 1000);

  //if (seconds % 20 == 0) {
  //  pickRandom();
  //}

  //println(seconds);
}
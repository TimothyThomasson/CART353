
// TIMOTHY THOMASSON -- FINAL PROJECT
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
ScenarioFour scenarioFour;
ScenarioFive scenarioFive;
ScenarioSix scenarioSix;
ScenarioSeven scenarioSeven;
ScenarioEight scenarioEight;
ScenarioNine scenarioNine;
ScenarioTen scenarioTen;

// ======================================================
// INITIALIZE ARTWORK
void setup() {

  // INIT LEAP OBJECT
  leap = new LeapMotion(this);

  // SET SIZE OF WINDOW 
  fullScreen(P3D);

  // INIT SCENARIO CLASSES
  head = new Head();
  animation = new Animation();
  scenarioThree = new ScenarioThree();
  scenarioFour = new ScenarioFour();
  scenarioFive = new ScenarioFive();
  scenarioSix = new ScenarioSix();
  scenarioSeven = new ScenarioSeven();
  scenarioEight = new ScenarioEight();
  scenarioNine = new ScenarioNine();
  scenarioTen = new ScenarioTen();
  

  // INITIALZE SCENARIOS LIST
  scenarios = new String[10];

  // LOAD SCENARIO REFERENCES INTO ARRAY
  scenarios[0] = "Head";  
  scenarios[1] = "animation"; 
  scenarios[2] = "scenarioThree";
  scenarios[3] = "scenarioFour";
  scenarios[4] = "scenarioFive";
  scenarios[5] = "scenarioSix";
  scenarios[6] = "scenarioSeven";
  scenarios[7] = "scenarioEight";
  scenarios[8] = "scenarioNine";
  scenarios[9] = "scenarioTen";
  

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
  } else if (scenarios[activeScenarioIndex] == "scenarioFour") {
    scenarioFour.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioFive") {
    scenarioFive.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioSix") {
    scenarioSix.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioSeven"){
    scenarioSeven.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioEight"){
    scenarioEight.display(); 
  } else if (scenarios[activeScenarioIndex] == "scenarioNine") {
    scenarioNine.display(); 
  } else if (scenarios[activeScenarioIndex] == "scemarioTen"){
    scenarioTen.display();
  }
  
    
  // CHECK FOR ELAPSED TIME
  checkTimer();
}
// ======================================================
void pickRandom() {

  //
  // REMOVE EVENT LISTENERS FROM ACTIVE//PREVIOUS  SCENARIO
  //

  if (scenarios[activeScenarioIndex] == "Head") {
    head.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "animation") {
    animation.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioThree") {
    scenarioThree.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioFour") {
    scenarioFour.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioFive") {
    scenarioFive.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioSix") {
    scenarioSix.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioSeven") {
    scenarioSeven.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioEight") {
    scenarioEight.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioNine") {
    scenarioNine.destroyEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioTen") {
    scenarioTen.destroyEventListeners();
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
  } else if (scenarios[activeScenarioIndex] == "scenarioFour") {
    scenarioFour.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioFive") {
    scenarioFive.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioSix") {
    scenarioSix.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioSeven") {
    scenarioSeven.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioEight") {
    scenarioEight.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioNine") {
    scenarioNine.loadEventListeners();
  } else if (scenarios[activeScenarioIndex] == "scenarioTen") {
    scenarioTen.loadEventListeners();
  }
}



void checkTimer() {

  // GET HOW MANY SECONDS SINCE RUN TIME
  int seconds = int(millis() / 1000);

  if (seconds % 20 == 0) {
    pickRandom();
  }

  println(seconds);
}


void transition() {
}
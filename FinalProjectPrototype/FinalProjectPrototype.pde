
// ======================================================
// ARRAY THAT HOLDS REFERENCE TO SCENARIO CLASSES
String[] scenarios;
int activeScenarioIndex;

// DECLARE SCENARIO CLASSES
Head head;
ScenarioTwo scenarioTwo;
ScenarioThree scenarioThree;

// ======================================================
// INITIALIZE ARTWORK
void setup() {

  //  SET SIZE OF WINDOW 
  size(3000, 2000, P3D);
  
  //  INIT SCENARIO CLASSES
  head = new Head();
  scenarioTwo = new ScenarioTwo();
  scenarioThree = new ScenarioThree();
  

  //  INITIALZE SCENARIOS LIST
  scenarios = new String[3];

  //  LOAD SCENARIO REFERENCES INTO ARRAY
  scenarios[0] = "Head";  
  scenarios[1] = "scenarioTwo"; 
  scenarios[2] = "scenarioThree";
  
  //CHOOSE A RANDOM SCENARIO
  pickRandom();
}
// ======================================================  
void draw() {

  if (scenarios[activeScenarioIndex] == "Head") {
    head.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioTwo") {
    scenarioTwo.display();
  } else if (scenarios[activeScenarioIndex] == "scenarioThree") {
    scenarioThree.display();
  }
}
// ======================================================
void pickRandom() {

  //
  // REMOVE EVENT LISTENERS FROM ACTIVE SCENARIO
  //

  //  PICK A RANDOM INDEX OF THE SCENARIOS ARRAY
  activeScenarioIndex = int(random(scenarios.length)); 


  //LOAD EVENT LISTENERS FOR NEW SCENARIO
}
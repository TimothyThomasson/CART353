
  // ======================================================
  // ARRAY THAT HOLDS REFERENCE TO SCENARIO CLASSES
  String[] scenarios;
  int activeScenarioIndex;
  
  // DECLARE SCENARIO CLASSES
  Head head;
  //ScenarioOne scenarioOne;
  //ScenarioTwo ScenarioTwo;
  
  // ======================================================
  // INITIALIZE ARTWORK
  void setup() {
  
    //  SET SIZE OF WINDOW 
    size(3000, 2000, P3D);
  
    //  INITIALZE SCENARIO
    scenarios = new String[3];
  
    //  LOAD SCENARIO REFERENCES INTO ARRAY
    scenarios[0] = "Head";  
    scenarios[1] = "scenarioTwo"; 
    scenarios[2] = "scenarioThree";  
  }
  // ======================================================  
  void draw() {
    
    if (scenarios[activeScenarioIndex] == "Head"){
      
      head.display();
     
    }//else if(scenarios[activeScenarioIndex] == "scenarioTwo"
  }
  // ======================================================

  void pickRandom(){
   
   //  PICK A RANDOM INDEX OF THE SCENARIOS ARRAY :)
   activeScenarioIndex = int(random(scenarios.length)); 
    
  }

class ScenarioSix {

  PShape head;

  ScenarioSix() {

    head = loadShape("M1.obj");
    lights();
    head.scale(2500);
  }



  void display() {
    directionalLight(0, 255, 0, 0, -1, -10);
    background(255);
    pushMatrix();
    translate(0, 0, 100);
    //rotateZ(radians(60));
    rotateX(radians(frameCount));
    shape(head, width/2, height/2-1600);
    popMatrix();
  }




void loadEventListeners() {
}

void destroyEventListeners() {
}


}


int start;
PImage startBar;
PImage recycleBin;
PImage dontDelete;
PImage loseScreen; 
PImage mineSweeper;

Icon[] icons; 

void setup() {

  background(#008080);
  size(1025, 768);


  loadIcons();

  startBar = loadImage("startBar.png");
  recycleBin = loadImage("recycleBin.png");

  start = second();
}



void draw() {
  
    for (Icon icon : icons) {
    //perform movments
    icon.update();
    icon.display();
    icon.checkEdges();

  }


  background(#008080);
  image(startBar, 0, 740);
  image(recycleBin, width/2, height/2);


} 



void loadIcons() {

  icons = new Icon[5];
  icons[0] = new Icon(loadImage("dontDelete.png"), int(random(1025, 768)), int(random(1025, 768)));  
  icons[1] = new Icon(loadImage("icon1.png"), 500, 500);
  icons[2] = new Icon(loadImage("icon2.png"), 700, 500);
  icons[3] = new Icon(loadImage("icon3.png"), 300, 500);
  icons[4] = new Icon(loadImage("icon4.png"), 900, 500);
}


void mineSweeper() {
}
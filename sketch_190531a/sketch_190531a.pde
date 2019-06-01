import processing.sound.*;

SoundFile song;

class Building {
  float x;
  float width;
  float height;
  public Building(float _x, float _width, float _height) {
    x = _x;
    width = _width;
    height = _height;
  }
  
  public void draw() {
    stroke(0,0,0);
    fill(43, 63, 114);
    float y = 800 - height;
    rect(x, y, width, height);
  }
}

void setup() {
  size(1040, 800);
  //song = new SoundFile(this, "goodbye.mp3");
  //song.loop();
}      

void createBuildings(){
  Building b = new Building(30, 250, 500);
  Building c = new Building(150, 200, 430);
  b.draw();
  c.draw();
}

void draw() {
  // Set background color, noStroke and fill color
  background(227, 167, 232);

  createBuildings();
}

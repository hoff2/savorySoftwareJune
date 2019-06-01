import processing.sound.*;

SoundFile song;
Amplitude rms;

class Building {
  float x;
  float w;
  float h;
  public Building(float _x, float _w, float _h) {
    x = _x;
    w = _w;
    h = _h;
  }
  
  public void draw() {
    stroke(0,0,0);
    fill(43, 63, 114);
    float y = height - h;
    rect(x, y, w, h);
    
    float wcf = rms.analyze();
    fill(249 * wcf, 215 * wcf, 77 * wcf);
    
    rect(50, 500, 20, 30);
  }
}

void setup() {
  size(1040, 800);
  song = new SoundFile(this, "goodbye.mp3");
  song.loop();
  rms = new Amplitude(this);
  rms.input(song);
}      

void createBuildings(){
  Building b = new Building(30, 200, 400);
  Building c = new Building(150, 150, 330);
  b.draw();
  c.draw();
}

void draw() {
  // Set background color, noStroke and fill color
  background(227, 167, 232);

  createBuildings();
}

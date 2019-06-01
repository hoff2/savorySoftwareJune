import processing.sound.*;

SoundFile song;
Amplitude rms;

class Window {
  public float x;
  public float y;
  public Window(float _x, float _y) {
    x = _x;
    y = _y;
  }
}

class Building {
   float blockw = 30;
   float blockh = 50;
  
  float x;
  float y;
  float w;
  float h;
  
  ArrayList<Window> windows = new ArrayList<Window>();
  
  
  public Building(float _x, float _w, float _h) {
    x = _x;
    w = _w;
    h = _h;
    y = height - h * blockh;
  }
  
  public void addWindow(float x, float y) {
    windows.add(new Window(x, y));
  }
  
  public void drawWindow(Window w) {
    float wcf = rms.analyze();
    fill(249 * wcf, 215 * wcf, 77 * wcf);
    
    rect(
      x + blockw * w.x,
      y + blockh * w.y + 5,
      blockw,
      blockh - 10);
  }
  
  public void draw() {
    stroke(0,0,0);
    fill(43, 63, 114);
    rect(x, y, w * blockw, h * blockh);
    for (int i = 0; i < windows.size(); i++) {
      drawWindow(windows.get(i));
    }
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
  Building b = new Building(30, 7, 8);
  b.addWindow(1, 3);
  Building c = new Building(150, 5, 7);
  c.addWindow(1, 1);
  b.draw();
  c.draw();
}

void draw() {
  // Set background color, noStroke and fill color
  background(227, 167, 232);

  createBuildings();
}

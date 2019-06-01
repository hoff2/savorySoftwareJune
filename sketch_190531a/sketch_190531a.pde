import processing.sound.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

AudioPlayer song;
//Amplitude rms;

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
    float wcf = song.left.level() *  2;
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

ArrayList<Building> buildings;
BeatDetect beat;
int bandCount = 0;
Minim minim;
    int buildingsTimer = 0;

void setup() {
  minim = new Minim(this);
  size(1040, 800);
  song = minim.loadFile("goodbye.mp3", 2048);
  song.play();
  //rms = new Amplitude(this);
  //rms.input(song.mix);
  createBuildings();
  beat = new BeatDetect();
  beat.detectMode(BeatDetect.FREQ_ENERGY);
  beat.setSensitivity(500);
  bandCount = beat.detectSize();
   buildingsTimer = 0;

}      

void createBuildings(){
  buildings = new ArrayList<Building>();
  for(int i =0; i < 10; i++){
    int randomW = floor(abs(randomGaussian() * 5)) + 2;
    int randomH = floor(abs(randomGaussian() * 9)) + 3;
    float randomX = random(0, width + 50) - 50;
    Building b = new Building(randomX, randomW, randomH);
    int nw = floor(abs(randomGaussian() * 2)) + 1;
    for (int j = 0; j < nw; j++) {
    int wx = floor(random(1, randomW));
    int wy = floor(random(1, randomH));
    b.addWindow(wx, wy);
    }
    buildings.add(b);
  }
}

void draw() {
    beat.detect(song.mix);
    buildingsTimer++;
      if(buildingsTimer % 11 == 0){
        createBuildings();
        buildingsTimer = 0;
      }
    
    
  
  // Set background color, noStroke and fill color
  background(227, 167, 232);
  
  
    for (int i = 0; i < buildings.size(); i++) {
      buildings.get(i).draw();
    }
}

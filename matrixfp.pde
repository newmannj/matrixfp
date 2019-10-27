PFont codeFont, mainTextFont;
ArrayList<Stream> streams;
int FONT_SIZE = 20;
int MT_FONT_SIZE = 150;
MainText mt;
float timePast, timeInterval, timePast2;
boolean viewMobile = false;
import processing.video.*;
Movie myMovie;
boolean moviePlaying = false;
//seconds
float movieTimeInterval = 10000;
//
FloatList movieTimes = new FloatList();
int timeIndex = 0;


void settings() {
  
  if(viewMobile){
    size(750, 1334, P2D);
  } else {
    fullScreen();
    //size(1280, 960, P2D);
  }
}

void addMovieTimes() {
   movieTimes.append(10.0);
   movieTimes.append(40.2);
   movieTimes.append(156.2);
}
 
void setup() {
  addMovieTimes();
  codeFont = createFont("arial-unicode-ms.ttf", FONT_SIZE);
  mainTextFont = createFont("Antimatrix-BWBVw.ttf", MT_FONT_SIZE);
  textAlign(CENTER, TOP);
  myMovie = new Movie(this, "matrix_subway_fight.mp4");
  frameRate(30);
 
  streams = new ArrayList<Stream>();
  
  for(int x = FONT_SIZE/2; x < width; x+=FONT_SIZE) {
    streams.add(new Stream(x));
  }
  
  mt = new MainText();
  timePast = millis();
  timeInterval = 5000.0f;
  timePast2 = millis();
}

//Change fp text after timeInterval
void changePos() {
  if(millis() > timeInterval + timePast) {
    timePast = millis();
    mt.change();
  }
}

void movieEvent(Movie m) {
  m.read();
}

//If we want to trigger externally.
void handleKeyPressed(){
  if(keyPressed) {
    if(key == 'f') {
      mt.change(); 
    }
  }
}
int counter = 0;
void draw() {
  if(millis() > movieTimeInterval + timePast2) {
    if(moviePlaying){
      myMovie.stop();
      myMovie.volume(1);
    } else {
      myMovie.play();
      //change this number yooo
      myMovie.jump(movieTimes.get(timeIndex));
      timeIndex += 1;
      if(timeIndex == movieTimes.size()){
        timeIndex = 0;
      }
      myMovie.volume(0);
    }
    moviePlaying = !moviePlaying;
    timePast2 = millis();
  }
  if(!moviePlaying) {
    handleKeyPressed();
    changePos();
    background(0,0,0);
    textFont(mainTextFont);
    //mt.draw();mmm
    textFont(codeFont);
    for(Stream s:streams) {
      s.update(); 
    }
  } else {
    image(myMovie, 0, 0, 1920, 1080);
  }
      
  
}

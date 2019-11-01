PFont codeFont, mainTextFont;
ArrayList<Stream> streams;
int FONT_SIZE = 30;
int MT_FONT_SIZE = 150;
MainText mt;
float timePast, timeInterval, timePast2;
boolean showBigText = true;
import processing.video.*;
ArrayList<Movie> movies = new ArrayList<Movie>();
int currentMovie = 0;
Movie subwayScene1;
Movie subwayScene2;
boolean moviePlaying = false;
//seconds
float movieTimeInterval = 10000;
//
String[] movieTitles = new String[20];
int totalScenes = 0;
boolean kartMoviePlaying = false;
Movie kartMovie;

void settings() {
  fullScreen();
  //size(1280, 960, P2D);
}

void addMovieTitles() {
   movieTitles[0]="subway_scene1.mp4";
   movieTitles[1]="subway_scene2.mp4";
   movieTitles[2]="subway_scene3.mp4";
   movieTitles[3]="subway_scene4.mp4";
   movieTitles[4]="matrix_dodge1.mp4";
   movieTitles[5]="matrix_jump2.mp4";
   movieTitles[6]="matrix_jump1.mp4";
}
 
void setup() {
  addMovieTitles();
  codeFont = createFont("arial-unicode-ms.ttf", FONT_SIZE);
  mainTextFont = createFont("Antimatrix-BWBVw.ttf", MT_FONT_SIZE);
  textAlign(CENTER, TOP);
  totalScenes += 7;
  for(int i = 0; i < totalScenes;i ++) {
    movies.add(new Movie(this, movieTitles[i]));
  }
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
    if(key == 'm') {
      if(moviePlaying) {
        movies.get(currentMovie).stop();
        timePast2 = millis();
        currentMovie += 1;
        if(currentMovie == totalScenes) {
          currentMovie = 0;
        }
      }
      kartMovie = new Movie(this, "mario_kart1.mp4");
      kartMoviePlaying = true;
      kartMovie.play();
    }
  }
}
int counter = 0;
void draw() {
  if(kartMoviePlaying) {
    timePast2 = millis();
  }
  if(millis() > movieTimeInterval + timePast2) {
    if(moviePlaying){
      moviePlaying = false;
      movies.get(currentMovie).stop();
      timePast2 = millis();
      currentMovie += 1;
      if(currentMovie == totalScenes) {
        currentMovie = 0;
      }
    } else {
      movies.get(currentMovie).play();
      timePast2 = millis();
      moviePlaying = true;
      println("playing movie");
    }
  }
  if(!moviePlaying) {
    handleKeyPressed();
    changePos();
    background(0,0,0);
    textFont(mainTextFont);
    if(showBigText) {
      mt.draw();
    }
    textFont(codeFont);
    for(Stream s:streams) {
      s.update(); 
    }
    
    
    if(kartMoviePlaying) {
      if(kartMovie.time() == kartMovie.duration()) {
        kartMoviePlaying = false;
      }
      image(kartMovie, 0, 0, 1920, 1080);
      println("playing kart");
    }
  } else {
      image(movies.get(currentMovie), 0, 0, 1920, 1080); 
  }
  
}

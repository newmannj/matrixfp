PFont codeFont, fpFont;
ArrayList<Stream> streams;
int FONT_SIZE = 20;
int MT_FONT_SIZE = 150;
MainText mt;
float timePast, timeInterval;

 
void setup() {
  //size(1280, 720, P2D);
  fullScreen();
  codeFont = createFont("arial-unicode-ms.ttf", FONT_SIZE);
  fpFont = createFont("Antimatrix-BWBVw.ttf", MT_FONT_SIZE);
  
  textAlign(CENTER, TOP);
 
  streams = new ArrayList<Stream>();
  
  for(int x = FONT_SIZE/2; x < width; x+=FONT_SIZE) {
    streams.add(new Stream(x));
  }
  
  mt = new MainText();
  timePast = millis();
  timeInterval = 5000.0f;
}

//Change fp text after timeInterval
void changePos() {
  if(millis() > timeInterval + timePast) {
    timePast = millis();
    mt.change();
  }
}

//If we want to trigger externally.
void handleKeyPressed(){
  if(keyPressed) {
    if(key == 'f') {
      mt.change();
    }
  }
}

void draw() {
  handleKeyPressed();
  changePos();
  background(0);
  textFont(fpFont);
  mt.draw();
  textFont(codeFont);
  for(Stream s:streams) {
    s.update(); 
  }
}

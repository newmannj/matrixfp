PFont theFont;
ArrayList<Stream> streams;
int FONT_SIZE = 20;
int MT_FONT_SIZE = 100;
MainText mt;

 
void setup() {
  //size(1280, 720, P2D);
  fullScreen();
  theFont = createFont("arial-unicode-ms.ttf", FONT_SIZE);
  textFont(theFont);
  textAlign(CENTER, TOP);
 
  streams = new ArrayList<Stream>();
  
  for(int x = FONT_SIZE/2; x < width; x+=FONT_SIZE) {
    streams.add(new Stream(x));
  }
  
  mt = new MainText();
}

void draw() {
  background(0);
  mt.draw();
  for(Stream s:streams) {
    s.update(); 
  }
}

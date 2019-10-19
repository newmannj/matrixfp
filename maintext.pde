class MainText{
  String text = "FALSEPOCKET";
  ArrayList<Pos> randPositions;
  ArrayList<Pos> positions;
  int textAlpha = 100;
  int textFade = 2;
  int xpos, ypos;
  int shiftAmount = 15;
  boolean centered = true;
  MainText() {
    //generate list of random coordinates
    randPositions = new ArrayList<Pos>();
    for(int i = 0; i < text.length(); i++) {
        int randx = round(random(1) * width/2);
        int randy = round(random(1) * height/2);
        Pos pToAdd = new Pos(randx, randy);
        randPositions.add(pToAdd);
    }
    //generate pre-determined list of random coordinates
    positions = new ArrayList<Pos>();
    for(int i = 1; i < 6; i++) {
      int newX = i * width/6;
      Pos newPos = new Pos(newX, height/4);
      positions.add(newPos);
    }
    for(int i = 1; i < 8; i++) {
      int newX = i * width/7;
      Pos newPos = new Pos(newX, (height/4 * 3));
      positions.add(newPos);
    }
  }
  
  
  void show() {
    if (centered) {
      text(text, xpos, ypos);
    } else {
      for(int i = 0; i < text.length(); i++) {
        Pos curPos = positions.get(i);
        text(text.charAt(i), curPos.x, curPos.y);
      }
    }
    
  }
  
  void doGlitch() {
    float rand = random(1);
    if (rand < 0.08) {
      if (rand <= 0.02) {
      ypos = ypos - shiftAmount;
      } else if (rand > 0.02 && rand <= 0.04) {
        ypos = ypos + shiftAmount;
      } else if (rand > 0.04 && rand <= 0.06) {
        xpos = xpos + shiftAmount;
      } else {
        xpos = xpos - shiftAmount; 
      }
    } else {
      xpos = width/2;
      ypos = height/2;
    }
  }
  
  void changeAlpha(){ 
    textAlpha = round(random(1) * 600.0f);
  }
  
  //Make some wild stuff happen
  void doBigGlitch() {
    
    float rand = random(1);
    
  }
  
  //Moves text from center to expanded after certain amountof time.
  void changeCentered() {
    if(random(1) < 0.01) {
      this.centered = !this.centered;
    }
  }
  
  void change() {
    this.centered = !this.centered;
  }
  
  
  void draw() {
    changeAlpha();
    if(centered){
      doGlitch();
    } else {
      doGlitch();
    }
    fill(255, 255, 255, textAlpha);
    this.show();
  }
}

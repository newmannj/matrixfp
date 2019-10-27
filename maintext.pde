class MainText{
  String text = "FALSEPOCKET";
  String scrambled = "LSPECFOTEKF";
  ArrayList<Pos> positions;
  ArrayList<Pos> normalPositions;
  int textAlpha = 100;
  int textFade = 2;
  Pos centerPos;
  boolean centered = true;
  boolean scramble = true;
  MainText() {
    //init center pos
    centerPos = new Pos(width/2, height/2);
    //generate pre-determined list of random coordinates
    positions = new ArrayList<Pos>();
    normalPositions = new ArrayList<Pos>();
    for(int i = 1; i < 6; i++) {
      int newX = i * width/6;
      int newY = height/2 - MT_FONT_SIZE;
      Pos newPos = new Pos(newX, newY);
      positions.add(newPos);
    }
    for(int i = 1; i < 8; i++) {
      int newX = i * width/7;
      int newY = height/2 + MT_FONT_SIZE;
      Pos newPos = new Pos(newX, newY);
      positions.add(newPos);
    }
    for(Pos p: positions) {
      Pos pNew = new Pos(p);
      normalPositions.add(pNew);
    }
  }
  
  void printNormal() {
    print("Normal[");
    for(Pos p: normalPositions) {
      print("(" + p.x + ", " + p.y + ")");
    }
    print("]\n");
  }
  
  void printPosns() {
    print("Posns:[");
    for(Pos p: positions) {
      print("(" + p.x + ", " + p.y + ")");
    }
    print("]\n");
  }
  
  void show() {
    if (centered) {
      text(text, centerPos.x, centerPos.y);
    } else {
      for(int i = 0; i < text.length(); i++) {
        Pos curPos = positions.get(i);
        if(scramble) {
          text(text.charAt(i), curPos.x, curPos.y);
        } else {
          text(text.charAt(i), curPos.x, curPos.y);
        }  
      }
    }
    
  }
  
  //This does a glitch for either main text or separate regions.
  void doGlitch(int shiftAmount) {
    if(centered) {
      centerPos = doGlitch(centerPos, shiftAmount);
    } else {
        for(int i = 0; i < positions.size(); i++) {
            Pos copyP = new Pos(normalPositions.get(i));
            positions.set(i, doGlitch(copyP, 40));
        }
    }
  }
  
  Pos doGlitch(Pos p, int shiftAmount) {
    float rand = random(1);
    if (rand < 0.08) {
      if (rand <= 0.02) {
      p.y = p.y - shiftAmount;
      } else if (rand > 0.02 && rand <= 0.04) {
        p.y = p.y + shiftAmount;
      } else if (rand > 0.04 && rand <= 0.06) {
        p.x = p.x + shiftAmount;
      } else {
        p.x = p.x - shiftAmount; 
      }
    } else {
      //Handle center position here.
      centerPos.y = height/2;
      centerPos.x = width/2;
    }
    return p;
  }
  
  //Randomly change alpha value for jitter effect.
  void changeAlpha(){ 
    textAlpha = round(random(1) * 600.0f);
  }
  
  //Change the way that "False Pocket" is presented. 
  void change() {
    this.centered = !this.centered;
  }
  
  
  void draw() {
    noCursor();
    changeAlpha();
    doGlitch(15);
    if(centered) {
      textSize(MT_FONT_SIZE);
    } else {
      textSize(MT_FONT_SIZE * 1.5);
    }
    fill(255, 255, 255, textAlpha);
    this.show();
  }
}

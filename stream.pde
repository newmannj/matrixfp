class Stream{
  ArrayList<Char> chars;
  int numChar, speed, fpIndex;
  boolean doRandom = true;
  boolean isFalseP = true;
  String fp = "FALSEPOCKET";
  boolean doFP = false;
  
 Stream(int tempX){
   
   chars = new ArrayList<Char>(); 
   numChar= round(random(10,50));
   
   speed = round(random(10,80));
   for(int y = 0; y < numChar*20; y+=20){
    chars.add(new Char(tempX, y));
     
   }
 }
 
 void update() {
   textSize(FONT_SIZE);
   if(isFalseP) {
     //See if a false pocket string should be triggered.
     if(random(1) < 0.001) {
       doFP = true;
     }
   }
   for(int i = 0; i < chars.size(); i++){
      float alpha = map(i,0,chars.size()-1,50,255);
     
      fill(0,250,80,alpha);
      if(i==chars.size()-1) fill(250,255,250);
        
      chars.get(i).show();
      
      if(frameCount % speed == 0){
        chars.get(i).ypos += 20;
         
        if (i==chars.size()-1) {
          if (isFalseP) {
            if(doFP) {
              chars.get(i).theChar = fp.charAt(fpIndex);
              this.fpIndex += 1;
              if(this.fpIndex == 11) {
                this.fpIndex = 0;
                doFP = false;
              }
            } else {
              chars.get(i).getRandomChar();
            }
          } else {
            chars.get(i).getRandomChar();
          }
        } else {
          chars.get(i).theChar = chars.get(i + 1).theChar;  
        }
      }
      
      if (doRandom) {
        if (random(1) < 0.001) {
          chars.get(i).getRandomChar();
        }
      }
   }
   
   //Checks if stream is over the level
   if (chars.get(0).ypos > height){
     for(int i = 0; i < chars.size(); i++){
      chars.get(i).ypos=((chars.size()-1)-i)*-20;
     }
    }
  }
}

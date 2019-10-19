class Char{
char theChar;
int xpos, ypos;

Char(int x, int y) {
  this.xpos = x;
  this.ypos = y;
  
  getRandomChar();
}

Char(int x, int y, char c) {
  this.xpos = x;
  this.ypos = y;
  this.theChar = c;
}

void show() {
  text(theChar, xpos, ypos);

}

void getRandomChar() {  
   int charType = round(random(1));
   if (charType == 0) {
       int rndChar = round(random(48, 90));
       theChar = char(rndChar);
   } else if (charType == 1) {
          int rndChar = round(random(12449, 12615 ));
       theChar = char(rndChar);
   }
}

}

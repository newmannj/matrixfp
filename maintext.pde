class MainText{
  String text = "FALSE POCKET";
  
  MainText() {
    
  }
  
  void show() {
    text(text, width/2, height/2);
  }
  
  void draw() {
    textSize(MT_FONT_SIZE);
    this.show();
  }
}

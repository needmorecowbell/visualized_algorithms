
class Column 
{
  int xpos; // rect xposition
  int ypos ; // rect yposition
  int w; // rect bar width
  int h; // rect height
  color c = color(random(1,255), random(1,255), random(1,255));
  String label;
  boolean showLabel;
 
  Column(int ixp, int iyp, int iw, int ih) {
    xpos=ixp;
    ypos=iyp;
    w=iw;
    h=ih;
    label=""+h;
    showLabel=true;
  }

  Column(int ixp, int iyp, int iw, int ih, color c) {
    xpos=ixp;
    ypos=iyp;
    w=iw;
    h=ih;
    this.c=c;
    label=""+h;
    showLabel=true;
  }
 
 
  public void move (int x, int y) {
    this.xpos=x;
    this.ypos=y;
  }

  public void swap(Column col){
    this.xpos= col.getXPos();
    this.ypos= col.getYPos();
    this.label=""+col.getHeight();
    this.h = col.getHeight();
    this.w= col.getWidth();
  }
  public int getXPos(){
    return this.xpos;
  }
  public int getWidth(){
    return this.w;
  }
  public int getYPos(){
    return this.ypos;
  }

  public color getColor(){
    return this.c;
  }
  public void setXPos(int x){
    this.xpos=x;
  }
  
  public void setYPos(int y){
    this.ypos=y;
  }
  public int getHeight(){
    return this.h;
  }
  public void setHeight(int h){
    this.h=h;
  }

  public void setShowLabel(boolean b){
    this.showLabel=b;
  }

  public void toggleShowLabel(){
    this.showLabel=!this.showLabel;
  }

  public void setColor(color c){
    this.c = c;
  }

  public void setLabel(String s){
    this.label = s;
  }
 
  public void display() {
      fill(c);
      rect(xpos, ypos, w, h);
      if(this.showLabel){
        fill(0);
        text(this.label,xpos,ypos-5);
      }
   }

}
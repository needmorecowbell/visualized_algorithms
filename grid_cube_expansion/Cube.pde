
class Cube
{
  int xpos; // cell xposition
  int ypos ; // cell yposition
  int zpos; // cell zposition
  int s; // cell size

  color c = color(random(0,255), random(0,255), random(0,255));
  String label;
  
  boolean showLabel,isTransparent,isWireframed;
 

  
  Cube(int ixp, int iyp, int izp, int is) {
    xpos=ixp;
    ypos=iyp;
    zpos=izp;
    s= is;
    label="";
    showLabel=true;
    isTransparent=false;
    isWireframed=true;
  }
 
  public void move (int x, int y, int z) {
    this.xpos=x;
    this.ypos=y;
    this.zpos=z;
  }

  public int getXPos(){
    return this.xpos;
  }
  public PVector getPos(){
    return new PVector(this.xpos, this.ypos, this.zpos);
  }
  
  public int getSize(){
    return this.s;
  }

  public int getYPos(){
    return this.ypos;
  }

  public void setZPos(int z){
    this.zpos=z;
  }
  public void setPos(PVector p){
    this.xpos= int(p.x);
    this.ypos=int(p.y);
    this.zpos=int(p.z);
  }
  public int getZPos(){
    return this.zpos;
  }

  public color getColor(){
    return this.c;
  }

  public void setTransparency(boolean t){
    this.isTransparent=  t;
  }
  public void setXPos(int x){
    this.xpos=x;
  }
  
  public void setYPos(int y){
    this.ypos=y;
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

  public boolean isTransparent(){
    return this.isTransparent;
  }

  public boolean isWireframed(){
    return this.isWireframed;
  }

  public void setWireframed(boolean w){
    this.isWireframed=w;
  }
 
  public void display() {
    if(isTransparent){
      noFill();
    }else{
      fill(c);
    }
    
    if(!isWireframed){
      noStroke();
    }

    translate(xpos,ypos,zpos);
    box(s);
  }

}
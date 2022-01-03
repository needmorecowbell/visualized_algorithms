
class CubeGridMap
{
 
  int xpos,ypos,zpos;

  int numRows;
  int numCols;
  int numDepth;
  int padding;
  int cubeSize;
  ArrayList<ArrayList<ArrayList<Cube>>> map = new ArrayList<ArrayList<ArrayList<Cube>>>();

  CubeGridMap(int xpos, int ypos, int x, int y, int z, int size) {
    this.xpos=xpos;
    this.ypos=ypos;
    this.zpos=0;
    this.padding=40;
    numRows = x;
    numCols=y;
    numDepth=z;
    cubeSize=size;
    initCells();
  }
 
  public void setPadding(int p){
    int oldPad=this.padding;
    this.padding=p;

    // for (ArrayList<ArrayList<Cube>> page : map) {
    //   for (ArrayList<Cube> row: page){
    //     for(Cube c : row){
    //       PVector pos = c.getPos();
    //       pos.sub(oldPad,oldPad,oldPad);
    //       pos.add(0,this.padding,this.padding);
    //       c.setPos(pos);
    //     }
    //   }   
    // }


  }
  void initCells(){
    int x=this.xpos;
    int y=this.ypos;
    int z=this.zpos;

    for(int d= 0; d< numDepth;d++){
      ArrayList<ArrayList<Cube>> cubePage = new ArrayList<ArrayList<Cube>>();
      x=this.xpos;
      y=this.ypos; 

      for(int rowID = 0; rowID < numRows; rowID++){
        ArrayList<Cube> cubeRow= new ArrayList<Cube>();
        x=this.xpos;
          for(int colID= 0; colID < numCols; colID++){
            cubeRow.add(new Cube(x,y,z, cubeSize));
            x+=(cube_size+padding);
          }
        y+=(cube_size+padding);
        cubePage.add(cubeRow);
      }
      z+=(cube_size+padding);
      this.map.add(cubePage);

    }
  }

  public void display() {
    for (ArrayList<ArrayList<Cube>> page : map) {
      for (ArrayList<Cube> row: page){
        for(Cube c : row){
          pushMatrix();
          c.display();
          popMatrix();
        }
      }   
    }
  }

  public void setTransparency(boolean t) {
    for (ArrayList<ArrayList<Cube>> page : map) {
      for (ArrayList<Cube> row: page){
        for(Cube c : row){
          c.setTransparency(t);
        }
      }   
    }
  }

  public PVector getIndices(Cube c){

    for (int z = 0; z < map.size(); z++) {

      ArrayList<ArrayList<Cube>> page = map.get(z);

      for (int x = 0; x < page.size(); x++) {
          ArrayList<Cube> row = page.get(x); 

          for (int y = 0; y < row.size(); y++) {
            Cube cc = row.get(y);

            if(cc == c){
              return new PVector(x,y,z);
            }
          }
      }
    }
    return new  PVector(-1,-1,-1);

  }


  public void setWireframed(boolean w) {
    for (ArrayList<ArrayList<Cube>> page : map) {
      for (ArrayList<Cube> row: page){
        for(Cube c : row){
          c.setWireframed(w);
        }
      }   
    }
  }
}
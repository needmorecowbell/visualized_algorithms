import peasy.*;

PeasyCam cam;
int numCols,numRows,numDepth, cube_size;
CubeGridMap map;
Cube c,c2,c3;
int cx,cy,cz;
int cellsize;
int counter;
ArrayList<Cube>knownCubes;


void setup() {
  numCols=11;
  numRows=11;
  numDepth=5;
  cube_size= 30;

  size(940, 900, P3D);

  int cx=width/2;
  int cy= height/2;
  int cz=300;
  knownCubes= new ArrayList<Cube>();
  counter=0;

  map = new CubeGridMap(width/2, height/2, numRows, numCols, numDepth, cube_size);
  map.setTransparency(true);
  //map.setWireframed(false);
  map.setPadding(40);

  frameRate(40);
  

  cam = new PeasyCam(this, width/2, height/2, 0, 500);
  cam.setSuppressRollRotationMode();  // Permit pitch/yaw only.

  PVector p= map.map.get( int(numDepth/2) )
                    .get( int(numRows/2) )
                    .get( int(numCols/2) ).getPos();
  
  cam.lookAt(p.x,p.y,p.z+500);
}

void draw() {

  
  background(100);
  lights();

  expandFromCenter();
  map.display();


}

void expandFromCenter(){

  Cube target= new Cube(0,0,0,0);
  if(counter==0){
    target= map.map.get( int(numDepth/2) )
                .get( int(numRows/2) )
                .get( int(numCols/2) );
    knownCubes.add(target);
  }else{
    if(counter <= knownCubes.size()-1){
      target = knownCubes.get(counter);
    }
  }



  if(counter <= knownCubes.size()-1){

    ArrayList<Cube> neighbors = find_neighbors(target);
    for (Cube n : neighbors){
      if(!knownCubes.contains(n)){
        knownCubes.add(n);
      }
    }
    knownCubes.get(counter).setTransparency(false);
  }

  counter+=1;
           

}

void keyPressed(){


      
}

ArrayList<Cube> find_neighbors(Cube c){
  ArrayList<Cube> neighbors = new ArrayList<Cube>();
  
  PVector ci; // indices of target cube
  ci= map.getIndices(c);

  if(int(ci.x+1) < numRows){
    neighbors.add(map.map.get(int(ci.z)).get(int(ci.x+1)).get(int(ci.y)));
  }
  if(int(ci.x-1) >= 0){
    neighbors.add(map.map.get(int(ci.z)).get(int(ci.x-1)).get(int(ci.y)));
  }

  if(int(ci.y+1) < numCols){
    neighbors.add(map.map.get(int(ci.z)).get(int(ci.x)).get(int(ci.y+1)));
  }
  if(int(ci.y-1) >=0){
    neighbors.add(map.map.get(int(ci.z)).get(int(ci.x)).get(int(ci.y-1)));
  }

  if(int(ci.z+1) < numDepth){
    neighbors.add(map.map.get(int(ci.z+1)).get(int(ci.x)).get(int(ci.y)));
  }
  if(int(ci.z-1) >=0){
    neighbors.add(map.map.get(int(ci.z-1)).get(int(ci.x)).get(int(ci.y)));
  }
  //println("Center location: "+str(ci.x)+","+str(ci.y)+","+str(ci.z));
  return neighbors;
}
void displayOriginTracer(){
  int x,y,z;
  x=cx;
  y=cy;
  z=cz;
  translate(cx,cy,cz);
  fill(255);
  box(cellsize);
  x+=cellsize;
  

  pushMatrix();
  fill(color(255,0,0));
  for (int i = 0; i < 50; ++i) {
    translate(cellsize,0,0);
    box(cellsize);
  }
  popMatrix();
 
  pushMatrix();
   fill(color(0,255,0));
   for (int i = 0; i < 50; ++i) {
      translate(0,cellsize,0);
      box(cellsize);
  }
  popMatrix();

  pushMatrix();
  fill(color(0,0,255));
  for (int i = 0; i < 50; ++i) {
    translate(0,0,cellsize);
    box(cellsize);
  }
  popMatrix();
}
static int closestNumber(int n, int m){
  // find the quotient
  int q = n / m;
    
  // 1st possible closest number
  int n1 = m * q;
    
  // 2nd possible closest number
  int n2 = (n * m) > 0 ? (m * (q + 1)) : (m * (q - 1));
    
  // if true, then n1 is the required closest number
  if (Math.abs(n - n1) < Math.abs(n - n2))
    return n1;
    
  // else n2 is the required closest number   
  return n2;   
}


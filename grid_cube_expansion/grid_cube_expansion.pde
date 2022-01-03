import peasy.*;

PeasyCam cam;
int numCols,numRows,numDepth;
int cube_size, counter;
CubeGridMap map;
ArrayList<Cube>knownCubes;


void setup() {
  numCols=9;
  numRows=9;
  numDepth=9;
  cube_size= 30;

  size(900, 900, P3D);

  knownCubes= new ArrayList<Cube>();
  counter=0;

  map = new CubeGridMap(width/2, height/2, numRows, numCols, numDepth, cube_size, 10);
  map.setTransparency(true);
  map.setWireframed(false);

  frameRate(40);

  cam = new PeasyCam(this, width/2, height/2, 0, 1000);
  cam.setSuppressRollRotationMode();

  PVector p= map.map.get( int(numDepth/2) )
                    .get( int(numRows/2) )
                    .get( int(numCols/2) ).getPos(); // look at center of cube
  
  cam.lookAt(p.x,p.y,p.z+500);
}

void draw() {
  background(100);
  lights();
  crawl();
  map.display();
}

void crawl(){

  Cube target= new Cube(0,0,0,0);
  if(counter==0){
    target= map.map.get(int(random(0,numDepth))).get(int(random(0,numRows))).get(int(random(0,numCols)));
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


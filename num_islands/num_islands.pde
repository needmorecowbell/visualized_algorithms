// Num Islands Problem


GridMap map;
int numRows, numCols;
int cell_width, cell_height;
int x,y;

int[][] testmap= {
  {0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,1,0,0,1,1,1},
  {1,1,0,1,1,1,0,0,0,1},
  {1,1,0,0,0,0,0,0,0,1},
  {0,0,0,0,0,0,0,0,1,1},
  {0,0,0,0,0,0,0,1,1,0},
  {1,1,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,1,0},
  {0,0,0,0,0,0,0,1,1,1},
  {1,1,0,0,0,0,0,0,0,1}
};

int expected= 6;
int islandCount=0;
ArrayList<PVector> known_island_tiles = new ArrayList<PVector>();

void settings(){
  numRows=testmap.length;
  numCols=testmap[0].length;

  //numRows=100;
  //numCols=100;
  size(closestNumber(900,numCols),closestNumber(900,numCols));
}

void setup() {
  frameRate(10);
  map = new GridMap(testmap);
  //map= new GridMap(numRows,numCols);

  background(255);
  x=0;
  y=0;
}

void draw() {
  if( x < map.getSize().x){
    if(y < map.getSize().y ) {

      PVector loc = new PVector(x,y);
      Cell cell = map.getCell(new PVector(x,y));
      
      if (isLand(loc)){
        if(! known_island_tiles.contains(loc)){
          known_island_tiles.add(loc);
          islandCount+=1;
          map.getMap().get(x).get(y).setLabel(""+islandCount);
          delay(150);
          crawl(loc);
        }
        
      }else{
        map.getMap().get(x).get(y).setLabel("W");
      }
      
    
      y+=1;
    }else{
      y=0;
      x+=1;
    }
  }
  
  map.display();

}


void crawl(PVector loc){
  if (loc.x +1 < map.getSize().x){
    PVector nextLoc= new PVector(loc.x+1, loc.y);
    
    if(isLand(nextLoc) && !known_island_tiles.contains(nextLoc)){
      known_island_tiles.add(nextLoc);
      map.setCellLabel(nextLoc,""+islandCount);
      delay(150);

      crawl(nextLoc);
    }
    
  }

  if(loc.x-1 >=0){
    PVector nextLoc= new PVector(loc.x-1, loc.y);
    
    if(isLand(nextLoc) && !known_island_tiles.contains(nextLoc)){
      known_island_tiles.add(nextLoc);
      map.setCellLabel(nextLoc,""+islandCount);
      delay(150);

      crawl(nextLoc);
    }
  }

  if(loc.y+1 < map.getSize().y ){
    PVector nextLoc= new PVector(loc.x, loc.y+1);
    if(isLand(nextLoc) && !known_island_tiles.contains(nextLoc)){
      known_island_tiles.add(nextLoc);
      map.setCellLabel(nextLoc,""+islandCount);
      delay(150);

      crawl(nextLoc);
    }
  }

  if(loc.y-1 >= 0){
    PVector nextLoc= new PVector(loc.x, loc.y-1);
    if(isLand(nextLoc) && !known_island_tiles.contains(nextLoc)){
      known_island_tiles.add(nextLoc);
      map.setCellLabel(nextLoc,""+islandCount);
      delay(150);

      crawl(nextLoc);
    }
  }

}

boolean isLand(PVector loc){
  return map.getCell(loc).getColor() == color(0,255,0);
}
void mouseClicked(){
  map.toggle_labels();
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


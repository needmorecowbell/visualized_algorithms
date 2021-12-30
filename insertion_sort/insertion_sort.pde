// Insertion Sort Animation

ArrayList<Column> cols;
int numCols;
int col_width;
int count;


void settings(){
  numCols=50;
  size(closestNumber(900,numCols),closestNumber(800,numCols));
  col_width= width / numCols;
}


void setup() {
  frameRate(4);
  background(255);
  // Setup the arraylist and add one branch to it
  cols = new ArrayList<Column>();
  int xpos=0;
  int col_height;
  for (int i = 0; i < numCols; i++) {
    //randomize height, since it is what we sort on
    col_height=int(random(1, height-200));
    cols.add(new Column(xpos,height-col_height,col_width, col_height));
    xpos= xpos+col_width;
  }

  count=0;
}

void draw() {
   
  if(count < numCols){
    int current = count;
    // cols.get(count).setColor(color(255,0,0));

    while (current > 0 && cols.get(current).getHeight() < cols.get(current - 1).getHeight()) {
      //swap coordinate positions
      int tempX = cols.get(current).getXPos();

      cols.get(current).setXPos(cols.get(current-1).getXPos());
      cols.get(current-1).setXPos(tempX);

      //swap arraylist positions
      Column temp= cols.get(current);
      cols.set(current, cols.get(current - 1));
      cols.set(current - 1, temp);
      displayColumns();
      current--;
    
    }
    count+=1;
  }
}

Column copy_col_by_index(int i){
  Column temp = cols.get(i);
  
  return new Column(temp.getXPos(),temp.getYPos(), temp.getWidth(), temp.getHeight(), temp.getColor());
}

void displayColumns(){
  background(255);
  fill(255,0,0);
  text("Count: "+str(count+1)+"  Num Cols: "+str(numCols),40,40);
  String label = getColVals();
  text(label,40,55,width-400,40);

  for (Column col : cols) {
    col.display(); 
  }
}

String getColVals(){
  String res="[";

  for (Column col:cols){
    res+=""+col.getHeight()+", ";
  }
  return res.substring(0,res.length()-2)+"]";
}

void mouseClicked(){
  for (Column col: cols){
    col.toggleShowLabel();
  }
  displayColumns();
}

static int closestNumber(int n, int m)
{
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


// Selection Sort Animation

ArrayList<Column> cols;
int numCols;
int col_width;
int index;
void settings(){
  numCols=40;
  size(closestNumber(900,numCols),closestNumber(800,numCols));
  col_width= width / numCols;

}

void setup() {
  frameRate(4);

  cols = new ArrayList<Column>();
  background(255);
  init_columns();

  index=0;
}

void init_columns(){
  int xpos=0;
  int col_height;

  for (int i = 0; i < numCols; i++) {
    //randomize height, since it is what we sort on
    col_height=int(random(1, height-200));
    cols.add(new Column(xpos,height-col_height,col_width, col_height));
    xpos= xpos+col_width;
  }
}

void draw() {
   
  if(index < numCols){
    int minIndex = index;
   // cols.get(index).setColor(color(255,0,0));

    for (int ci = index; ci < numCols; ci++) {
      if(cols.get(ci).getHeight() < cols.get(minIndex).getHeight()){
        minIndex= ci;
      }
    }
    //swap coordinate positions
    int tempX = cols.get(index).getXPos();

    cols.get(index).setXPos(cols.get(minIndex).getXPos());
    cols.get(minIndex).setXPos(tempX);

    //swap arraylist positions
    Column temp= cols.get(index);
    cols.set(index, cols.get(minIndex));
    cols.set(minIndex, temp);
    displayColumns();

    index+=1;

  }
}


Column copy_col_by_index(int i){
  Column temp = cols.get(i);
  
  return new Column(temp.getXPos(),temp.getYPos(), temp.getWidth(), temp.getHeight(), temp.getColor());
}

void displayColumns(){
  background(255);
  fill(255,0,0);
  text("Count: "+str(index+1)+"  Num Cols: "+str(numCols),40,40);
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


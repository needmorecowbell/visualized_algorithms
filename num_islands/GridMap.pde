class GridMap{
    int numRows,numCols;
    int cell_width,cell_height;
    ArrayList<ArrayList<Cell>> map ;

    GridMap(int numRows, int numCols){
        this.numRows= numRows;
        this.numCols=numCols;
        this.cell_width= int(width/numRows);
        this.cell_height= int(height/numRows);
        this.map = new ArrayList<ArrayList<Cell>>();
        initCells();
    }

    GridMap(int[][] intmap){
        this.numCols= intmap[0].length;
        this.numRows= intmap.length;
        this.cell_width= int(width/numRows);
        this.cell_height= int(height/numCols);
        this.map = new ArrayList<ArrayList<Cell>>();
        initCells();
        apply_intmap(intmap);

    }

    void initCells(){
        int ypos=0;

        for (int rowID = 0; rowID < numRows; rowID++) {
            ArrayList<Cell> cellRow= new ArrayList<Cell>();
            int xpos=0;
            for(int colID = 0; colID<numCols; colID++){
                cellRow.add(new Cell(xpos,ypos,cell_width,cell_height));
                xpos+=cell_width;
            }
            
            ypos+=cell_height;

            this.map.add(cellRow);
        }
    }

    void apply_intmap(int[][] intmap){
        for (int x = 0; x < map.size(); x++) {
            for (int y = 0; y < map.get(x).size();y++){
                if(intmap[x][y] == 1){
                    this.map.get(x).get(y).setColor(color(0,255,0));
                }else if(intmap[x][y] ==0){
                    this.map.get(x).get(y).setColor(color(0,0,255));
                }
            }
        }
    }

    void toggle_labels(){
      for (int x = 0; x < map.size(); x++) {
        for (int y = 0; y < map.get(x).size();y++){
              this.map.get(x).get(y).toggleShowLabel();
        }
      }
    
    }

    ArrayList<ArrayList<Cell>> getMap(){
        return this.map;
    }

    void setCellLabel(PVector loc, String label){
        this.map.get(int(loc.x)).get(int(loc.y)).setLabel(label);
    }
    PVector getSize(){
        return new PVector(this.numRows, this.numCols);
    }

    Cell getCell(PVector loc){
        return this.map.get(int(loc.x)).get(int(loc.y));
    }

    void display(){
        for (ArrayList<Cell> row : map) {
            for(Cell cell : row){
                cell.display();
            }
        }
            
    }

}
/*
Author: Kuba Gasiorowski
https://github.com/kgasiorowski/digital-rain
*/ 

final int DEFAULT_LIFETIME = 200;
final int DEFAULT_CASCADETIME = 1;

class CellMatrix{

    Cell[][] matrix;
    
    ArrayList<Coordinate> activeCells;
    ArrayList<Coordinate> cellsToRemoveFromActiveList;
    ArrayList<Coordinate> cellsToAddToActiveList;
    
    public CellMatrix(int x, int y){
        activeCells = new ArrayList();
        cellsToRemoveFromActiveList = new ArrayList();
        cellsToAddToActiveList = new ArrayList();
        
        matrix = new Cell[x][y];
        
        for(int i = 0; i < x; i++)
            for(int j = 0; j < y; j++)
                matrix[i][j] = new Cell();
    }
    
    void startRow(){
      
        ArrayList<Integer> emptyRows = new ArrayList();
        for(int i = 0; i < numCols; i++){
            if(!matrix[i][0].active)
              emptyRows.add(i);
        }
      
        if(emptyRows.size() == 0)
            return;
      
        int r = emptyRows.get(int(random(0, emptyRows.size())));
        
        matrix[r][0].active = true;
        matrix[r][0].lifetime = DEFAULT_LIFETIME;
        matrix[r][0].cascadetime = int(random(1,3));
        matrix[r][0].c = alphabet.getRandChar();
        
        activeCells.add(new Coordinate(r,0));
    }
    
    void step(){
        for(Coordinate coord : activeCells){
            Cell cell = matrix[coord.x][coord.y];
            
            // Delete the cell if the lifetime is up
            if(cell.lifetime <= 0){
                cell.active = false;
                cellsToRemoveFromActiveList.add(coord);
                continue;
            }
        
            if(cell.cascadetime <= 0){
                if(coord.y + 1 < matrix[0].length && !matrix[coord.x][coord.y+1].active){
                    Cell cellBelow = matrix[coord.x][coord.y+1];
                    if(!cellBelow.active){
                        cellsToAddToActiveList.add(new Coordinate(coord.x, coord.y+1));
                        cellBelow.active = true;
                        cellBelow.lifetime = DEFAULT_LIFETIME;
                        cellBelow.cascadetime = int(random(1,3));
                        cellBelow.c = alphabet.getRandChar();
                    }
                }
            }
        
            if(random(1) < 0.005){
                cell.c = alphabet.getRandChar();
            }
        
            /*
            Color the cell here.
            */
            if(cell.lifetime >= DEFAULT_LIFETIME - DEFAULT_CASCADETIME)
                cell.col = color(255);
            else
                cell.col = color(red(CURRENT_COLOR), green(CURRENT_COLOR), blue(CURRENT_COLOR), map(cell.lifetime, 0, DEFAULT_LIFETIME, 0, 255));
            
            cell.lifetime--;
            cell.cascadetime--;
        }
    
        for(Coordinate coord : cellsToRemoveFromActiveList){
            activeCells.remove(coord);
        }
        for(Coordinate coord : cellsToAddToActiveList){
            activeCells.add(coord);
        }
    
        cellsToRemoveFromActiveList.clear();
        cellsToAddToActiveList.clear();
    }

    void draw(){
        for(Coordinate coord : activeCells){
            Cell cell = matrix[coord.x][coord.y];
            putc(cell.c, coord.x, coord.y, cell.col);
        }
    }
}

class Coordinate{
    public Integer x;
    public Integer y;
    
    public Coordinate(Integer x, Integer y){
        this.x = x;
        this.y = y;
    }
}

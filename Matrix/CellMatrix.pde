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
            if(!matrix[i][0].isActive())
              emptyRows.add(i);
        }
      
        if(emptyRows.size() == 0)
            return;
      
        int r = emptyRows.get(int(random(0, emptyRows.size())));
        
        matrix[r][0].setIsActive(true);
        matrix[r][0].setLifeTime(DEFAULT_LIFETIME);
        matrix[r][0].setCascadeTime(int(random(1,3)));
        matrix[r][0].setCellCharacter(alphabet.getRandChar());
        
        activeCells.add(new Coordinate(r,0));
    }
    
    void step(){
        for(Coordinate coord : activeCells){
            Cell cell = matrix[coord.x][coord.y];
            
            // Delete the cell if the lifetime is up
            if(cell.getLifeTime() <= 0){
                cell.setIsActive(false);
                cellsToRemoveFromActiveList.add(coord);
                continue;
            }
        
            if(cell.getCascadeTime() <= 0){
                if(coord.y + 1 < matrix[0].length && !matrix[coord.x][coord.y+1].isActive()){
                    Cell cellBelow = matrix[coord.x][coord.y+1];
                    if(!cellBelow.isActive()){
                        cellsToAddToActiveList.add(new Coordinate(coord.x, coord.y+1));
                        cellBelow.setIsActive(true);
                        cellBelow.setLifeTime(DEFAULT_LIFETIME);
                        cellBelow.setCascadeTime(int(random(1,3)));
                        cellBelow.setCellCharacter(alphabet.getRandChar());
                    }
                }
            }
        
            if(random(1) < 0.005){
                cell.setCellCharacter(alphabet.getRandChar());
            }
        
            /*
            Color the cell here.
            */
            if(cell.getLifeTime() >= DEFAULT_LIFETIME - DEFAULT_CASCADETIME)
                cell.setCellColor(color(255));
            else
                cell.setCellColor(color(red(CURRENT_COLOR), green(CURRENT_COLOR), blue(CURRENT_COLOR), map(cell.getLifeTime(), 0, DEFAULT_LIFETIME, 0, 255)));
            
            cell.decrementLifeTime();
            cell.decrementCascadeTime();
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
            putc(cell.getCellCharacter(), coord.x, coord.y, cell.getCellColor());
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

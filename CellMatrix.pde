final int DEFAULT_LIFETIME = 250;
final int DEFAULT_CASCADETIME = 3;

class CellMatrix{

    Cell[][] matrix;
    
    ArrayList<Tuple<Integer>> activeCells;
    ArrayList<Tuple<Integer>> cellsToRemoveFromActiveList;
    ArrayList<Tuple<Integer>> cellsToAddToActiveList;
    
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
    
        int r;
        
        do{
            
            r = int(random(0, numCols));
        
        }while(matrix[r][0].active);
        
        matrix[r][0].active = true;
        matrix[r][0].lifetime = DEFAULT_LIFETIME;
        matrix[r][0].cascadetime = DEFAULT_CASCADETIME;
        matrix[r][0].c = alphabet.getRandChar();
        
        activeCells.add(new Tuple(r,0)); 
    
    }
    
    void step(){
        
        for(Tuple<Integer> t : activeCells){
        
            Cell cell = matrix[t.first][t.second];
        
            // Delete the cell if the lifetime is up
            if(cell.lifetime <= 0){
                
                cell.active = false;
                cellsToRemoveFromActiveList.add(t);
                continue;
            
            }
        
            if(cell.cascadetime <= 0){
                
                if(t.second + 1 < matrix[0].length && !matrix[t.first][t.second+1].active){
                
                    Cell cellBelow = matrix[t.first][t.second+1];
                    
                    if(!cellBelow.active){
                    
                        cellsToAddToActiveList.add(new Tuple(t.first, t.second+1));
                        cellBelow.active = true;
                    
                        cellBelow.lifetime = DEFAULT_LIFETIME;
                        cellBelow.cascadetime = DEFAULT_CASCADETIME;
                        cellBelow.c = alphabet.getRandChar();
                    
                    }
                    
                    //cellBelow.lifetime = DEFAULT_LIFETIME;
                    //cellBelow.cascadetime = DEFAULT_CASCADETIME;
                    //cellBelow.c = alphabet.getRandChar();

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
    
        for(Tuple<Integer> t : cellsToRemoveFromActiveList){
        
            activeCells.remove(t);
        
        }
    
        for(Tuple<Integer> t : cellsToAddToActiveList){
        
            activeCells.add(t);
        
        }
    
        cellsToRemoveFromActiveList.clear();
        cellsToAddToActiveList.clear();
    
    }

    void draw(){
    
        for(Tuple<Integer> t : activeCells){
        
            Cell cell = matrix[t.first][t.second];
            putc(cell.c, t.first, t.second, cell.col);
        
        }
    
    }

}

class Tuple<T>{

    public T first;
    public T second;
    
    public Tuple(T first, T second){
    
        this.first = first;
        this.second = second;
    
    }  

}

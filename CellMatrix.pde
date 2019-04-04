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
    
        matrix[0][0].lifetime = 100;
        matrix[0][0].cascadetime = 50;
        matrix[0][0].c = alphabet.get(int(random(0, alphabet.size())));
        
        activeCells.add(new Tuple(0,0));
    
    }
    
    void step(){
    
        println(activeCells.size());
        
        for(Tuple<Integer> t : activeCells){
        
            Cell cell = matrix[t.first][t.second];
        
            // Delete the cell if the lifetime is up
            if(cell.lifetime <= 0){
                
                cellsToRemoveFromActiveList.add(t);
            
            }
        
            if(cell.cascadetime <= 0){
            
                cellsToAddToActiveList.add(new Tuple(t.first, t.second+1));
                matrix[t.first][t.second+1].lifetime = 300;
                matrix[t.first][t.second+1].cascadetime = 50;
                matrix[t.first][t.second+1].c = alphabet.get(int(random(0, alphabet.size())));
            
            }
        
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
            putc(cell.c, t.first, t.second, color(255));
        
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

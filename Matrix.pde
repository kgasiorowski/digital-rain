int cellSide = 12;
int numCols, numRows, cellWidth, cellHeight;

Alphabet alphabet;
CellMatrix matrix;

void setup(){
    
    fullScreen();
    textSize(cellSide);
    stroke(255);
    background(0);
    frameRate(60);

    cellWidth = cellHeight = cellSide;

    numCols = width / cellWidth;
    numRows = height / cellHeight;

    alphabet = new Alphabet();

    matrix = new CellMatrix(numCols, numRows);
    matrix.startRow(0);

}

void draw(){

    background(0);
    
    matrix.step();
    matrix.draw();
    
    if(random(1) < 0.30){
    
        matrix.startRow(int(random(0, numCols)));
    
    }
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+1)*cellHeight);
    
}

int cellSide;
int numCols, numRows, cellWidth, cellHeight;

final Alphabet alphabet = new Alphabet();
CellMatrix matrix;

final color GREEN = color(13,222,0);
final color RED = color(198,0,0);
final color BLUE = color(23, 45, 214);
final color YELLOW = color(198, 175, 0);
final color PURPLE = color(120, 26, 216);

color CURRENT_COLOR = GREEN;

void keyPressed(){
    
    switch(key){
    
        case '1':
            CURRENT_COLOR = GREEN;
        break;
        case '2':
            CURRENT_COLOR = BLUE;
        break;
        case '3':
            CURRENT_COLOR = RED;
        break;
        case '4':
            CURRENT_COLOR = YELLOW;
        break;
        case '5':
            CURRENT_COLOR = PURPLE;
        break;
        
    }

}

void setup(){
    
    cellSide = displayWidth/125;
    
    fullScreen();
    textSize(cellSide);
    frameRate(60);
    textAlign(CENTER, CENTER);

    cellWidth = cellHeight = cellSide;

    numCols = width / cellWidth;
    numRows = height / cellHeight;

    matrix = new CellMatrix(numCols, numRows);

}

void draw(){
    
    background(0);
    
    matrix.step();
    matrix.draw();
    
    if(random(1) < 0.30){
    
        matrix.startRow();
    
    }
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+1)*cellHeight);
    
}

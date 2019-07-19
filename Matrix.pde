int cellSide = 20;
int numCols, numRows, cellWidth, cellHeight;

Alphabet alphabet;
CellMatrix matrix;

final color GREEN = color(13,222,0);
final color RED = color(198,0,0);
final color BLUE = color(23, 45, 214);
final color YELLOW = color(198, 175, 0);
final color PURPLE = color(120, 26, 216);

color CURRENT_COLOR = GREEN;

void keyPressed(){

    switch(key){
    
        default:
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

}

void draw(){
    
    println(frameRate);
    
    background(0);
    
    matrix.step();
    matrix.draw();
    
    if(random(1) < 0.40){
    
        matrix.startRow();
    
    }
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+1)*cellHeight);
    
}

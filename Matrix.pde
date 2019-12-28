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

void mouseClicked(){

    exit();

}

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
    
    cellSide = displayWidth/175;
    
    fullScreen();
    textSize(cellSide);
    frameRate(30);
    stroke(255);
    background(0);
    textAlign(CENTER, CENTER);

    cellWidth = cellHeight = cellSide;

    numCols = width / cellWidth;
    numRows = height / cellHeight;

    matrix = new CellMatrix(numCols, numRows);
    rotate(radians(90));

}

void draw(){
    
    background(0);
    
    matrix.step();
    matrix.draw();
    
    if(random(1) < 0.30)
        matrix.startRow();
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+1)*cellHeight);
    
}

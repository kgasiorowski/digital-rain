int cellSide;
int numCols, numRows, cellWidth, cellHeight;

int frame_buffer_count = 1000;
int numFrames = 0;
int num_frames_to_save = 1200;
int savedFrames = 0;

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
    
        //default:
        //break;
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
    stroke(255);
    background(0);
    frameRate(30);
    textAlign(CENTER, CENTER);

    cellWidth = cellHeight = cellSide;

    numCols = width / cellWidth;
    numRows = height / cellHeight;

    alphabet = new Alphabet();

    matrix = new CellMatrix(numCols, numRows);
    rotate(radians(90));

}

void draw(){
    
    background(0);
    
    matrix.step();
    matrix.draw();
    
    if(random(1) < 0.30)
        matrix.startRow();
    
    numFrames++;
    
    if(numFrames >= frame_buffer_count){
    
        saveFrame("img/####.png");
        savedFrames++;
    
        if(savedFrames > num_frames_to_save)
            exit();
    
    }
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+1)*cellHeight);
    
}

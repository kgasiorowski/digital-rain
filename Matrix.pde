/*
Author: Kuba Gasiorowski
https://github.com/kgasiorowski/digital-rain
*/

int cellSide;
int numCols, numRows, cellWidth, cellHeight;

final Alphabet alphabet = new Alphabet();
CellMatrix matrix;

final color GREEN = color(13,222,0);
final color RED = color(198,0,0);
final color BLUE = color(23, 45, 214);
final color YELLOW = color(198, 175, 0);
final color PURPLE = color(120, 26, 216);
final color BRIGHT_BLUE = #4771B4;

color CURRENT_COLOR = GREEN;
int CURRENT_COLOR_INDEX = 0;

final color[] colors = {GREEN, RED, BLUE, YELLOW, PURPLE, BRIGHT_BLUE};

boolean RAINBOW_MODE = false;
boolean PAUSE_RAINBOW = false;
final int DEFAULT_RAINBOW_PERIOD = 500;
int framecounter = 0;

void keyPressed(){
    
    if(key == CODED){
    
        switch(keyCode){
        
            case LEFT:
                CURRENT_COLOR_INDEX--;
                if(CURRENT_COLOR_INDEX < 0){
                
                    CURRENT_COLOR_INDEX = colors.length-1;
                
                }
            break;    
            case RIGHT:
                CURRENT_COLOR_INDEX++;
                if(CURRENT_COLOR_INDEX > colors.length-1){
                    
                    CURRENT_COLOR_INDEX = 0;
                    
                }
            break;
            case UP:
                if(RAINBOW_MODE){
                
                    framecounter = int(map(framecounter, 0, frames, 0, frames+10)); // Allows for smooth transitions
                    frames += 10;
                    println(frames);
                
                }
            break;
            case DOWN:
                if(RAINBOW_MODE){
                
                    if(frames <= 10)
                        break;
                    framecounter = int(map(framecounter, 0, frames, 0, frames-10)); // Allows for smooth transitions
                    frames -= 10;
                    println(frames);
                
                }
            break;
            case SHIFT:
                if(RAINBOW_MODE){
                
                    framecounter = int(map(framecounter, 0, frames, 0, DEFAULT_RAINBOW_PERIOD)); // Allows for smooth transitions
                    frames = DEFAULT_RAINBOW_PERIOD;
                    println(frames);
                
                }
            break;
            
        }
    
    }else{
    
        int key_int = (int)key;
        
        if(key_int >= 49 && key_int <= 54){
        
            CURRENT_COLOR_INDEX = key_int - 49;
        
        }else if(key == 'r'){
        
            RAINBOW_MODE = !RAINBOW_MODE;
            framecounter = 0;
        
        }else if(key == ' '){
        
            if(RAINBOW_MODE){
            
                PAUSE_RAINBOW = !PAUSE_RAINBOW;
                
            }
        
        }
    
    }

    
    CURRENT_COLOR = colors[CURRENT_COLOR_INDEX];

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

}

void draw(){
    
    background(0);
    
    if(RAINBOW_MODE){
    
        if(!PAUSE_RAINBOW)
            framecounter++;
            CURRENT_COLOR = get_rainbow_color(framecounter);

        if(framecounter > frames)
            framecounter = 0;
    
    }
    
    matrix.step();
    matrix.draw();
    
    if(random(1) < 0.30)
        matrix.startRow();
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+.5)*cellHeight);
    
}

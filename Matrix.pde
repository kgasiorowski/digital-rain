int _width = 600;
int _height = 600;

int cellWidth = 30;
int cellHeight = 30;

int numCols = _width / cellWidth;
int numRows = _height / cellHeight;

int[] charRanges = {33,33, 35,38, 48,57, 63,90, 97,122};
ArrayList<Character> alphabet;

CellMatrix matrix;

void setup(){

    size(600, 600);
    textSize(32);
    stroke(255);
    background(0);
    rectMode(CORNERS);
    frameRate(20);

    alphabet = buildAlphabet(charRanges);
    matrix = new CellMatrix(numCols, numRows);

}

void draw(){

    background(0);
    matrix.step();
    matrix.draw();
    
}

void putc(char c, int x, int y, color col){

    stroke(col);
    fill(col);
    text(c, x*cellWidth, (y+1)*cellHeight);
    
}

ArrayList<Character> buildAlphabet(int[] charRanges){

    ArrayList<Character> alphabet = new ArrayList<Character>();
    
    for(int i = 0; i < charRanges.length; i += 2){
    
        for(int j = charRanges[i]; j <= charRanges[i+1]; j++){
        
            alphabet.add((char)j);
        
        }
    
    }
    
    return alphabet;

}

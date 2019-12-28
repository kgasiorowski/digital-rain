/*
Author: Kuba Gasiorowski
https://github.com/kgasiorowski/digital-rain
*/ 

// Rainbow code will probably go here
/*  R   G   B
1.  255 000 000 (red) <--
2.  255 128 000 (orange) |
3.  255 255 000 (yellow) <--
4.  128 255 000 (yellow-green) | 
5.  000 255 000 (green) <--
6.  000 255 128 (blue-green) |
7.  000 255 255 (teal) <--
8.  000 128 255 (blue) |
9.  000 000 255 (indigo) <--
10. 128 000 255 (purple) |
11. 255 000 255 (magenta) <--
12. 255 000 128 (pink) |
13. 255 000 000 (red) <--
*/

int frames = 500;

color get_rainbow_color(int offset){

    int red = 0, green = 0, blue = 0;
    
    if(offset <= frames/6){
    
        red = 255;
        green = int(map(offset, 0, frames/6, 0, 255));
        blue = 0;
    
    }else if(offset > frames/6 && offset <= frames/6*2){
    
        red = int(map(offset, frames/6, frames/6*2, 255, 0));
        green = 255;
        blue = 0;
    
    }else if(offset > frames/6*2 && offset <= frames/6*3){
    
        red = 0;
        green = 255;
        blue = int(map(offset, frames/6*2, frames/6*3, 0, 255));
    
    }else if(offset > frames/6*3 && offset <= frames/6*4){
    
        red = 0;
        green = int(map(offset, frames/6*3, frames/6*4, 255, 0));
        blue = 255;
    
    }else if(offset > frames/6*4 && offset <= frames/6*5){
    
        red = int(map(offset, frames/6*4, frames/6*5, 0, 255));
        green = 0;
        blue = 255;
    
    }else if(offset > frames/6*5 && offset <= frames/6*6){
    
        red = 255;
        green = 0;
        blue = int(map(offset, frames/6*5, frames/6*6, 255, 0));
    
    }else{
        
        // The ifelse block above is missing one value, so it flashes black when it should loop around
        return #FF0000;
    
    }
    
    return color(red, green, blue);

}

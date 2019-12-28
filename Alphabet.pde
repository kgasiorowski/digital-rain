/*
Author: Kuba Gasiorowski
https://github.com/kgasiorowski/digital-rain
*/

class Alphabet extends ArrayList<Character>{
    
    public Alphabet(){
    
        int[] charRanges = {33,33, 35,38, 48,57, 63,90, 97,122};
        
        for(int i = 0; i < charRanges.length; i += 2){
    
            for(int j = charRanges[i]; j <= charRanges[i+1]; j++){
            
                this.add((char)j);
            
            }
        
        }
        
    }

    public char getRandChar(){
        
        return get(int(random(0, alphabet.size())));
    
    }

}

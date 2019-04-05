class Alphabet{

    ArrayList<Character> alphabet;
    
    public Alphabet(){
    
        int[] charRanges = {33,33, 35,38, 48,57, 63,90, 97,122};
        alphabet = new ArrayList<Character>();
        
        for(int i = 0; i < charRanges.length; i += 2){
    
            for(int j = charRanges[i]; j <= charRanges[i+1]; j++){
            
                alphabet.add((char)j);
            
            }
        
        }
        
    }

    public char getRandChar(){
        
        return alphabet.get(int(random(0, alphabet.size())));
    
    }

}

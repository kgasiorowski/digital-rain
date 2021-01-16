/*
Author: Kuba Gasiorowski
https://github.com/kgasiorowski/digital-rain
*/

class Alphabet{
    
    private String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*";

    public char getRandChar(){
        return this.alphabet.charAt(int(random(0, this.alphabet.length())));
    }

}

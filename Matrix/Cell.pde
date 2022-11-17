/*
Author: Kuba Gasiorowski
https://github.com/kgasiorowski/digital-rain
*/

class Cell{
    private boolean isActive;
    private int lifeTime;
    private int maxCascadeTime;
    private int cascadeTime;
    private char cellCharacter; 
    private color cellColor;
    
    public void setIsActive(boolean isActive){
        this.isActive = isActive;
    }
    
    public boolean isActive(){
        return isActive;
    }
    
    public void setLifeTime(int lifetime){
        this.lifeTime = lifetime;
    }
    
    public int getLifeTime(){
        return lifeTime;
    }
    
    public void setMaxCascadeTime(int maxCascadeTime){
        this.maxCascadeTime = maxCascadeTime;
    }
    
    public int getMaxCascadeTime(){
        return this.maxCascadeTime;
    }
    
    public void setCascadeTime(int cascadetime){
        this.cascadeTime = cascadetime;
    }
    
    public int getCascadeTime(){
        return cascadeTime;
    }
    
    public void setCellCharacter(char cellCharacter){
        this.cellCharacter = cellCharacter;
    }
    
    public char getCellCharacter(){
        return cellCharacter;
    }
    
    public void setCellColor(color cellColor){
        this.cellColor = cellColor;
    }
    
    public color getCellColor(){
        return cellColor;
    }
    
    public void decrementLifeTime(){
        this.lifeTime--;
    }
    
    public void decrementCascadeTime(){
        this.cascadeTime--;
    }
    
}

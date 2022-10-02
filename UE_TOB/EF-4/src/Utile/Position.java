package Utile;
public class Position {

    // attributs
    private int x;
    private int y;

    // constructeur
    public Position(int nx, int ny) {
        this.x = nx;
        this.y = ny;
    }

    // methodes
    public int getX() {
        return this.x;
    }
    public int getY() {
        return this.y;
    }
    public void setX(int nx) {
        this.x = nx;
    }
    public void setY(int ny) {
        this.y = ny;
    }

    public double distance(Position autre) {
        return Math.sqrt((this.x - autre.getX())
            * (this.x - autre.getX())
            + (this.y - autre.getY())
            * (this.y - autre.getY()));
    }
    @Override
    public String toString(){
        return "(" + this.x + ", " + this.y + ")";
    }

}

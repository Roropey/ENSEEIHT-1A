package Affichage;

import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Set;

public class MapObervable extends Observable{
    private Map<String, Integer> mapNbreEspece;

    public MapObervable() {
        this.mapNbreEspece = new HashMap<String,Integer>();

    }
    public int size(){
        return this.mapNbreEspece.size();
    }
    public void put(String str, int integer){

        this.mapNbreEspece.put(str, integer);

        
    }
    public void reload(){
        setChanged();
        notifyObservers(mapNbreEspece);     
    }
    public Set<String> keySet(){
        return mapNbreEspece.keySet();
    }
    public Map<String, Integer> getMap(){
        return this.mapNbreEspece;
    }
    public void clear(){
        this.mapNbreEspece.clear();
    }
}

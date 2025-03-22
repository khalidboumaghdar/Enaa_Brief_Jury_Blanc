package ConstructionXpert.Model;

public class ResourceTache {
    private int id;
    private int quantity;
    Ressource ressource;
    Taches taches;

    public ResourceTache(int id, int quantity, Ressource ressource, Taches taches) {
        this.id = id;
        this.quantity = quantity;
        this.ressource = ressource;
        this.taches = taches;
    }

    public ResourceTache(int quantity, Ressource ressource, Taches taches) {
        this.quantity = quantity;
        this.ressource = ressource;
        this.taches = taches;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Ressource getRessource() {
        return ressource;
    }

    public void setRessource(Ressource ressource) {
        this.ressource = ressource;
    }

    public Taches getTaches() {
        return taches;
    }

    public void setTaches(Taches taches) {
        this.taches = taches;
    }

    @Override
    public String toString() {
        return "ResourceTache{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", ressource=" + ressource +
                ", taches=" + taches +
                '}';
    }
}

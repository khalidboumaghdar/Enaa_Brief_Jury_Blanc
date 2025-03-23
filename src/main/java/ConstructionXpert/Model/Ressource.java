package ConstructionXpert.Model;

public class Ressource {
    private int id;
    private String nom;
    private String type;
    private int quantity;
    private String forniseur;

    public Ressource(int id, String nom, String type, int quantity, String forniseur) {
        this.id = id;
        this.nom = nom;
        this.type = type;
        this.quantity = quantity;
        this.forniseur = forniseur;
    }

    public Ressource(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public Ressource(String nom, String type, int quantity, String forniseur) {
        this.nom = nom;
        this.type = type;
        this.quantity = quantity;
        this.forniseur = forniseur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getForniseur() {
        return forniseur;
    }

    public void setForniseur(String forniseur) {
        this.forniseur = forniseur;
    }

    @Override
    public String toString() {
        return "Ressource{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", type='" + type + '\'' +
                ", quantity=" + quantity +
                ", forniseur='" + forniseur + '\'' +
                '}';
    }
}

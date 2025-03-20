package ConstructionXpert.Model;

import java.sql.Date;

public class Project {
private int id;
private String nom;
private String description;
private Date date_de_debut;
private Date date_de_fin;
private Float budget;

    public Project(int id, String nom, String description, Date date_de_debut, Date date_de_fin, Float budget) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.date_de_debut = date_de_debut;
        this.date_de_fin = date_de_fin;
        this.budget = budget;
    }

    public Project(String nom, String description, Date date_de_debut, Date date_de_fin, Float budget) {
        this.nom = nom;
        this.description = description;
        this.date_de_debut = date_de_debut;
        this.date_de_fin = date_de_fin;
        this.budget = budget;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate_de_debut() {
        return date_de_debut;
    }

    public void setDate_de_debut(Date date_de_debut) {
        this.date_de_debut = date_de_debut;
    }

    public Date getDate_de_fin() {
        return date_de_fin;
    }

    public void setDate_de_fin(Date date_de_fin) {
        this.date_de_fin = date_de_fin;
    }

    public Float getBudget() {
        return budget;
    }

    public void setBudget(Float budget) {
        this.budget = budget;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", description='" + description + '\'' +
                ", date_de_debut=" + date_de_debut +
                ", date_de_fin=" + date_de_fin +
                ", budget=" + budget +
                '}';
    }
}

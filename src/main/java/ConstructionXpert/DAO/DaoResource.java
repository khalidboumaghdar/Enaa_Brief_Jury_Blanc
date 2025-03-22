package ConstructionXpert.DAO;

import ConstructionXpert.DB_Connection.DbConnection;
import ConstructionXpert.Model.Ressource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoResource {
    private Connection connection;

    public DaoResource() {
        connection = DbConnection.getConnection();
    }

    public void addResource(Ressource resource) throws SQLException {
        String sql = "INSERT INTO ressources (nom, type, quantite, fournisseur) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, resource.getNom());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getForniseur());
            stmt.executeUpdate();
        }
    }

    public List<Ressource> getAllResources() throws SQLException {
        List<Ressource> resources = new ArrayList<>();
        String sql = "SELECT * FROM ressources";

        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Ressource resource = new Ressource(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("type"),
                        rs.getInt("quantite"),
                        rs.getString("fournisseur")
                );
                resources.add(resource);
            }
        }
        return resources;
    }

    public Ressource getResourceById(int id) throws SQLException {
        String sql = "SELECT * FROM ressources WHERE id = ?";
        Ressource resource = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                resource = new Ressource(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("type"),
                        rs.getInt("quantite"),
                        rs.getString("fournisseur")
                );
            }
        }
        return resource;
    }

    public void updateResource(Ressource resource) throws SQLException {
        String sql = "UPDATE ressources SET nom = ?, type = ?, quantite = ?, fournisseur = ? WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, resource.getNom());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getForniseur());
            stmt.setInt(5, resource.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteResource(int id) throws SQLException {
        String sql = "DELETE FROM ressources WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}

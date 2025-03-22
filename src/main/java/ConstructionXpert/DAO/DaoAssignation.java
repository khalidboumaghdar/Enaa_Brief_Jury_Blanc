package ConstructionXpert.DAO;

import ConstructionXpert.DB_Connection.DbConnection;
import ConstructionXpert.Model.ResourceTache;
import ConstructionXpert.Model.Ressource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoAssignation {
    private Connection connection;

    public DaoAssignation() {
        connection = DbConnection.getConnection();
    }
    public void AddResourceTache(ResourceTache resourceTache) throws SQLException {
        String insertSql = "INSERT INTO tache_ressources(tache_id, ressource_id, quantite_utilisee) VALUES (?, ?, ?)";
        String updateSql = "UPDATE ressources r " +
                "SET r.quantite = r.quantite - ? " +
                "WHERE r.id = ?";
        String deleteSql = "DELETE FROM ressources WHERE id = ? AND quantite <= 0";

        try (PreparedStatement insertStmt = connection.prepareStatement(insertSql);
             PreparedStatement updateStmt = connection.prepareStatement(updateSql);
             PreparedStatement deleteStmt = connection.prepareStatement(deleteSql)) {

            int tacheId = resourceTache.getTaches().getId();
            int ressourceId = resourceTache.getRessource().getId();
            int quantiteUtilisee = resourceTache.getQuantity();

            insertStmt.setInt(1, tacheId);
            insertStmt.setInt(2, ressourceId);
            insertStmt.setInt(3, quantiteUtilisee);
            insertStmt.executeUpdate();

            updateStmt.setInt(1, quantiteUtilisee);
            updateStmt.setInt(2, ressourceId);
            updateStmt.executeUpdate();

            deleteStmt.setInt(1, ressourceId);
            deleteStmt.executeUpdate();

        } catch (SQLException e) {
            throw e;
        }
    }




}

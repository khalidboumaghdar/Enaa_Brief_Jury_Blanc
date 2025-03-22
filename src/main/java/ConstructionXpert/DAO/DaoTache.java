package ConstructionXpert.DAO;

import ConstructionXpert.DB_Connection.DbConnection;
import ConstructionXpert.Model.Project;
import ConstructionXpert.Model.Ressource;
import ConstructionXpert.Model.Taches;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoTache {

    private Connection connection;
    public Dao dao = new Dao();

    public DaoTache() {
        connection = DbConnection.getConnection();
    }

    public void InsertTache(Taches tache) throws SQLException {
        String query = "INSERT INTO Taches (projet_id, description, date_debut, date_fin) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, tache.getProject().getId());
            stmt.setString(2, tache.getDescription());
            stmt.setDate(3, tache.getDateDebut());
            stmt.setDate(4, tache.getDateFin());
            stmt.executeUpdate();
        }
    }

    public List<Taches> SelectAllTaches() throws SQLException {
        List<Taches> taches = new ArrayList<>();
        String query = "SELECT * FROM Taches";

        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                int id = rs.getInt("id");
                int projetId = rs.getInt("projet_id");
                String description = rs.getString("description");
                Date dateDebut = rs.getDate("date_debut");
                Date dateFin = rs.getDate("date_fin");

                Project project = fetchProjectById(projetId);

                Taches tache = new Taches(id, project, description, dateDebut, dateFin);
                taches.add(tache);
            }
        }

        return taches;
    }
    public Project fetchProjectById(int projetId) throws SQLException {
        String query = "SELECT * FROM Project WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, projetId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("nom");
                String description = rs.getString("description");

                return new Project(id, name, description);
            } else {
                return null;
            }
        }
    }

    public Taches getTachesById(int idtache,int projectId) throws SQLException {

        String sql = "SELECT * FROM Taches WHERE id = ?";
        Taches taches = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idtache);
            ResultSet rs = stmt.executeQuery();
            Project project = dao.getProjectById(projectId);
            if (rs.next()) {
                taches = new Taches(
                        rs.getInt("id"),
                        project,
                        rs.getString("description"),
                        rs.getDate("date_debut"),
                        rs.getDate("date_fin")


                );
            }
        }
        return taches;
    }

    public void updateTache(Taches tache) throws SQLException {
        String query = "UPDATE Taches SET projet_id = ?, description = ?, date_debut = ?, date_fin = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, tache.getProject().getId());
            stmt.setString(2, tache.getDescription());
            stmt.setDate(3, tache.getDateDebut());
            stmt.setDate(4, tache.getDateFin());
            stmt.setInt(5, tache.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteTache(int id) throws SQLException {
        String query = "DELETE FROM Taches WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

}

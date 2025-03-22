package ConstructionXpert.DAO;

import ConstructionXpert.Model.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static ConstructionXpert.DB_Connection.DbConnection.getConnection;

public class Dao {

    private static final String Insert_Project = "INSERT INTO Project (nom, description, date_de_debut, date_de_fin, budget) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_Project = "select * from Project;";
    private static final String DELETE_Project = "DELETE FROM Project where id = ?;";
    private static final String UPDATE_PROJECT ="UPDATE project SET nom = ?,  description = ?,date_de_debut = ?,date_de_fin = ?,budget = ? WHERE id = ?";

    public static void InsertProject(Project project) throws SQLException {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(Insert_Project)) {

            preparedStatement.setString(1, project.getNom());
            preparedStatement.setString(2, project.getDescription());
            preparedStatement.setDate(3, project.getDate_de_debut());
            preparedStatement.setDate(4, project.getDate_de_fin());
            preparedStatement.setDouble(5, project.getBudget());

            preparedStatement.executeUpdate();

        }

    }
    public boolean updateProject(Project project) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROJECT)) {
            preparedStatement.setString(1, project.getNom());
            preparedStatement.setString(2, project.getDescription());
            preparedStatement.setDate(3, project.getDate_de_debut());
            preparedStatement.setDate(4, project.getDate_de_fin());
            preparedStatement.setFloat(5, project.getBudget());
            preparedStatement.setInt(6, project.getId());
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Nombre de lignes mises à jour : " + rowsAffected);
            rowUpdated = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Update successful: " + rowUpdated);
        return rowUpdated;
    }
    public Project getProjectById(int id) throws SQLException {
        String query = "SELECT * FROM project WHERE id = ?";
        try (PreparedStatement ps = getConnection().prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Project(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("description"),
                        rs.getDate("date_de_debut"),
                        rs.getDate("date_de_fin"),
                        rs.getFloat("budget")
                );
            }
        }
        return null;
    }


    public List<Project> SelectAllProject() {
        List<Project> projects = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_Project);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nom = rs.getString("nom");
                String description = rs.getString("description");
                Date date_de_debut = rs.getDate("date_de_debut");
                Date date_de_fin = rs.getDate("date_de_fin");
                Float budget = rs.getFloat("budget");
                projects.add(new Project(id,nom,description,date_de_debut,date_de_fin,budget));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(projects);

        return projects;
    }
    public boolean deleteProject(int id) {
        boolean rowDeleted = false;

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_Project)) {

            System.out.println("Deleting member with ID: " + id); // Debugging

            preparedStatement.setInt(1, id);

            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected); // Debugging

            rowDeleted = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
}

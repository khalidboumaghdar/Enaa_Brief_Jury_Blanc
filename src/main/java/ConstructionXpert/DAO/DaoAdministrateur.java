package ConstructionXpert.DAO;

import ConstructionXpert.DB_Connection.DbConnection;
import ConstructionXpert.Model.Administrateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoAdministrateur {
    private Connection connection;

    public DaoAdministrateur() {
        connection = DbConnection.getConnection();
    }

    private static final String VERIFY_LOGIN = "SELECT * FROM administrateur WHERE email = ? AND mot_de_passe = ?";

    public Administrateur login(String email, String password) throws SQLException {
        Administrateur admin = null;
        try (PreparedStatement stmt = connection.prepareStatement(VERIFY_LOGIN)) {
            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    admin = new Administrateur(
                            rs.getInt("id"),
                            rs.getString("nom"),
                            rs.getString("prenom"),
                            rs.getString("email"),
                            rs.getString("mot_de_passe")
                    );
                }
            }
        }
        return admin;

    }
}

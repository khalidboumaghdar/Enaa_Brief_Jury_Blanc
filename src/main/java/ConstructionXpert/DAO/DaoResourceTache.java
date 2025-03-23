package ConstructionXpert.DAO;

import ConstructionXpert.DB_Connection.DbConnection;
import ConstructionXpert.Model.ResourceTache;
import ConstructionXpert.Model.Ressource;
import ConstructionXpert.Model.Taches;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoResourceTache {
    private Connection connection;
public DaoResourceTache() {
    connection = DbConnection.getConnection();

}
    private static final String SELECT_ALL_TacheResource =
            "SELECT tache_ressources.id AS id_tache_ressource, "
                    + "Taches.id AS id_tache, "
                    + "Taches.description AS description_tache, "
                    + "ressources.id AS id_ressource, "
                    + "ressources.nom AS nom_ressource, "
                    + "tache_ressources.quantite_utilisee "
                    + "FROM tache_ressources "
                    + "INNER JOIN Taches ON tache_ressources.tache_id = Taches.id "
                    + "INNER JOIN ressources ON tache_ressources.ressource_id = ressources.id";

    public List<ResourceTache> getAllResourceTache() throws SQLException {
        List<ResourceTache> resourceTacheList = new ArrayList<>();

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(SELECT_ALL_TacheResource)) {

            while (rs.next()) {
                int idTache = rs.getInt("id_tache_ressource");
                int quantiteUtilisee = rs.getInt("quantite_utilisee");

                int idTacheObj = rs.getInt("id_tache");
                String descriptionTache = rs.getString("description_tache");
                Taches tache = new Taches(idTacheObj, descriptionTache);

                int idRessource = rs.getInt("id_ressource");
                String nomRessource = rs.getString("nom_ressource");
                Ressource ressource = new Ressource(idRessource, nomRessource);

                ResourceTache resourceTache = new ResourceTache(idTache, quantiteUtilisee, ressource, tache);
                resourceTacheList.add(resourceTache);
            }
        }
        return resourceTacheList;
    }



}

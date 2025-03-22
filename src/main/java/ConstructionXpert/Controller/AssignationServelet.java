package ConstructionXpert.Controller;

import ConstructionXpert.DAO.Dao;
import ConstructionXpert.DAO.DaoAssignation;
import ConstructionXpert.DAO.DaoResource;
import ConstructionXpert.DAO.DaoTache;
import ConstructionXpert.Interface.IAssignation;
import ConstructionXpert.Model.Project;
import ConstructionXpert.Model.ResourceTache;
import ConstructionXpert.Model.Ressource;
import ConstructionXpert.Model.Taches;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AssignationServelet")
public class AssignationServelet extends HttpServlet implements IAssignation {
    public DaoAssignation daoAssignation;
public DaoResource resource;
    public DaoTache daoTache;
    @Override
    public void init() throws ServletException {
        daoAssignation = new DaoAssignation();
        daoTache = new DaoTache();
        resource = new DaoResource();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if (action == null) {
            } else {
                switch (action) {
                    case "add":
                        AddAssignation(req, resp);
                        break;
                    case "delete":
                        break;
                    case "update":
                        break;
                    default:
                        break;
                }
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
    }


    @Override
    public void AddAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
    int tache_id = Integer.parseInt(request.getParameter("tache_id"));
    int project_id = Integer.parseInt(request.getParameter("project_id"));
    int ressource_id= Integer.parseInt(request.getParameter("ressource_id"));
    int quantite_utilisee = Integer.parseInt(request.getParameter("quantite_utilisee"));
    Taches taches = daoTache.getTachesById(tache_id,project_id);
    Ressource ressource = resource.getResourceById(ressource_id);
    ResourceTache resourceTache = new ResourceTache(quantite_utilisee,ressource,taches);
    daoAssignation.AddResourceTache(resourceTache);
        response.sendRedirect("TacheServelet");

    }

    @Override
    public void RemoveAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

    }

    @Override
    public void UpdateAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

    }

    @Override
    public void ShowAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

    }

    @Override
    public void ShowPageAddAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {



    }
}

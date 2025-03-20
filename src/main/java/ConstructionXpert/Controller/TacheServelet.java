package ConstructionXpert.Controller;

import ConstructionXpert.DAO.Dao;
import ConstructionXpert.DAO.DaoTache;
import ConstructionXpert.Model.Project;
import ConstructionXpert.Model.Taches;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/TacheServelet")
public class TacheServelet extends HttpServlet {
    private DaoTache dao;
    private Dao daoproject;

    public void init() {
        dao = new DaoTache();
        daoproject= new Dao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                ShowTaches(request, response);
            } else {
                switch (action) {
                    case "add":
                        AddTache(request, response);
                        break;
                    case "delete":
                        RemoveTache(request, response);
                        break;
                    case "update":
                        UpdateTache(request, response);
                        break;
                    default:
                        ShowTaches(request, response);
                        break;
                }
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    public void AddTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int projetId = Integer.parseInt(request.getParameter("projet_id"));
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));

        Project project = dao.fetchProjectById(projetId);

        Taches tache = new Taches(projetId, project, description, dateDebut, dateFin);
        dao.InsertTache(tache);

        response.sendRedirect("TacheServelet");
    }

    public void RemoveTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteTache(id);
        response.sendRedirect("TacheServelet");
    }

    public void UpdateTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        int projetId = Integer.parseInt(request.getParameter("projet_id"));
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));

        Project project = dao.fetchProjectById(projetId);

        Taches tache = new Taches(id, project, description, dateDebut, dateFin);
        dao.updateTache(tache);

        response.sendRedirect("TacheServelet");
    }

    public void ShowTaches(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Taches> taches = dao.SelectAllTaches();
        request.setAttribute("taches", taches);
        List<Project> projectList = daoproject.SelectAllProject();
        request.setAttribute("projectList", projectList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Tache.jsp");
        dispatcher.forward(request, response);
    }
}

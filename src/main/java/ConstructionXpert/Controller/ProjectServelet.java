package ConstructionXpert.Controller;

import ConstructionXpert.DAO.Dao;
import ConstructionXpert.Interface.ITache;
import ConstructionXpert.Model.Project;
import ConstructionXpert.Interface.IProject;

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

@WebServlet("/")
public class ProjectServelet extends HttpServlet implements IProject {
    public Dao dao ;
    public void init() {
        dao=new Dao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/project":
                try {
                    ShowProject(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/delete":
                try {
                    RemoveProject(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
                case "/edit":
                    try {
                        UpdateProject(request,response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
            case "/AddProject":
                try {
                    AddProject(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                dasshbord(request, response);
                break;
        }
    }
    public void dasshbord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void ShowProject(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Project> projectList = dao.SelectAllProject();
        request.setAttribute("projectList", projectList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("project.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    public void AddProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
    String nom = request.getParameter("nom");
    String description = request.getParameter("description");
    String date_debut = request.getParameter("date_debut");
    Date dt_debut = Date.valueOf(date_debut);
    String date_fin = request.getParameter("date_fin");
    Date dt_fin = Date.valueOf(date_fin);
    Float budget = Float.parseFloat(request.getParameter("budget"));
       Project project = new Project(nom,description,dt_debut,dt_fin,budget);
        dao.InsertProject(project);
        response.sendRedirect("./project");
    }

    @Override
    public void RemoveProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteProject(id);
        response.sendRedirect("./project");
    }

    @Override
    public void UpdateProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idpr"));
        String nom = request.getParameter("nompr");
        String description = request.getParameter("descriptionpr");
        String date_debut = request.getParameter("date_debutpr");
        Date dt_debut = Date.valueOf(date_debut);
        String date_fin = request.getParameter("date_finpr");
        Date dt_fin = Date.valueOf(date_fin);
        Float budget = Float.parseFloat(request.getParameter("budgetpr"));
        Project project = new Project(id,nom,description,dt_debut,dt_fin,budget);
        dao.updateProject(project);
        response.sendRedirect("./project");

    }



}

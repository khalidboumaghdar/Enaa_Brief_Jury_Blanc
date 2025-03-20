package ConstructionXpert.Controller;

import ConstructionXpert.DAO.DaoResource;
import ConstructionXpert.Interface.IResource;
import ConstructionXpert.Model.Ressource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ResourceServelet")
public class ResourceServelet extends HttpServlet implements IResource {
    private DaoResource dao;

    @Override
    public void init() throws ServletException {
        dao = new DaoResource();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if (action == null) {
                ShowRsource(req, resp);
            } else {
                switch (action) {
                    case "add":
                        AddRsource(req, resp);
                        break;
                    case "delete":
                        RemoveRsource(req, resp);
                        break;
                    case "update":
                        UpdateRsource(req, resp);
                        break;
                    default:
                        ShowRsource(req, resp);
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
    public void AddRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String nom = request.getParameter("nom");
        String type = request.getParameter("type");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String forniseur = request.getParameter("forniseur");

        Ressource resource = new Ressource(nom, type, quantity, forniseur);
        dao.addResource(resource);

        response.sendRedirect("ResourceServelet?action=show");
    }

    @Override
    public void RemoveRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteResource(id);

        response.sendRedirect("ResourceServelet?action=show");
    }

    @Override
    public void UpdateRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String type = request.getParameter("type");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String forniseur = request.getParameter("forniseur");

        Ressource resource = new Ressource(id, nom, type, quantity, forniseur);
        dao.updateResource(resource);

        response.sendRedirect("ResourceServelet?action=show");
    }

    @Override
    public void ShowRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Ressource> resources = dao.getAllResources();

        request.setAttribute("resources", resources);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Resource.jsp");
        requestDispatcher.forward(request, response);

    }
}

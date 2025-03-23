package ConstructionXpert.Controller;

import ConstructionXpert.DAO.DaoResourceTache;
import ConstructionXpert.Model.ResourceTache;
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

@WebServlet("/ResourceTache")
public class ResorceTacheServelete extends HttpServlet {
    public DaoResourceTache daoResourceTache;
    @Override
    public void init() throws ServletException {
        daoResourceTache = new DaoResourceTache();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ShowRsourceTache(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public void ShowRsourceTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<ResourceTache> resourceTaches = daoResourceTache.getAllResourceTache();
        request.setAttribute("resourceTaches", resourceTaches);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ResourceTache.jsp");
        requestDispatcher.forward(request, response);

    }
}

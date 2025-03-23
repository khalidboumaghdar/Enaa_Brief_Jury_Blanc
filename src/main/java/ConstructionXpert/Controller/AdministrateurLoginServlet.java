package ConstructionXpert.Controller;

import ConstructionXpert.DAO.DaoAdministrateur;
import ConstructionXpert.Model.Administrateur;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/LoginServlet")
public class AdministrateurLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        DaoAdministrateur dao = new DaoAdministrateur();
        try {
            Administrateur admin = dao.login(email, password);
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                response.sendRedirect("dashboard");
            } else {
                request.setAttribute("error", "Email ou mot de passe incorrect !");
                request.getRequestDispatcher("./").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

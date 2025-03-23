package ConstructionXpert.Security;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({"/ResourceTache.jsp", "/ResourceTache","/AssignationServelet"})
public class ResourceTacheFilter implements Filter {


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("admin") != null) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            resp.sendRedirect("404.jsp");
        }
    }
}

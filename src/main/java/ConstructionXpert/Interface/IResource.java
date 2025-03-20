package ConstructionXpert.Interface;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public interface IResource {
    public void AddRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void RemoveRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void UpdateRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void ShowRsource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
}

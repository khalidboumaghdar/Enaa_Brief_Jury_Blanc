package ConstructionXpert.Interface;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public interface IProject {
    public void AddProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void RemoveProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void UpdateProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void ShowProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
}

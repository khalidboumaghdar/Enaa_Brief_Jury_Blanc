package ConstructionXpert.Interface;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public interface ITache {
    public void AddTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void RemoveTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void UpdateTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void ShowTaches(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
}

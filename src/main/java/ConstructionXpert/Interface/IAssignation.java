package ConstructionXpert.Interface;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public interface IAssignation {
    public void AddAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void RemoveAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void UpdateAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void ShowAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;
    public void ShowPageAddAssignation(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException;

}

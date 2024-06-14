/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.WEB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.EmployeeDAO;
import com.Model.Employee;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/")
public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }
     
    protected void doPost (HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    doGet (request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getServletPath();

            try {
                switch (action) {
                    case "/new":
                        showNewForm (request, response); 
                        break;
                    case "/insert":
                        insertEmployee (request, response);
                        break;
                    case "/delete":
                        deleteEmployee (request, response);
                        break;
                    case "/edit":
                        showEditForm(request, response);
                        break;
                    case "/update":
                        updateEmployee (request, response); 
                        break;
                    default:
                        listEmployee (request, response);
                        break;
                }
            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
    }
    
    private void listEmployee (HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException {
        List <Employee> listEmployee = employeeDAO.selectAllEmployee();
        request.setAttribute ("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher ("EmployeeList.jsp"); 
        dispatcher.forward (request, response);
    }
    
    private void showNewForm (HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        RequestDispatcher dispatcher= request.getRequestDispatcher("EmployeeForm.jsp"); 
        dispatcher. forward (request, response);
    }
    
    private void showEditForm (HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); 
        Employee existingEmployee = employeeDAO.selectEmployee(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher ("EmployeeForm.jsp"); 
        request.setAttribute ("employee", existingEmployee); 
        dispatcher.forward(request, response);
    }
    
    private void insertEmployee (HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        Employee newEmployee = new Employee(name, email, position);
        employeeDAO.insertEmployee (newEmployee); 
        response.sendRedirect ("list");
    }
    
    private void updateEmployee (HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name= request.getParameter("name");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        
        Employee employee = new Employee(id, name, email, position); 
        employeeDAO.updateEmployee(employee); 
        response.sendRedirect("list");
    }
    
    private void deleteEmployee (HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeDAO.deleteEmployee(id); 
        response.sendRedirect ("list");
    }
}
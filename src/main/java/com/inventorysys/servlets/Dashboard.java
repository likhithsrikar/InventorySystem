package com.inventorysys.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_db", "user", "pass");
      Statement stmt = conn.createStatement();
      
      
      ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM products");
      rs1.next();
      request.setAttribute("totalProducts", rs1.getInt(1));
      
   
      ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM products WHERE stock_quantity < min_stock_level");
      rs2.next();
      request.setAttribute("lowStockItems", rs2.getInt(1));
      
 
      request.getRequestDispatcher("dashboard.jsp").forward(request, response);
      
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
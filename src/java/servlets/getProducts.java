/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Product;
import beans.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.database;

/**
 *
 * @author mirza
 */
@WebServlet(name = "getProducts", urlPatterns = {"/getProducts"})
public class getProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
            Connection con = null;
            Statement stmt = null;
            
            ResultSet rs = null;
            ArrayList<Product> items = new ArrayList<>();
            
            String query = "SELECT * FROM proizvodi";
            String address = "checkProducts.jsp";
            
            
            
            try {
                con = database.getInstance().getConnection();
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);
                
                while (rs.next()) {
                    Product product = new Product();
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getFloat("price"));
                    product.setDescription(rs.getString("description"));
                     product.setId(rs.getInt("id"));
                    items.add(product);
                }         
            } catch (SQLException e) {
                String error = e.getMessage();
                request.setAttribute("errormessage", error);
                address = "error.jsp";
            }
            
            request.setAttribute("items", items);
            RequestDispatcher rd = request.getRequestDispatcher(address);
            rd.forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

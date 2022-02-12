/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
       
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            HttpSession session = request.getSession();
            User user = new User();
            
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            String query = "SELECT * FROM user WHERE username = '" + username + "' AND password = '" + password + "'";
            String nextAddress = "index.jsp";
            
            try {
                con = database.getInstance().getConnection();
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);
                
                if (rs.next()) {
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getShort("role"));
                    user.setId(rs.getInt("id"));
                    stmt.close();
                    session.setAttribute("user", user);
                } else {
                    stmt.close();
                    out.println("Wrong username or password");
                    return;
                }              
            } catch (SQLException e) {
                nextAddress = "error.jsp";
            }
            
            RequestDispatcher rd = request.getRequestDispatcher(nextAddress);
            rd.forward(request, response);
        }
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

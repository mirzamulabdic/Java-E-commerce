/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Order;
import beans.Product;
import beans.User;
import beans.orderData;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.database;

/**
 *
 * @author mirza
 */
@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {

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
           
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            
            ArrayList<Product> cart_list = (ArrayList<Product>) request.getSession().getAttribute("cart_list");
            List<Product> cartProducts = null;
            float total = 0;
            
            if(cart_list != null) {
            
                Product prod = new Product(database.getConnection());
                cartProducts = prod.getCartProducts(cart_list);
                total = prod.getCartTotal(cart_list);
                request.setAttribute("cart_list", cart_list);
                request.setAttribute("total", total);
            } else {
                response.sendRedirect("shoppingcart.jsp");
            }
           
            StringJoiner products = new StringJoiner(", ");
            
            for(Product prod:cartProducts){
                products.add(prod.getName());
            }
            
            
           User user = (User) request.getSession().getAttribute("user");
           
           if(cart_list != null) {
                orderData order = new orderData();
                order.setProducts(products.toString());
                order.setTotal_price(total);
                order.setUser_id(user.getId());
                order.setStatus(0);
                order.setDate(formatter.format(date));

                Order n = new Order(database.getConnection());

                boolean result = n.insertOrder(order);
                
                if(result){
                    cart_list.clear();
                }
               
               
               response.sendRedirect("orders.jsp");
               
           } else {
               response.sendRedirect("shoppingcart.jsp");
           }
        } catch (Exception e) {
            e.printStackTrace();
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

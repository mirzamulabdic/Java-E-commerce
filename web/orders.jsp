<%-- 
    Document   : orders
    Created on : 22-Nov-2021, 22:27:46
    Author     : mirza
--%>


<%@page import="beans.Product"%>
<%@page import="beans.Order"%>
<%@page import="beans.orderData"%>
<%@page import="util.database"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="beans.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE html>
<html>
    <head>
        
        <style> 
        
            
            .container,body{
                background: #222b31  !important;
            }
            table {
            background-color: #222b31  !important;
            color: #ee445f !important
            }
            td{
                background-color: #222b31  !important;
                
            }
            thead{
                background-color: #222b31  !important;
                
            }
            .card-header{
                color: rgb(182, 182, 182) !important
            }
            
        </style>
        
        <title>Orders</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    </head>
    <body>
    <%@include file="navbar.jsp" %>
    
    <c:if test="${user.role == 1}">
    <%
        
    Order ord = new Order(database.getConnection());
    List<orderData> ordAdmin = ord.getAllOrders();
    
    %>
        <div class="container">
            <div class="card-header my-3">All orders</div>
            <table class="table table-light"  >
                <thead>
                    <tr style="color: rgb(182, 182, 182)">
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182); backgroundpadding: red ">Products</th>
                        <th scope="col"style="background: #222b31; color:rgb(182, 182, 182)">Date</th>
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182)">Total</th>
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182)" >User ID</th>
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182)">Status</th>
                       
                    </tr>
                </thead>
                <tbody>
                    
                <% if(!ordAdmin.isEmpty()) {
                    
                    for(orderData p:ordAdmin){%>
                        <tr>
                            
                            <td style="color: rgb(182, 182, 182)"><%=p.getProducts() %></td>
                            <td style="color: rgb(182, 182, 182)"><%=p.getDate() %></td>
                            <td style="color: rgb(182, 182, 182)"><%=p.getTotal_price() %> KM</td>
                             <td style="color: rgb(182, 182, 182)"><%=p.getUser_id() %></td>
                           
                             <% if(p.getStatus() == 0) {%>
                            <td style="color:lightblue;">Order created</td><% } %>
                            
                            <% if(p.getStatus() == 1) {%>
                            <td style="color:green;">Order ready</td><% } %>
                            
                           
                            
                            <% if(p.getStatus() == 2) {%>
                            <td style="color:red;">Canceled</td><% } %>
                            
                            
                            <td>
                                <% if(p.getStatus() == 0) { %>
                                <a class = "btn btn-sm btn-success" href="setOrder?id=<%= p.getOrderID() %>">Confirm</a>
                                <a class = "btn btn-sm btn-danger" href="cancelOrder?id=<%= p.getOrderID() %>">Deny</a>
                                <% } %>
                            </td>
                        </tr>
                    <%}
                    }
                    %>
                </tbody>
            </table>
        </div>
    </c:if>
    
    <c:if test="${user.role == 2}">
    <%
    
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    User user = (User) request.getSession().getAttribute("user");
    List<orderData> nUser = null;

    if(user != null) {
        request.setAttribute("user", user);
        nUser = new Order(database.getConnection()).userOrders(user.getId());
    }
   
    ArrayList<Product> cart_list = (ArrayList<Product>) session.getAttribute("cart_list");
    if(cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
    


%>
        
<div class="container">
            <div class="card-header my-3">All products</div>
            <table class="table table-light">
                <thead>
                    <tr style="color: rgb(182, 182, 182)">
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182); backgroundpadding: red ">Products</th>
                        <th scope="col"style="background: #222b31; color:rgb(182, 182, 182)">Date</th>
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182)">Total</th>
                         <th scope="col" style="background: #222b31; color:rgb(182, 182, 182)" >User ID</th>
                        <th scope="col" style="background: #222b31; color:rgb(182, 182, 182)">Status</th>
                       
                    </tr>
                </thead>
                <tbody>
                    
                <% if(!nUser.isEmpty()) {
                    
                    for(orderData p:nUser){%>
                        <tr>
                            
                            <td style="color: rgb(182, 182, 182)"><%=p.getProducts() %></td>
                            <td style="color: rgb(182, 182, 182)"><%=p.getDate() %></td>
                            <td style="color: rgb(182, 182, 182)"><%=p.getTotal_price() %> KM</td>
                             <td style="color: rgb(182, 182, 182)"><%=p.getUser_id() %></td>
                            
                            <% if(p.getStatus() == 0) {%>
                            <td style="color:lightblue;">Order created</td><% } %>
                            
                            <% if(p.getStatus() == 1) {%>
                            <td style="color:green;">Order ready</td><% } %>
                            
                           
                            
                            <% if(p.getStatus() == 2) {%>
                            <td style="color:red;">Canceled</td><% } %>
                            
                           
                        </tr>
                    <%}
                    }
                    %>
                    
                </tbody>
            </table>
        </div>
    </c:if>
    </body>
</html>

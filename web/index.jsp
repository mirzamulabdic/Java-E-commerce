
<%-- 
    Document   : index
    Created on : 16-Nov-2021, 22:10:21
    Author     : mirza
--%>
<%@page import="java.util.List"%>

<%@page import="beans.Product"%>
<%@page import="util.database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<% 
Product proizvod = new Product(database.getConnection());
List<Product> products = proizvod.getProducts();

%>

<style> 
    
  body {
  background: #222b31  !important;
}
    .card{
        
         background-color: rgb(182, 182, 182) ;
        left: 10%;
        top: 5%;
        display: flex;
        flex: 1;
        display: inline;
        float: left;
        margin: 10px;
        margin-top: 20px;
         border-top-left-radius: 20px !important;
        
         border-bottom-right-radius: 20px !important;
    }
    
</style>

<html>
    <head>
              
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        
            <jsp:include page="navbar.jsp"></jsp:include>
            
              
             <%
    if(!products.isEmpty()) {
    for(Product p:products) {%>
         <div class="col-md-3" style="margin-top: 10px; display:inline;" > 
        
         <div class="card" style="width: 18rem;" >
        
         <div class="card-body">
             <img class="card-img-top img-fluid" src="https://media.istockphoto.com/vectors/the-banner-with-new-product-is-depicted-on-a-white-background-vector-id1178279813?k=20&m=1178279813&s=170667a&w=0&h=u136c1gQ2o0z5O8-ciprQxf0KTyO01AoGWI965GRlyc=" alt="Card image cap">
         <h3 class="card-title"><%= p.getName() %></h5>
         <h6 class="card-title">Price: <%= p.getPrice() %> KM</h5>
        <p class="card-text"><%= p.getDescription() %></p>
         <c:if test="${user.role != 3 && user.role != 1}">
        <a href="addToCart?id=<%=p.getId()%>" class="btn btn-success">Add to Cart</a>
        </c:if>
         </div>
        </div>
                
             
                   
            
             <%
			}
			} else {
			%>
                        <h3 style="color:  rgb(182, 182, 182); margin-top: 5%; margin-left: 2%">There is no products!</h3>
                       <% 
			}
			%>
                

    </body>
</html>

<%-- 
    Document   : shoppingcart
    Created on : 18-Nov-2021, 18:20:04
    Author     : mirza
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="util.database"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Product"%>

<%


ArrayList<Product> cart_list = (ArrayList<Product>) session.getAttribute("cart_list");
List<Product> cartProduct = null;

        if (cart_list != null) {
	Product pr = new Product(database.getConnection());
	cartProduct = pr.getCartProducts(cart_list);
	double total = pr.getCartTotal(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
        }
%>
   


<!DOCTYPE html>
<html>
<head>
    
  <style>
      body{
          
          background: #222b31  !important;
      }
      
   .payment-form{
	padding-bottom: 50px;
	font-family: 'Montserrat', sans-serif;
}

.payment-form.dark{
	background: #222b31  !important;
}

.payment-form .content{
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	background-color: white;
}

.payment-form .block-heading{
    padding-top: 50px;
    margin-bottom: 40px;
    text-align: center;
}

.payment-form .block-heading p{
	text-align: center;
	max-width: 420px;
	margin: auto;
	opacity:0.7;
}

.payment-form.dark .block-heading p{
	opacity:0.8;
}

.payment-form .block-heading h1,
.payment-form .block-heading h2,
.payment-form .block-heading h3 {
	margin-bottom:1rem;
	color: white;
}

.payment-form form{
	border-top:4px solid #ee445f;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	background-color: #ffffff;
	padding: 0;
	max-width: 600px;
	margin: auto;
}

.payment-form .title{
	font-size: 1em;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	margin-bottom: 0.8em;
	font-weight: 600;
	padding-bottom: 8px;
}

.payment-form .products{
	background-color: rgb(182, 182, 182) ;
    padding: 25px;
   
}

.payment-form .products .item{
	margin-bottom:1em;
}

.payment-form .products .item-name{
	font-weight:600;
	font-size: 0.9em;
}

.payment-form .products .item-description{
	font-size:0.8em;
	opacity:0.6;
}

.payment-form .products .item p{
	margin-bottom:0.2em;
}

.payment-form .products .price{
	float: right;
	font-weight: 600;
	font-size: 0.9em;
}

.payment-form .products .total{
	border-top: 1px solid rgba(0, 0, 0, 0.2);
	margin-top: 10px;
	padding-top: 19px;
	font-weight: 600;
	line-height: 1;
}

.payment-form .card-details{
	padding: 25px 25px 15px;
        background-color: rgb(182, 182, 182) ;
        border-bottom:4px solid #ee445f;
}

.payment-form .card-details label{
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
	color: #79818a;
	text-transform: uppercase;
}

.payment-form .card-details button{
	margin-top: 0.6em;
	padding:12px 0;
	font-weight: 600;
}

.payment-form .date-separator{
 	margin-left: 10px;
    margin-right: 10px;
    margin-top: 5px;
}

@media (min-width: 576px) {
	.payment-form .title {
		font-size: 1.2em; 
	}

	.payment-form .products {
		padding: 40px; 
  	}

	.payment-form .products .item-name {
		font-size: 1em; 
	}

	.payment-form .products .price {
    	font-size: 1em; 
	}

  	.payment-form .card-details {
    	padding: 40px 40px 30px; 
    }

  	.payment-form .card-details button {
    	margin-top: 2em; 
    } 
}
</style>

  <title>Payment</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    
    <%@include file="navbar.jsp" %>

    
      <main class="page payment-page" style="background: #222b31">
    <section class="payment-form dark">
      <div class="container">
        <div class="block-heading">
          <h2>Shopping Cart</h2>
        </div>
        <form>
        
          <div class="products">
            <h3 class="title">Checkout</h3>
            <%
                if(cart_list != null) {
                    for(Product p:cartProduct){%>
                        <div class="item">
                        
                            <span class="price"><%= p.getPrice() %> KM
                             <a href="deleteProducts?id=<%= p.getId() %>"><button type="button" class="btn btn-primary btn-danger" style="padding: 5px; margin-left: 10px;">Delete</button></a>
                        
                        </span>
                        <img class="rounded" src="https://i.imgur.com/XiFJkhI.jpg" width="40">
                        <p class="item-name"><%= p.getName() %></p>
                        <p class="item-description"><%= p.getDescription() %></p>
                        </div>
                    <%}
                }
            %>
    
            
             
            <div class="total">Total<span class="price">${(total>0)?total:0} KM</span></div>
          </div>
          <div class="card-details">
            <div class="row">
              <div class="form-group col-sm-12">
                  <%
                if(cart_list.size()>0) { %>
                  <a href="order"><button type="button" class="btn btn-primary btn-success" style="padding: 5px;">Place order</button></a>
                  <a href="index.jsp" class="btn btn-primary btn-danger" style="margin-top: 30px; margin-left: 5px; font-weight: bolder;">Back</a>

                  <% } %>
                  <%
                if(cart_list.size() == 0) { %>
                  <a href="index.jsp" class="btn btn-primary btn-danger" style="margin-top: 30px; margin-left: 5px; font-weight: bolder;">Back</a>
                  <% } %>
                  
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
  </main>
       
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>

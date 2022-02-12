<style> 

.navbar {
    
  background: #222b31 !important;
  border-bottom: 4px solid #ee445f !important;
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #192226">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp" style="  color: rgb(182, 182, 182)">Mini E-Commerce</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style=" color: rgb(182, 182, 182)" aria-current="page" href="index.jsp">Home</a>
        </li>
      </ul>
        <c:if test="${user.role == 1}">
            <a class="btn btn-primary" href="index.jsp" role="button" style="margin-right: 15px">Products</a>
            <a class="btn btn-primary" href="addproduct.jsp" role="button" style="margin-right: 15px">Add Product</a>
            <a class="btn btn-primary" href="orders.jsp" role="button" style="margin-right: 15px">Requests</a>
        </c:if>
        
            <c:if test="${user.role == 2}">
                <a class="btn btn-warning" href="index.jsp" role="button" style="margin-right: 15px">Products</a>
            <a class="btn btn-warning" href="shoppingcart.jsp" role="button" style="margin-right: 15px">Shopping Cart</a>
             <a class="btn btn-warning" href="orders.jsp" role="button" style="margin-right: 15px">Requests</a>
        </c:if>
        
       <c:if test="${user.role != 3}">
        <form action="Logout" method="POST" class="d-flex">
            <span class="navbar-text" style="margin-right: 15px;  color: rgb(182, 182, 182)">${user.username}</span>  
            <a class="btn btn-outline-danger" href="logout" role="button" style="margin-right: 15px">Log Out</a>
            
            
        </form>
      </c:if>
      <c:if test="${user.role == 3}">
        <form action="Logout" method="POST" class="d-flex">
            <span class="navbar-text" style="margin-right: 15px; color: rgb(182, 182, 182)">guest</span>  
            <a class="btn btn-outline-success" href="login.jsp" role="button" style="margin-right: 15px">Login</a>
        </form>
      </c:if>
    </div>
  </div>
</nav>
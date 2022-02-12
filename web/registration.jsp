<%-- 
    Document   : registration
    Created on : 15-Nov-2021, 22:53:00
    Author     : mirza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        
            body {
  background: #42545c !important;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.card-img-left {
  width: 45%;
  /* Link to your background image using in the property below! */
  background: scroll center url('https://images.unsplash.com/photo-1576068036336-328de1be1f2f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
  background-size: cover;
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
}

            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
       <div class="container">
           
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
          <div class="card-img-left d-none d-md-flex">
            <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body p-4 p-sm-5">
              
            <h5 class="card-title text-center mb-5 fw-light fs-5">First you need to register</h5>
            <hr class="my-4">
            <form action="registration" method="POST">

              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInputUsername" placeholder="myusername" name="username" required autofocus>
                <label for="floatingInputUsername">Username</label>
              </div>

                
                <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInputAddress" placeholder="address" name="address" required autofocus>
                <label for="floatingInputUsername">Address</label>
              </div>
                
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                <label for="floatingPassword">Password</label>
              </div>

              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingPasswordConfirm" placeholder="Confirm Password" name="confirmPassword">
                <label for="floatingPasswordConfirm">Confirm Password</label>
              </div>

              <div class="d-grid mb-2">
                <button class="btn btn-lg btn-primary btn-login fw-bold text-uppercase" type="submit">Register</button>
              </div>

              <a class="d-block text-center mt-2 small" href="login.jsp">Have an account? Sign In</a>

              <hr class="my-4">

              <a class="d-block text-center mt-2 small" href="guest" size="5">Login as Guest</a>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
    </body>
</html>

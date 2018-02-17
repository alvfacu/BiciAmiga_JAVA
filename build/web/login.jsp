<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.*" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BiciAmiga - Rosario</title>

    <!-- Bootstrap core CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/business-casual.min.css" rel="stylesheet">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"> 

  </head>

  <body>

    <h1 class="site-heading text-center text-white d-none d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Recorre Rosario de la manera más cómoda</span>
      <a class="site-heading-lower" href="index.jsp" style="color:#ffff; text-decoration: none" >BiciAmiga</a>
    </h1>

    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->
    <div class="container text-center">
      <div class="row">
        <%session.setAttribute("Usuario",null);%>
        <!--%session.setAttribute("Msj",null);%-->
        <!--Login-->   
        <form class="form-signin col-centered" action="Login" method="POST">
          <h1 class="site-heading text-center text-white d d-lg-block">
            <span class="site-heading-upper text-primary mb-3">Iniciar Sesión</span>
          </h1>          
          <label for="inputEmail" class="sr-only">Usuario</label>
          <input type="text" name="user" id="inputEmail" class="form-control" placeholder="Usuario" required autofocus>
          <label for="inputPassword" class="sr-only">Contraseña</label>
          <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Contraseña" required>
          <%if(session.getAttribute("Msj") != null){ %>
            <p class="error">Usuario o contraseña incorrecto/s</p>
		      		<% } %>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
          <a href="registrar.jsp">Aún no estoy registrado<br><br></a>
        </form>
      </div>
    </div>

    <!-- Footer -->
    <%@include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
  </body>

</html>

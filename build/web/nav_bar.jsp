<%@page import="Entidades.Usuarios"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
      <div class="container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="index.jsp">BiciAmiga</a>
        <button class="navbar-toggler" type="button" id="btn1">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item px-lg-4" id="index">
              <a class="nav-link text-uppercase text-expanded" href="index.jsp">Inicio
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item px-lg-4" id="comofun">
              <a class="nav-link text-uppercase text-expanded" href="index.jsp#como">¿Cómo funciona?</a>
            </li>
            <li class="nav-item px-lg-4" id="bicicletas">
              <a class="nav-link text-uppercase text-expanded" href="bicicletas.jsp">Nuestras Bicis</a>
            </li>
            <li class="nav-item px-lg-4" id="reserva">
              <a class="nav-link text-uppercase text-expanded" href="reserva.jsp" style="color: #ffc107;">Reservar</a>
            </li>                        
            <li class="nav-item px-lg-4" id="contacto">
              <a class="nav-link text-uppercase text-expanded" href="contacto.jsp">Contacto</a>
            </li>
            <% if (session.getAttribute("Usuario") == null) {%>
            <li class="nav-item px-lg-4" id="login">
              <a class="nav-link text-uppercase text-expanded" href="login.jsp">Ingresa / Registrate</a>
            </li>
            <%}%>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Sesson Navigation -->
    <% if (session.getAttribute("Usuario") != null) {
      Usuarios usrActual = (Usuarios)session.getAttribute("Usuario");%>
    <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="sessionNav">
      <div class="container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="mi_cuenta.jsp">
          <%= usrActual.getUsuario()%>
        </a>
        <button class="navbar-toggler" type="button" id="btn2">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="sesbarResponsive">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item px-lg-4" id="cuenta">
              <a class="nav-link text-uppercase text-expanded" href="mi_cuenta.jsp">Mi Cuenta</a>
            </li>
            <% if(usrActual.isAdm()){%>
            <li class="nav-item px-lg-4" id="reserva">
              <a class="nav-link text-uppercase text-expanded" href="listar_reservas.jsp">Reservas</a>
            </li>
            <%if(usrActual.isMecanico()){%>
            <li class="nav-item px-lg-4" id="mantenimiento">
              <a class="nav-link text-uppercase text-expanded" href="listar_mantenimientos.jsp">Mantenimientos</a>
            </li>
            <%}} else {%>
            <li class="nav-item px-lg-4" id="reserva">
              <a class="nav-link text-uppercase text-expanded" href="mis_reservas.jsp">Mis reservas</a>
            </li>
            <%}%>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="Logout">Cerrar Sesión</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>  
    <%}%>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
      $("#btn1").click(function ()
      {
        $("#navbarResponsive").toggleClass("show");
      });
      
      $("#btn2").click(function ()
      {
        $("#sesbarResponsive").toggleClass("show");
      });
      
      $(function() {        
        $('#' + location.pathname.split("/")[2].replace('.jsp','')).toggleClass('active');
        
        var url = location.pathname.split("/")[2].replace('.jsp','');
        if (url === "registrar") {
          $("#login").toggleClass('active');           
        };
      });
    </script>
  </body>

</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BiciAmiga - Rosario</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
      <a class="site-heading-lower" href="index.html" style="color:#ffff; text-decoration: none" >BiciAmiga</a>
    </h1>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
      <div class="container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="index.html">BiciAmiga</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="index.html">Inicio
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="#como">¿Cómo funciona?</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="bicicletas.html">Nuestras Bicis</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="reserva.html" style="color: #ffc107;">Reservar</a>
            </li>            
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="login.jsp">Ingresa / Registrate</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="contacto.html">Contacto</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Body -->
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Completar formulario</span>
    </h1> 
    <div class="container">
      <div class="col-lg-12 well">
        <form class="form-text" method="post" action="#">
          <div class="col-lg-12 well">
            <div class="row">
                <div class="col-sm-12">
                  <div class="row">
                    <div class="col-sm-6 form-group">
                      <label>First Name</label>
                      <input type="text" placeholder="Enter First Name Here.." class="form-control">
                    </div>
                    <div class="col-sm-6 form-group">
                      <label>Last Name</label>
                      <input type="text" placeholder="Enter Last Name Here.." class="form-control">
                    </div>
                  </div>					
                  <div class="form-group">
                    <label>Address</label>
                    <textarea placeholder="Enter Address Here.." rows="3" class="form-control"></textarea>
                  </div>	
                  <div class="row">
                    <div class="col-sm-4 form-group">
                      <label>City</label>
                      <input type="text" placeholder="Enter City Name Here.." class="form-control">
                    </div>	
                    <div class="col-sm-4 form-group">
                      <label>State</label>
                      <input type="text" placeholder="Enter State Name Here.." class="form-control">
                    </div>	
                    <div class="col-sm-4 form-group">
                      <label>Zip</label>
                      <input type="text" placeholder="Enter Zip Code Here.." class="form-control">
                    </div>		
                  </div>
                  <div class="row">
                    <div class="col-sm-6 form-group">
                      <label>Title</label>
                      <input type="text" placeholder="Enter Designation Here.." class="form-control">
                    </div>		
                    <div class="col-sm-6 form-group">
                      <label>Company</label>
                      <input type="text" placeholder="Enter Company Name Here.." class="form-control">
                    </div>	
                  </div>						
                  <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" placeholder="Enter Phone Number Here.." class="form-control">
                  </div>		
                  <div class="form-group">
                    <label>Email Address</label>
                    <input type="text" placeholder="Enter Email Address Here.." class="form-control">
                  </div>	
                  <div class="form-group">
                    <label>Website</label>
                    <input type="text" placeholder="Enter Website Name Here.." class="form-control">
                  </div>
                  <button type="button" class="btn btn-lg btn-info">Submit</button>					
                </div> 
            </div>
          </div>
        </form>
      </div>            
    </div>          

  <!-- Footer -->
  <footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small"> TP FINAL JAVA &copy; | BiciAmiga &reg; | Alvarez | 2018</p>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
    //validate password
    function validarPassword() {
      var c1 = document.formAltaCliente.clave.value;
      var c2 = document.formAltaCliente.clave2.value;

      if (c1 !== c2) {
        alert("Las contraseñas deben de coincidir");
      }
    }
  </script>
</body>

</html>
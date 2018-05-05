<!DOCTYPE html>
<head>

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
  <!-- Navigation -->
  <%@include file="nav_bar.jsp"%>


  <!-- Body -->
  <h1 class="site-heading text-center text-white d d-lg-block">
    <span class="site-heading-upper text-primary mb-3">Mi cuenta</span>
  </h1> 

  <% if (session.getAttribute("Usuario") != null) {
      Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");%>
  <div class="container text-center">
    <div class="col-lg-7 col-centered well">
      <form class="form-text" method="POST" action="ModificarDatos">
        <div class="row">
          <div class="col-sm-12">
            <div class="row">
              <div class="col-sm-6 form-group">
                <input type="text" name="usuario" id="usuario" placeholder="Usuario" class="form-control" disabled="true" value="<%=usrActual.getUsuario()%>">
              </div>	
              <div class="col-sm-6 form-group">
                <input type="email" name="email" id="email" placeholder="Email de contacto" title="Ingrese su email" class="form-control" autofocus="true" required="true" value="<%=usrActual.getEmail()%>">
              </div>
            </div>
            <div class="form-group">
              <input type="text" name="apenom" id="apenom" placeholder="Apellido y Nombre" title="Ingrese su apellido y nombre" class="form-control" autofocus="true" required="true" value="<%=usrActual.getApynom()%>">
            </div>			
            <div class="form-group">
              <input type="text" name="domicilio" id="domicilio" placeholder="Domicilio" title="Ingrese su Domicilio" class="form-control" autofocus="true" required="true" value="<%=usrActual.getDomicilio()%>">
            </div>
            <div class="form-group">
              <input type="text" name="documento" id="documento" placeholder="Documento de Identidad" title="Ingrese su documento de identidad" class="form-control" autofocus="true" required="true" value="<%=usrActual.getDocumento()%>">
            </div>
            <div class="form-group">
              <input type="text" name="telefono" id="telefono" placeholder="Teléfono de contacto" title="Ingrese un número de contacto" class="form-control" autofocus="true" required="true" value="<%=usrActual.getTelefono()%>">
            </div>
            <div class="row">
              <div class="col-sm-12">
                <p style="text-align: center">En caso de no querer modificar tu contraseña, <u><b>NO completes los siguientes campos</b></u>.</p>
              </div>
              <div class="password col-sm-6 form-group">
                <input type="password" name="pass" id="pass" placeholder="Contraseña" title="Ingrese una contraseña" class="form-control" autofocus="true" onchange="prueba()">
                <span id="ojopas" class="fa fa-eye" style="right: 23px"></span>
              </div>	
              <div class="password col-sm-6 form-group">
                <input type="password" id="repass" placeholder="Repita Contraseña" title="Repita contraseña" class="form-control" autofocus="true">
                <span id="ojore" class="fa fa-eye" style="right: 23px"></span>
              </div>
            </div>
            <button type="submit" id="enviar" class="col-lg-12 btn btn-lg btn-primary btn-block">Modificar datos</button>
          </div>              
        </div>
      </form>
    </div>
  </div>
  <br>
  <br>
  <% } else {
      response.sendRedirect("login.jsp");
    }%>
  <!-- Footer -->
  <%@include file="footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="js/registroNuevoUsr.js"></script>
  <script>
                  function prueba()
                  {
                    if ($('#pass').val() === '')
                    {
                      $("#enviar").removeAttr('disabled');
                      $('#repass').css("backgroundColor", "#ffffff");
                    }
                  }

                  $('#ojopas').
                          on('touchstart click', function () {
                            $("#pass").attr('type', 'text');
                          }).
                          on('touchend click', function () {
                            $("#pass").attr('type', 'password');
                          });

                  $('#ojore').
                          on('touchstart click', function () {
                            $("#repass").attr('type', 'text');
                          }).
                          on('touchend click', function () {
                            $("#repass").attr('type', 'password');
                          });
  </script>
</body>

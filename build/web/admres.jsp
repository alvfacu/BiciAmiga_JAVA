<%@page import="java.text.DecimalFormat,java.text.DateFormat,Entidades.*,Negocio.*,java.util.ArrayList"%>
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
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
  </head>

  <body>
    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->

    <%if (session.getAttribute("Usuario") != null) {
        Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
        if (usrActual.isAdm()) {%>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">administrador de reservas</span>
    </h1>

    <div class="col-lg-10 col-centered well">

      <button class="tablink2" onclick="openPage('reservas', this)" id="defaultOpen">Reservas Pendientes</button>
      <button class="tablink2" onclick="openPage('reservasf', this)">Reservas Finalizadas</button>

      <!-- RESERVAS PENDIENTES -->
      <div id="reservas" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" title="Nueva Reserva" data-toggle="modal" data-target="#new" onclick="nuevareserva()"><span class="fa fa-plus-square"></span></a></p>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="reservasact">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>
                <th>USUARIO</th>
                <th>FECHA INICIO</th>
                <th>FECHA FIN</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm");
                DecimalFormat df2 = new DecimalFormat("0.00");
                ArrayList<Reservas> reservas_activas = new ControladorReservas().getReservasPendientes();               
                if (reservas_activas.size() > 0) {
                  for (Reservas r : reservas_activas) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= "R"+String.format("%5s",r.getId()).replace(' ', '0') %></td>
                <td style="vertical-align:middle"><%= r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente() %></td>
                <td style="vertical-align:middle"><%= r.getCliente().getUsuario() %></td>          
                <td style="vertical-align:middle"><%= df.format(r.getFechaInicioP())%></td>
                <td style="vertical-align:middle"><%= df.format(r.getFechaFinP())%></td>
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" title="Completar" data-toggle="modal" data-target="#edit" 
                          onclick='window.open("modificarMantenimiento.jsp?idMant="+<%=r.getId()%>,"_self")'>
                    <span class="fa fa-check-square-o"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick='window.open("eliminarMantenimiento.jsp?idMant="+<%=r.getId()%>,"_self")'>
                    <span class="fa fa-trash-o"></span>
                  </button>
                </td>
              </tr>        
              <% }
                }%>
            </tbody>
          </table>
        </div>
      </div>

      <!-- RESERVAS FINALIZADAS -->
      <div id="reservasf" class="tabcontent">
        <div style="overflow-x:auto;">
          <table class="table display" id="reservasfin">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>
                <th>USUARIO</th>
                <th>FECHA INICIO</th>
                <th>FECHA FIN</th>
                <th>KM TOTALES</th>
                <th>ESTADO</th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <% ArrayList<Reservas> reservas_fin = new ControladorReservas().getReservasFinalizados();                 
                if (reservas_fin.size() > 0) {
                for (Reservas r : reservas_fin) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= "R"+String.format("%5s",r.getId()).replace(' ', '0') %></td>
                <td style="vertical-align:middle"><%= r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente() %></td>
                <td style="vertical-align:middle"><%= r.getCliente().getUsuario() %></td>          
                <td style="vertical-align:middle"><%= df.format(r.getFechaInicioP())%></td>
                <td style="vertical-align:middle"><%= df.format(r.getFechaFinR())%></td>
                <td style="vertical-align:middle"><%= df2.format(r.getKmRecorridos())%></td>
                <td style="vertical-align:middle"><%= EstadosReserva.getXId(r.getEstado().getId()) %></td>
                <td style="vertical-align:middle">
                  <button class="btn btn-reset" data-title="Editar" title="Ver Mantenimiento" data-toggle="modal" data-target="#edit" 
                          onclick='window.open("verMantenimiento.jsp?idMant="+<%=r.getId()%>,"_self")'>
                    <span class="fa fa-eye"></span>
                  </button>
                </td>
              </tr>        
              <% }
                }%>
            </tbody>
          </table>
        </div>
      </div>
            
    </div>

    <% } else {
          response.sendRedirect("error.jsp");
        }
      } else {
        response.sendRedirect("login.jsp");
      }%>

    <!-- Footer -->
    <%@include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>    
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>    
    <script src="js/abmres.js"></script>
  </body>

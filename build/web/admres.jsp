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

      <div style="overflow-x:auto;">
        <button class="tablink" onclick="openPage('pendientes', this)" id="defaultOpen">Pendientes</button>
        <button class="tablink" onclick="openPage('encurso', this)">En Curso</button>
        <button class="tablink" onclick="openPage('finalizadas', this)">Finalizadas</button>
      </div>
      
      <!-- RESERVAS PENDIENTES -->
      <div id="pendientes" class="tabcontent">
        <div align="right">
          <form method="POST" action="Reservar">
            <button type="submit" class="btn btn-nuevo" style="margin-bottom:0.5rem" title="Nueva Reserva"><span class="fa fa-plus-square"></span></button>
          </form>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="rpendientes">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>
                <th>USUARIO</th>
                <th>D.N.I.</th>
                <th>INICIO</th>
                <th>FIN</th>
                <th></th>
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
                <%String bicicleta = r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente();
                  String reserva = "R"+String.format("%5s",r.getId()).replace(' ', '0'); %>
                <td style="vertical-align:middle;font-size: 1rem;"><%=reserva %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%=bicicleta  %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= r.getCliente().getUsuario() %></td>   
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= r.getCliente().getDocumento() %></td>   
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaInicioP())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaFinP())%></td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-editar" title="Ver/Editar"
                          onclick="editarReserva('<%=r.getId()%>','<%=reserva%>', '<%=bicicleta%>', '<%=r.getBici().getModelo().getUrl1() %>', 
                                    '<%= r.getCliente().getUsuario() %>','<%= r.getCliente().getDocumento()%>', '<%= df.format(r.getFechaInicioP())%>', 
                                    '<%= df.format(r.getFechaFinP())%>','<%= df2.format(r.getImporte())%>')">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-nuevo" title="Iniciar" 
                          onclick="iniciarReserva('<%=r.getId()%>','<%=reserva%>', '<%=bicicleta%>', '<%=r.getBici().getModelo().getUrl1() %>', 
                                    '<%= r.getCliente().getUsuario() %>','<%= r.getCliente().getDocumento()%>', '<%= df.format(r.getFechaInicioP())%>', 
                                    '<%= df.format(r.getFechaFinP())%>','<%= df2.format(r.getImporte())%>')">
                    <span class="fa fa-play"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" title="Eliminar"
                          onclick="eliminarReserva('<%=r.getId()%>','<%=reserva%>', '<%=bicicleta%>', '<%=r.getBici().getModelo().getUrl1() %>', 
                                    '<%= r.getCliente().getUsuario() %>','<%= r.getCliente().getDocumento()%>', '<%= df.format(r.getFechaInicioP())%>', 
                                    '<%= df.format(r.getFechaFinP())%>','<%= df2.format(r.getImporte())%>')">
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
      
      <!-- RESERVAS EN CURSO -->
      <div id="encurso" class="tabcontent">
        <div style="overflow-x:auto;">
          <table class="table display" id="rencurso">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>
                <th>USUARIO</th>
                <th>INICIO</th>
                <th>FIN</th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <% ArrayList<Reservas> reservas_curso = new ControladorReservas().getReservasEnCurso();                 
                if (reservas_curso.size() > 0) {
                for (Reservas r : reservas_curso) {%>
              <tr align="center" >
                <td style="vertical-align:middle;font-size: 1rem;"><%= "R"+String.format("%5s",r.getId()).replace(' ', '0') %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente() %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= r.getCliente().getUsuario() %></td>          
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaInicioP())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaFinP())%></td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-reset" title="Ver">                          
                    <span class="fa fa-eye"></span>
                  </button>
                </td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-mecanico" title="Finalizar por fallas">                          
                    <span class="fa fa-exclamation-triangle"></span>
                  </button>
                </td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-detener" title="Finalizar">                          
                    <span class="fa fa-stop"></span>
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
      <div id="finalizadas" class="tabcontent">
        <div style="overflow-x:auto;">
          <table class="table display" id="rfinalizadas">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>
                <th>USUARIO</th>
                <th>INICIO</th>
                <th>FIN</th>
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
                <td style="vertical-align:middle;font-size: 1rem;"><%= "R"+String.format("%5s",r.getId()).replace(' ', '0') %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente() %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= r.getCliente().getUsuario() %></td>          
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaInicioP())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaFinR())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df2.format(r.getKmRecorridos())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;">
                  <span
                    <% if(r.getEstado()==EstadosReserva.FINALIZADA) { %>
                    class="label label-success"
                    <% } else if(r.getEstado()==EstadosReserva.CANCELADA) { %>
                    class="label label-danger"
                    <% } else if(r.getEstado()==EstadosReserva.ELIMINADA) { %>
                    class="label label-danger"
                    <% } else if(r.getEstado()==EstadosReserva.FALLAS) { %>
                    class="label label-mecanico"
                    <% } else { %>
                    class="label label-desconocido"
                    <% } %>><%=r.getEstado()%>
                  </span>
                </td>
                <td style="vertical-align:middle;font-size: 0.8rem;">
                  <button class="btn btn-reset" title="Ver">
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
    
    <!-- VER RESERVA -->
    <div class="container text-center" id="reserva" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzInicioR" class="fa fa-close" style="right: 50px"></span>
              </div>              
              <div class="form-group">
                <img id="imgbici" name="imgbici" src="img/imagen-vacia.jpg" width="200" height="200" style="border-style: solid; border-width: 1px;">
              </div>
              <div class="row" style="margin-top:1px;">
                <div class="col-sm-4 form-group">
                  <label class="error" id="msj3" style="display: none"></label>
                  <input type="hidden" name="idb" id="idb">
                  <input type="text" class="form-control" disabled="true" name="tipob" id="tipob" placeholder="Tipo de Bicicleta" title="Tipo de Bicicleta" required="false">
                </div>	
                <div class="col-sm-4 form-group">
                  <select class="form-control" name="modelobici" id="modelobici" placeholder="Modelo de Bicicleta" title="Modelo de Bicicleta" required="true" onchange="dameImagen()" autofocus="true">
                    <option value="" disabled selected>Modelo Bicicleta</option>
                    <% for (Modelos m : new ControladorBicicletas().getModelos()) {%>                    
                    <option value="<%= m.getId()%>"><%= m.getNombre()%></option>
                    <%}%>
                  </select>
                </div>
                <div class="col-sm-4 form-group">
                  <input type="hidden" name="disponible" id="disponible" value="true">
                  <span id="disponibleS" name="disponibleS" class="form-control label label-disponibilidad label-success" >DISPONIBLE</span>
                  <span id="disponibleN" name="disponibleN" class="form-control label label-disponibilidad label-danger" style="display:none">NO DISPONIBLE</span>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-4 form-group">
                  <input type="text" name="patente" maxlength="10" id="patente" style="text-transform:uppercase" placeholder="Patente Bicicleta" title="Patente Bicicleta" class="form-control" autofocus="true" required="true">                  
                </div>
                <div class="col-sm-4 form-group">
                  <input type="number" step="any" name="kmMantenimiento" id="kmMantenimiento" placeholder="Kms desde el últ mantenimiento" title="Kms desde el último mantenimiento" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-4 form-group">
                  <input type="number" step="any" name="kmViajados" id="kmViajados" placeholder="Kms totales" title="Kms totales recorridos" class="form-control" autofocus="true" required="true">
                </div>
              </div>
              <div class="form-group">
                <textarea name="descripb" id="descripb" maxlength="250" placeholder="Comentarios/Referencias sobre la Bicicleta" title="Comentarios/Referencias sobre la Bicicleta"  class="form-control" autofocus="true" required="true"></textarea>
              </div>
              <input type="submit" id="iniciar" class="btn btn-lg btn-nuevo btn-block" value="Iniciar" onclick="javascript:form.action = 'IniciarReserva';">              
              <input type="submit" id="editar" class="btn btn-lg btn-editar btn-block" style="display: none" value="Editar" onclick="javascript:form.action = 'ModificarReserva';">
              <input type="submit" id="eliminar" class="btn btn-lg btn-eliminar btn-block" style="display: none" value="Eliminar" onclick="javascript:form.action = 'EliminarReserva';">           
            </div>              
          </div>
        </div>         
      </form>
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

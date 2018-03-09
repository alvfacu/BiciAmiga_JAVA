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
        if (usrActual.isMecanico()) {%>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">administrador de mantenimientos</span>
    </h1>

    <div class="col-lg-10 col-centered well">

      <button class="tablink" onclick="openPage('mants', this)" id="defaultOpen">Mantenimientos Activos</button>
      <button class="tablink" onclick="openPage('mantsfin', this)" >Mantenimientos Finalizados</button>
      <button class="tablink" onclick="openPage('tipos', this)">Tipos Mantenimientos</button>

      <!-- MANTENIMIENTOS ACTIVOS -->
      <div id="mants" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevomantenimiento()"><span class="fa fa-plus-square"></span></a></p>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="mantenimientos">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>BICICLETA</th>
                <th>INGRESO</th>
                <th>KMs INGRESO</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm");
                DecimalFormat df2 = new DecimalFormat("0.00");
                ArrayList<Mantenimientos> mant_activos = new ControladorMantenimientos().getMantenimientosActivos();                
                if (mant_activos.size() > 0) {
                  for (Mantenimientos m : mant_activos) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= m.getBici().getModelo().getTipo().getNombre()+" - "+m.getBici().getModelo().getNombre()+" - "+m.getBici().getPatente() %></td>
                <td style="vertical-align:middle"><%= df.format(m.getFechaIngreso()) %></td>          
                <td style="vertical-align:middle"><%= df2.format(m.getKmIngreso())%></td>
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick='window.open("modificarMantenimiento.jsp?idMant="+<%=m.getId()%>,"_self")'>
                    <span class="fa fa-gears"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick='window.open("modificarMantenimiento.jsp?idMant="+<%=m.getId()%>,"_self")'>
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

      <!-- MANTENIMIENTOS FINALIZADOS -->
      <div id="mantsfin" class="tabcontent">
        <div style="overflow-x:auto;">
          <table class="table display" id="mantenimientosfin">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>BICICLETA</th>
                <th>INGRESO</th>
                <th>KMs INGRESO</th>
                <th>EGRESO</th>
                <th>KMs EGRESO</th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <% ArrayList<Mantenimientos> mant_finalizados = new ControladorMantenimientos().getMantenimientosFinalizados();                 
                if (mant_finalizados.size() > 0) {
                for (Mantenimientos m : mant_finalizados) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= m.getBici().getModelo().getTipo().getNombre()+" - "+m.getBici().getModelo().getNombre()+" - "+m.getBici().getPatente() %></td>
                <td style="vertical-align:middle"><%= df.format(m.getFechaIngreso()) %></td>          
                <td style="vertical-align:middle"><%= df2.format(m.getKmIngreso())%></td>
                <td style="vertical-align:middle"><%= df.format(m.getFechaEgreso()) %></td>          
                <td style="vertical-align:middle"><%= df2.format(m.getKmEgreso())%></td>
                <td style="vertical-align:middle">
                  <button class="btn btn-reset" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="window.open('modificarMantenimiento.jsp?idMant='<%=m.getId()%>,'_self')">
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
            
      <!-- TIPOS MANTENIMIENTOS -->
      <div id="tipos" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevotipo()"><span class="fa fa-plus-square"></span></a></p>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="tipos_mant">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>NOMBRE</th>
                <th>OBLIGATORIO</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <% ArrayList<TiposMantenimiento> tipos = new ControladorMantenimientos().getTiposMantenimientos();
                if (tipos.size() > 0) {
                  for (TiposMantenimiento tipo : tipos) {%>
              <tr align="center" >
                <td style="vertical-align:middle" title="<%=tipo.getDescripcion() %>"><%= tipo.getNombre()%></td>
                <td style="vertical-align:middle">
                  <% if (tipo.isObligatorio()) {%>
                  <span class="label label-success">SI</span>
                  <% } else { %>
                  <span class="label label-danger">NO</span>
                  <% }%>
                </td>  
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="editartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%=tipo.getDescripcion()%>', '<%=tipo.isObligatorio()%>', '<%= df2.format(tipo.getKmParaMantenimiento())%>')">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick="eliminartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%=tipo.getDescripcion()%>', '<%=tipo.isObligatorio()%>', '<%= df2.format(tipo.getKmParaMantenimiento())%>')">
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
    </div>

    <!-- TIPOS MANTENIMIENTOS -->
    <div class="container text-center" id="nuevotipo" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzNuevoTM" class="fa fa-close" style="right: 50px"></span>
              </div>
              <div class="form-group">
                <label class="error" id="msj1" style="display: none"></label>
                <input type="hidden" name="idtm" id="idtm">
                <input name="nombretm" id="nombretm" maxlength="50" placeholder="Nombre del Tipo de Mantenimiento" title="Nombre del Tipo de Mantenimiento"  class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <textarea name="descriptm" id="descriptm" maxlength="350" placeholder="Descripcion del Tipo de Mantenimiento" title="Descripcion del Tipo de Mantenimiento"  class="form-control" autofocus="true" required="true" style="min-height: 150px;"></textarea>
              </div>
              <div class="row">
                <div class="col-sm-4 form-group">
                  <select class="form-control" name="obligatorio" id="obligatorio" title="�Obligatorio?" onchange="habilitarKM()">
                    <option value="" disabled selected>�Obligatorio?</option>
                    <option value="true" selected="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>	
                <div class="col-sm-8 form-group">
                  <input type="number" step="any" name="km" id="km" placeholder="Kms m�nimos" title="Kms m�nimos para realizar el matenimiento" class="form-control" autofocus="true" disabled="true">
                </div>
              </div>
              <input type="submit" id="guardartm" class="btn btn-lg btn-nuevo btn-block" value="Guardar" onclick="javascript:form.action = 'AltaTipoMantenimiento';">
              <input type="submit" id="editartm" class="btn btn-lg btn-editar btn-block" style="display: none" value="Modificar" onclick="javascript:form.action = 'ModificarTipoMantenimiento';">
              <input type="submit" id="eliminartm" class="btn btn-lg btn-eliminar btn-block" style="display: none" value="Eliminar" onclick="javascript:form.action = 'EliminarTipoMantenimiento';">
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- MANTENIMIENTO ACTIVOS-->
    <div class="container text-center" id="nuevomantenimiento" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <input type="submit" id="guardarb" class="btn btn-lg btn-nuevo btn-block" value="Guardar" onclick="javascript:form.action = 'AltaMantenimiento';">
              <input type="submit" id="editarb" class="btn btn-lg btn-editar btn-block" style="display: none" value="Modificar" onclick="javascript:form.action = 'ModificarBicicleta';">
              <input type="submit" id="eliminarb" class="btn btn-lg btn-eliminar btn-block" style="display: none" value="Eliminar" onclick="javascript:form.action = 'EliminarBicicleta';">
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
    
    <script src="js/abmmant.js"></script>
  </body>

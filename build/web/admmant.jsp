<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat,Entidades.*,Negocio.*"%>
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

      <button class="tablink2" onclick="openPage('mants', this)" id="defaultOpen">Mantenimientos</button>
      <button class="tablink2" onclick="openPage('tipos', this)">Tipos Mantenimientos</button>

      <!-- MANTENIMIENTOS -->
      <div id="mants" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevomantenimiento()"><span class="fa fa-plus-square"></span></a></p>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="mantenimientos">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>BICICLETA</th>
                <th>MANTENIMIENTO</th>
                <th>INGRESO</th>
                <th>KM INGRESO</th>
                <th>EGRESO</th>
                <th>KM EGRESO</th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <%DecimalFormat df2 = new DecimalFormat("0.00");
                ArrayList<Mantenimientos> mantenimientos = new ControladorMantenimientos().getMantenimientos();
                if (mantenimientos.size() > 0) {
                  for (Mantenimientos m : mantenimientos) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= m.getBici().getPatente() %></td>
                <td style="vertical-align:middle"><%= m.getTipo().getNombre() %></td>
                <td style="vertical-align:middle"><%= m.getFechaIngreso() %></td>          
                <td style="vertical-align:middle"><%= df2.format(m.getKmIngreso())%></td>
                <td style="vertical-align:middle"><%= m.getFechaEgreso()%></td>
                <td style="vertical-align:middle"><%= df2.format(m.getKmEgreso())%></td>
                <td style="vertical-align:middle">
                  <% if(!(m.getObservacion().isEmpty())) { %>
                  *
                  <% } %>
                </td>               
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick="">
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

      <!-- TIPOS -->
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
                <td style="vertical-align:middle"><%= tipo.getNombre()%></td>
                <td style="vertical-align:middle">
                  <% if (tipo.isObligatorio()) {%>
                  <span class="label label-success">SI</span>
                  <% } else { %>
                  <span class="label label-danger">NO</span>
                  <% }%>
                </td>  
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="editartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%=tipo.getDescripcion()%>', '<%=tipo.isObligatorio()%>', '<%=tipo.getKmParaMantenimiento()%>')">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick="eliminartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%=tipo.getDescripcion()%>', '<%=tipo.isObligatorio()%>', '<%=tipo.getKmParaMantenimiento()%>')">
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

    <!-- TIPO MANTENIMIENTO -->
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
                <textarea name="descriptm" id="descriptm" maxlength="250" placeholder="Descripcion del Tipo de Mantenimiento" title="Descripcion del Tipo de Mantenimiento"  class="form-control" autofocus="true" required="true"></textarea>
              </div>
              <div class="row">
                <div class="col-sm-4 form-group">
                  <select class="form-control" name="obligatorio" id="obligatorio" title="¿Obligatorio?">
                    <option disabled selected>¿Obligatorio?</option>
                    <option value="true" selected="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>	
                <div class="col-sm-8 form-group">
                  <input type="number" step="any" name="km" id="km" placeholder="Kms necesarios" title="Kms necesarios para realizar el matenimiento" class="form-control" autofocus="true" required="true">
                </div>
              </div>
              <input type="submit" id="guardartm" class="btn btn-lg btn-nuevo btn-block" value="Guardar" onclick="javascript:form.action = 'AltaTipoMantenimento';">
              <input type="submit" id="editartm" class="btn btn-lg btn-editar btn-block" style="display: none" value="Modificar" onclick="javascript:form.action = 'ModificarTipoMantenimento';">
              <input type="submit" id="eliminartm" class="btn btn-lg btn-eliminar btn-block" style="display: none" value="Eliminar" onclick="javascript:form.action = 'EliminarTipoMantenimento';">
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- MANTENIMIENTO -->
    <div class="container text-center" id="nuevomantenimiento" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzNuevoM" class="fa fa-close" style="right: 50px"></span>
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
              <input type="submit" id="guardarb" class="btn btn-lg btn-nuevo btn-block" value="Guardar" onclick="javascript:form.action = 'AltaBicicleta';">
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
    <script src="js/abmmant.js"></script>
  </body>

</html>
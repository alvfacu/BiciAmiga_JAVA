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
        if (usrActual.isAdm()) {%>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">administrador de bicicletas</span>
    </h1>

    <div class="col-lg-10 col-centered well">

      <button class="tablink" onclick="openPage('bicis', this)" id="defaultOpen">Bicicletas</button>
      <button class="tablink" onclick="openPage('modelosbici', this)">Modelos Bicicletas</button>
      <button class="tablink" onclick="openPage('tipos', this)">Tipos Bicicletas</button>

      <!-- BICICLETA -->
      <div id="bicis" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevabici()"><span class="fa fa-plus-square"></span></a></p>
        </div>

        <div style="overflow-x:auto;">
          <table class="table display" id="bicicletas">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>TIPO</th>
                <th>MODELO</th>
                <th>PATENTE</th>            
                <th>KM MANT</th>
                <th>KM ACUM</th>
                <th>DISPONIBLE</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <%DecimalFormat df2 = new DecimalFormat("0.00");
                ArrayList<Bicicletas> bicicletas = new ControladorBicicletas().getBicicletas();
                if (bicicletas.size() > 0) {
                  for (Bicicletas b : bicicletas) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= b.getModelo().getTipo().getNombre()%></td>
                <td style="vertical-align:middle"><%= b.getModelo().getNombre()%></td>
                <td style="vertical-align:middle"><%= b.getPatente()%></td>          
                <td style="vertical-align:middle"><%= df2.format(b.getKmDsdMantenimiento())%></td>
                <td style="vertical-align:middle"><%= df2.format(b.getKmEnViaje())%></td>
                <td style="vertical-align:middle">
                  <% if (b.isDisponible()) {%>
                  <span class="label label-success">SI</span>
                  <% } else { %>
                  <span class="label label-danger">NO</span>
                  <% }%>
                </td>                
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="editarbici('<%= b.getId()%>', '<%= b.getPatente()%>', '<%= b.getModelo().getId()%>', '<%= b.getModelo().getTipo().getNombre()%>', '<%= b.getDescripcion()%>', '<%= b.isDisponible()%>', '<%= df2.format(b.getKmDsdMantenimiento())%>', '<%= df2.format(b.getKmEnViaje())%>', '<%= b.getModelo().getUrl1()%>')">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick="eliminarbici('<%= b.getId()%>', '<%= b.getPatente()%>', '<%= b.getModelo().getId()%>', '<%= b.getModelo().getTipo().getNombre()%>', '<%= b.getDescripcion()%>', '<%= b.isDisponible()%>', '<%= df2.format(b.getKmDsdMantenimiento())%>', '<%= df2.format(b.getKmEnViaje())%>', '<%= b.getModelo().getUrl1()%>')">
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

      <!-- MODELOS BICICLETA -->
      <div id="modelosbici" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevomodelo()"><span class="fa fa-plus-square"></span></a></p>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="modelos">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>TIPO</th>
                <th>NOMBRE</th>
                <th>PRECIO X HORA</th>
                <th>PRECIO X DÍA</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <% ArrayList<Modelos> modelos = new ControladorBicicletas().getModelos();
                if (modelos.size() > 0) {
                  for (Modelos modelo : modelos) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= modelo.getTipo().getNombre()%></td>
                <td style="vertical-align:middle"><%= modelo.getNombre()%></td>
                <td style="vertical-align:middle">$ <%= df2.format(modelo.getPrecioXHr())%></td>
                <td style="vertical-align:middle">$ <%= df2.format(modelo.getPrecioXDia())%></td>
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="editarmodelo('<%= modelo.getId()%>', '<%=modelo.getTipo().getId()%>', '<%=modelo.getNombre()%>', '<%=modelo.getCaracteristicas_gral()%>', '<%= df2.format(modelo.getPrecioXHr())%>', '<%= df2.format(modelo.getPrecioXDia())%>', '<%= modelo.getUrl1()%>', '<%= modelo.getUrl2()%>', '<%= modelo.getUrl3()%>')">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick="eliminarmodelo('<%= modelo.getId()%>', '<%=modelo.getTipo().getId()%>', '<%=modelo.getNombre()%>', '<%=modelo.getCaracteristicas_gral()%>', '<%= df2.format(modelo.getPrecioXHr())%>', '<%= df2.format(modelo.getPrecioXDia())%>', '<%= modelo.getUrl1()%>', '<%= modelo.getUrl2()%>', '<%= modelo.getUrl3()%>')">
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

      <!-- TIPO BICICLETA -->
      <div id="tipos" class="tabcontent">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevotipo()"><span class="fa fa-plus-square"></span></a></p>
        </div>
        <div style="overflow-x:auto;">
          <table class="table display" id="tiposbici">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>NOMBRE</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <% ArrayList<TiposBicicleta> tipos = new ControladorBicicletas().getTiposBicicleta();
                if (tipos.size() > 0) {
                  for (TiposBicicleta tipo : tipos) {%>
              <tr align="center" >
                <td style="vertical-align:middle"><%= tipo.getNombre()%></td>
                <td style="vertical-align:middle">
                  <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                          onclick="editartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%=tipo.getDescripcion()%>')">
                    <span class="fa fa-edit"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                          onclick="eliminartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%=tipo.getDescripcion()%>')">
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

    <!-- TIPO BICICLETA -->
    <div class="container text-center" id="nuevotipo" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzNuevoTB" class="fa fa-close" style="right: 50px"></span>
              </div>
              <div class="form-group">
                <label class="error" id="msj1" style="display: none"></label>
                <input type="hidden" name="idtb" id="idtb">
                <input name="nombretb" id="nombretb" maxlength="50" placeholder="Nombre del Tipo de Bicicleta" title="Nombre del Tipo de Bicicleta"  class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <textarea name="descriptb" id="descriptb" maxlength="250" placeholder="Descripcion del Tipo de Bicicleta" title="Descripcion del Tipo de Bicicleta"  class="form-control" autofocus="true" required="true"></textarea>
              </div>
              <input type="submit" id="guardartb" class="btn btn-lg btn-nuevo btn-block" value="Guardar" onclick="javascript:form.action = 'AltaTipoBici';">
              <input type="submit" id="editartb" class="btn btn-lg btn-editar btn-block" style="display: none" value="Modificar" onclick="javascript:form.action = 'ModificarTipoBici';">
              <input type="submit" id="eliminartb" class="btn btn-lg btn-eliminar btn-block" style="display: none" value="Eliminar" onclick="javascript:form.action = 'EliminarTipoBici';">
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- MODELO BICICLETA -->
    <div class="container text-center" id="nuevomodelo" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzNuevoM" class="fa fa-close" style="right: 50px"></span>
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <label class="error" id="msj2" style="display: none"></label>
                  <input type="hidden" name="idm" id="idm">
                  <select class="form-control" name="clr" id="clr" placeholder="Tipo de Bicicleta" title="Tipo de Bicicleta" required="true">
                    <option value="" disabled selected>Tipo de Bicicleta</option>
                    <% for (TiposBicicleta t : tipos) {%>                    
                    <option value="<%=t.getId()%>"><%=t.getNombre()%></option>
                    <%}%>
                  </select>
                </div>	
                <div class="col-sm-6 form-group">
                  <input name="nombrem" id="nombrem" maxlength="50" placeholder="Nombre del Modelo/Marca" title="Nombre del Modelo/Marca"  class="form-control" autofocus="true" required="true">
                </div>
              </div>
              <div class="form-group">
                <textarea name="descripm" id="descripm" maxlength="250" placeholder="Caracteristicas generales del Modelo" title="Caracteristicas generales del Modelo"  class="form-control" autofocus="true" required="true"></textarea>
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="precioHr" id="precioHr" placeholder="Precio x Hora" title="Precio x Hora" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="precioDia" id="precioDia" placeholder="Precio x Día" title="Precio x Día" class="form-control" autofocus="true" required="true">
                </div>
              </div>
              <div class="form-group">
                <button class="btn" type="button" style="float: right" onclick="window.open(document.getElementById('url1').value, '_blank');">
                  <i class="fa fa-eye"></i>
                </button>
                <div style="overflow: hidden; padding-right: .5em;">
                  <input type="url" class="form-control" name="url1" id="url1" placeholder="Link de la imagen del Modelo de la Bicicleta (PRINCIPAL)" title="Link de la imagen del Modelo de la Bicicleta (PRINCIPAL)"  class="form-control" autofocus="true" required="true" style="width: 100%;" />
                </div>
              </div>
              <div class="form-group">
                <button class="btn" type="button" style="float: right" onclick="window.open(document.getElementById('url2').value, '_blank');">
                  <i class="fa fa-eye"></i>
                </button>
                <div style="overflow: hidden; padding-right: .5em;">
                  <input type="url" class="form-control" name="url2" id="url2" placeholder="Link de la imagen del Modelo de la Bicicleta" title="Link de la imagen del Modelo de la Bicicleta"  class="form-control" autofocus="true" style="width: 100%;" />
                </div>
              </div>
              <div class="form-group">
                <button class="btn" type="button" style="float: right" onclick="window.open(document.getElementById('url3').value, '_blank');">
                  <i class="fa fa-eye"></i>
                </button>
                <div style="overflow: hidden; padding-right: .5em;">
                  <input type="url" class="form-control" name="url3" id="url3" placeholder="Link de la imagen del Modelo de la Bicicleta" title="Link de la imagen del Modelo de la Bicicleta"  class="form-control" autofocus="true" style="width: 100%;" />
                </div>
              </div>
              <input type="submit" id="guardarm" class="btn btn-lg btn-nuevo btn-block" value="Guardar" onclick="javascript:form.action = 'AltaModelo';">
              <input type="submit" id="editarm" class="btn btn-lg btn-editar btn-block" style="display: none" value="Modificar" onclick="javascript:form.action = 'ModificarModelo';">
              <input type="submit" id="eliminarm" class="btn btn-lg btn-eliminar btn-block" style="display: none" value="Eliminar" onclick="javascript:form.action = 'EliminarModelo';">
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- BICICLETA -->
    <div class="container text-center" id="nuevabici" style="display: none" enctype = "multipart/form-data">
      <form class="form-text" method="POST">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzNuevoB" class="fa fa-close" style="right: 50px"></span>
              </div>              
              <div class="form-group">
                <img id="imgbici" name="imgbici" src="img/imagen-vacia.jpg" width="200" height="200" style="border-style: solid; border-width: 1px;">
              </div>
              <div class="row" style="margin-top:1px;">
                <div class="col-sm-6 form-group">
                  <label class="error" id="msj3" style="display: none"></label>
                  <input type="hidden" name="idb" id="idb">
                  <input type="text" class="form-control" disabled="true" name="tipob" id="tipob" placeholder="Tipo de Bicicleta" title="Tipo de Bicicleta" required="false">
                </div>	
                <div class="col-sm-6 form-group">
                  <select class="form-control" name="modelobici" id="modelobici" placeholder="Modelo de Bicicleta" title="Modelo de Bicicleta" required="true" onchange="dameImagen()" autofocus="true">
                    <option value="" disabled selected>Modelo Bicicleta</option>
                    <% for (Modelos m : new ControladorBicicletas().getModelos()) {%>                    
                    <option value="<%= m.getId()%>"><%= m.getNombre()%></option>
                    <%}%>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="text" name="patente" maxlength="10" id="patente" style="text-transform:uppercase" placeholder="Patente Bicicleta" title="Patente Bicicleta" class="form-control" autofocus="true" required="true">                  
                </div>
                <div class="col-sm-6 form-group">
                  <select class="form-control" name="disponible" id="disponible" title="¿Bicicleta disponible?">
                    <option value="" disabled selected>Disponibilidad</option>
                    <option value="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>	
              </div>
              <div class="form-group">
                <textarea name="descripb" id="descripb" maxlength="250" placeholder="Comentarios/Referencias sobre la Bicicleta" title="Comentarios/Referencias sobre la Bicicleta"  class="form-control" autofocus="true" required="true"></textarea>
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="kmMantenimiento" id="kmMantenimiento" placeholder="Kms desde el últ mantenimiento" title="Kms desde el últ mantenimiento" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="kmViajados" id="kmViajados" placeholder="Kms totales" title="Kms totales" class="form-control" autofocus="true" required="true">
                </div>
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
    <script src="js/existePatente.js"></script>
    <script>

                var abmtb = '';
                var abmm = '';
                var abmb = '';

                $(document).ready(function () {
                  $('#tiposbici').DataTable({
                    "language": {
                      "decimal": ",",
                      "search": "Buscar ",
                      "emptyTable": "No se encontraron registros",
                      "lengthMenu": "Registros por página _MENU_",
                      "zeroRecords": "No se encontraron registros",
                      "info": " _PAGE_ de _PAGES_ ",
                      "infoEmpty": "",
                      "infoFiltered": " (Filtrados de un total de _MAX_ registros)",
                      "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"}
                    },
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                    "pagingType": "simple_numbers",
                    "columns": [
                      null,
                      {"orderable": false},
                      {"orderable": false}
                    ]
                  });

                  $('#bicicletas').DataTable({
                    "language": {
                      "decimal": ",",
                      "search": "Buscar ",
                      "emptyTable": "No se encontraron registros",
                      "lengthMenu": "Registros por página _MENU_",
                      "zeroRecords": "No se encontraron registros",
                      "info": " _PAGE_ de _PAGES_ ",
                      "infoEmpty": "",
                      "infoFiltered": " (Filtrados de un total de _MAX_ registros)",
                      "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"}
                    },
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                    "pagingType": "simple_numbers",
                    "columns": [
                      null,
                      null,
                      null,
                      null,
                      null,
                      null,
                      {"orderable": false},
                      {"orderable": false}
                    ]
                  });

                  $('#modelos').DataTable({
                    "language": {
                      "decimal": ",",
                      "search": "Buscar ",
                      "emptyTable": "No se encontraron registros",
                      "lengthMenu": "Registros por página _MENU_",
                      "zeroRecords": "No se encontraron registros",
                      "info": " _PAGE_ de _PAGES_ ",
                      "infoEmpty": "",
                      "infoFiltered": " (Filtrados de un total de _MAX_ registros)",
                      "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"}
                    },
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                    "pagingType": "simple_numbers",
                    "columns": [
                      null,
                      null,
                      null,
                      null,
                      {"orderable": false},
                      {"orderable": false}
                    ]
                  });
                });

                function openPage(pageName, elmnt) {
                  var i;
                  var badColor = "#e6a756";
                  abmtb = '';
                  abmm = '';
                  abmb = '';

                  var x = document.getElementById("nuevomodelo");
                  x.style.display = "none";
                  x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";

                  tabcontent = document.getElementsByClassName("tabcontent");
                  for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                  }
                  tablinks = document.getElementsByClassName("tablink");
                  for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].style.backgroundColor = "";
                  }
                  document.getElementById(pageName).style.display = "block";
                  elmnt.style.backgroundColor = badColor;
                }

                // Get the element with id="defaultOpen" and click on it
                document.getElementById("defaultOpen").click();

                function nuevotipo() {
                  var x = document.getElementById("nuevomodelo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";

                  document.getElementById('editartb').style.display = "none";
                  document.getElementById('eliminartb').style.display = "none";
                  document.getElementById('guardartb').style.display = "block";
                  document.getElementById('nombretb').disabled = false;
                  document.getElementById('descriptb').disabled = false;
                  document.getElementById('nombretb').value = '';
                  document.getElementById('descriptb').value = '';
                  document.getElementById('idtb').value = '';
                  document.getElementById('msj1').style.display = "none";

                  x = document.getElementById("nuevotipo");
                  if (abmtb !== 'A') {
                    x.style.display = "block";
                    abmtb = 'A';
                    document.getElementById('nombretb').focus();
                  } else {
                    x.style.display = "none";
                    abmtb = '';
                  }
                }

                function editartipo(id, nombre, descrip) {
                  var x = document.getElementById("nuevomodelo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";

                  document.getElementById('msj1').style.display = "none";
                  document.getElementById('nombretb').disabled = false;
                  document.getElementById('descriptb').disabled = false;
                  document.getElementById('guardartb').style.display = "none";
                  document.getElementById('editartb').style.display = "block";
                  document.getElementById('eliminartb').style.display = "none";

                  x = document.getElementById("nuevotipo");
                  if (abmtb !== 'M' || document.getElementById('idtb').value !== id) {
                    //abre form
                    abmtb = 'M';
                    x.style.display = "block";
                    document.getElementById('idtb').value = id;
                    document.getElementById('nombretb').value = nombre;
                    document.getElementById('descriptb').value = descrip;
                    document.getElementById('nombretb').focus();
                  } else {
                    //cerrar form
                    abmtb = '';
                    x.style.display = "none";
                    document.getElementById('idtb').value = '';
                    document.getElementById('nombretb').value = '';
                    document.getElementById('descriptb').value = '';
                  }
                }

                function eliminartipo(id, nombre, descrip) {
                  var x = document.getElementById("nuevomodelo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";
                  x = document.getElementById("nuevotipo");
                  document.getElementById('guardartb').style.display = "none";
                  document.getElementById('editartb').style.display = "none";
                  document.getElementById('eliminartb').style.display = "block";

                  if (abmtb !== 'B' || document.getElementById('idtb').value !== id) {
                    //abre form
                    x.style.display = "block";
                    abmtb = 'B';
                    document.getElementById('idtb').value = id;
                    document.getElementById('nombretb').value = nombre;
                    document.getElementById('descriptb').value = descrip;
                    document.getElementById('nombretb').disabled = true;
                    document.getElementById('descriptb').disabled = true;
                    document.getElementById('eliminartb').focus();
                  } else {
                    //cerrar form
                    x.style.display = "none";
                    abmtb = '';
                    document.getElementById('idtb').value = '';
                    document.getElementById('nombretb').value = '';
                    document.getElementById('descriptb').value = '';
                    document.getElementById('nombretb').disabled = false;
                    document.getElementById('descriptb').disabled = false;
                  }
                  $.post('ExistenModelosXTipo',
                          {
                            id: $('#idtb').val()
                          },
                          function (responseText)
                          {
                            //VALIDO
                            if (responseText === "0")
                            {
                              document.getElementById('msj1').style.display = "none";
                            }
                            //INVALIDO
                            else
                            {
                              document.getElementById('msj1').style.display = "block";
                              document.getElementById('msj1').innerHTML = "<b>¡ATENCIÓN!</b> Existen modelos de bicicletas registradas para este tipo.<br>Al eliminarlo, se eliminarán automaticamente todos los modelos de este tipo.";
                            }
                          });
                }

                function nuevomodelo() {
                  var x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";

                  document.getElementById('msj2').style.display = "none";
                  document.getElementById('editarm').style.display = "none";
                  document.getElementById('eliminarm').style.display = "none";
                  document.getElementById('guardarm').style.display = "block";
                  document.getElementById('clr').disabled = false;
                  document.getElementById('nombrem').disabled = false;
                  document.getElementById('descripm').disabled = false;
                  document.getElementById('precioHr').disabled = false;
                  document.getElementById('precioDia').disabled = false;
                  document.getElementById('url1').disabled = false;
                  document.getElementById('url2').disabled = false;
                  document.getElementById('url3').disabled = false;
                  document.getElementById('clr').value = '';
                  document.getElementById('nombrem').value = '';
                  document.getElementById('descripm').value = '';
                  document.getElementById('precioHr').value = '';
                  document.getElementById('precioDia').value = '';
                  document.getElementById('url1').value = '';
                  document.getElementById('url2').value = '';
                  document.getElementById('url3').value = '';

                  x = document.getElementById("nuevomodelo");
                  if (abmm !== 'A') {
                    x.style.display = "block";
                    abmm = 'A';
                    document.getElementById('clr').focus();
                  } else {
                    x.style.display = "none";
                    abmm = '';
                  }
                }

                function editarmodelo(id, idTipo, nombre, caract, preciohr, preciodia, url1, url2, url3) {
                  var x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";

                  document.getElementById('msj2').style.display = "none";
                  document.getElementById('clr').disabled = false;
                  document.getElementById('nombrem').disabled = false;
                  document.getElementById('descripm').disabled = false;
                  document.getElementById('precioHr').disabled = false;
                  document.getElementById('precioDia').disabled = false;
                  document.getElementById('url1').disabled = false;
                  document.getElementById('url2').disabled = false;
                  document.getElementById('url3').disabled = false;
                  document.getElementById('guardarm').style.display = "none";
                  document.getElementById('editarm').style.display = "block";
                  document.getElementById('eliminarm').style.display = "none";

                  x = document.getElementById("nuevomodelo");
                  if (abmm !== 'M' || document.getElementById('idm').value !== id) {
                    //abre form
                    abmm = 'M';

                    x.style.display = "block";
                    document.getElementById('idm').value = id;
                    document.getElementById('clr').value = idTipo;
                    document.getElementById('nombrem').value = nombre;
                    document.getElementById('descripm').value = caract;
                    document.getElementById('precioHr').value = parseFloat(preciohr.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('precioDia').value = parseFloat(preciodia.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('url1').value = url1;
                    document.getElementById('url2').value = url2;
                    document.getElementById('url3').value = url3;
                    document.getElementById('clr').focus();
                  } else {
                    //cerrar form
                    abmm = '';
                    x.style.display = "none";
                    document.getElementById('idm').value = '';
                    document.getElementById('clr').value = '';
                    document.getElementById('nombrem').value = '';
                    document.getElementById('descripm').value = '';
                    document.getElementById('precioHr').value = '';
                    document.getElementById('precioDia').value = '';
                    document.getElementById('url1').value = '';
                    document.getElementById('url2').value = '';
                    document.getElementById('url3').value = '';
                  }
                }

                function eliminarmodelo(id, idTipo, nombre, caract, preciohr, preciodia, url1, url2, url3) {
                  var x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevabici");
                  x.style.display = "none";

                  document.getElementById('guardarm').style.display = "none";
                  document.getElementById('eliminarm').style.display = "block";
                  document.getElementById('editarm').style.display = "none";

                  x = document.getElementById("nuevomodelo");
                  if (abmm !== 'B' || document.getElementById('idm').value !== id) {
                    //abre form
                    abmm = 'B';
                    x.style.display = "block";
                    document.getElementById('idm').value = id;
                    document.getElementById('clr').value = idTipo;
                    document.getElementById('nombrem').value = nombre;
                    document.getElementById('descripm').value = caract;
                    document.getElementById('precioHr').value = parseFloat(preciohr.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('precioDia').value = parseFloat(preciodia.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('url1').value = url1;
                    document.getElementById('url2').value = url2;
                    document.getElementById('url3').value = url3;
                    document.getElementById('clr').disabled = true;
                    document.getElementById('nombrem').disabled = true;
                    document.getElementById('descripm').disabled = true;
                    document.getElementById('precioHr').disabled = true;
                    document.getElementById('precioDia').disabled = true;
                    document.getElementById('url1').disabled = true;
                    document.getElementById('url2').disabled = true;
                    document.getElementById('url3').disabled = true;
                    document.getElementById('eliminarm').focus();
                  } else {
                    //cerrar form
                    abmm = '';
                    x.style.display = "none";
                    document.getElementById('idm').value = '';
                    document.getElementById('clr').value = '';
                    document.getElementById('nombrem').value = '';
                    document.getElementById('descripm').value = '';
                    document.getElementById('precioHr').value = '';
                    document.getElementById('precioDia').value = '';
                    document.getElementById('url1').value = '';
                    document.getElementById('url2').value = '';
                    document.getElementById('url3').value = '';
                    document.getElementById('clr').disabled = false;
                    document.getElementById('nombrem').disabled = false;
                    document.getElementById('descripm').disabled = false;
                    document.getElementById('precioHr').disabled = false;
                    document.getElementById('precioDia').disabled = false;
                    document.getElementById('url1').disabled = false;
                    document.getElementById('url2').disabled = false;
                    document.getElementById('url3').disabled = false;
                  }

                  $.post('ExistenBicicletasXModelo',
                          {
                            id: $('#idm').val()
                          },
                          function (responseText)
                          {
                            //VALIDO
                            if (responseText === "0")
                            {
                              document.getElementById('msj2').style.display = "none";
                            }
                            //INVALIDO
                            else
                            {
                              document.getElementById('msj2').style.display = "block";
                              document.getElementById('msj2').innerHTML = "<b>¡ATENCIÓN!</b> Existen bicicletas registradas para este modelo.<br>Al eliminarlo, se eliminarán automaticamente todas las bicicletas de este modelo.";
                            }
                          });
                }

                function nuevabici() {
                  var x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevomodelo");
                  x.style.display = "none";

                  document.getElementById('editarb').style.display = "none";
                  document.getElementById('eliminarb').style.display = "none";
                  document.getElementById('guardarb').style.display = "block";

                  document.getElementById('modelobici').disabled = false;
                  document.getElementById('patente').disabled = false;
                  document.getElementById('kmMantenimiento').disabled = false;
                  document.getElementById('kmViajados').disabled = false;
                  document.getElementById('descripb').disabled = false;
                  document.getElementById('disponible').disabled = false;

                  document.getElementById('tipob').value = '';
                  document.getElementById('modelobici').value = '';
                  document.getElementById('imgbici').src = "img/imagen-vacia.jpg";
                  document.getElementById('patente').value = '';
                  document.getElementById('precioDia').value = '';
                  document.getElementById('kmMantenimiento').value = '';
                  document.getElementById('kmViajados').value = '';
                  document.getElementById('descripb').value = '';

                  document.getElementById('guardarb').disabled = false;
                  document.getElementById('patente').style.backgroundColor = "white";

                  x = document.getElementById("nuevabici");
                  if (abmb !== 'A') {
                    x.style.display = "block";
                    abmb = 'A';
                    document.getElementById('modelobici').focus();
                  } else {
                    x.style.display = "none";
                    abmb = '';
                  }
                }

                function dameImagen() {
                  $.post('DameImagenBici',
                          {
                            idModelo: $('#modelobici').val()
                          },
                          function (responseText)
                          {
                            if (Boolean(responseText)) {
                              var res = responseText.split("//////");
                              document.getElementById("tipob").value = res[1];
                              document.getElementById('imgbici').src = res[0];
                            } else {
                              document.getElementById("tipob").value = '';
                              document.getElementById('imgbici').src = "img/imagen-vacia.jpg";
                            }
                          });
                }

                function editarbici(id, patente, idModelo, tipo, descripcion, disponible, kmMant, kmTot, url) {
                  var x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevomodelo");
                  x.style.display = "none";

                  document.getElementById('modelobici').disabled = false;
                  document.getElementById('kmMantenimiento').disabled = false;
                  document.getElementById('kmViajados').disabled = false;
                  document.getElementById('descripb').disabled = false;
                  document.getElementById('disponible').disabled = false;
                  document.getElementById('patente').disabled = true;

                  document.getElementById('guardarb').style.display = "none";
                  document.getElementById('editarb').style.display = "block";
                  document.getElementById('eliminarb').style.display = "none";

                  x = document.getElementById("nuevabici");
                  if (abmb !== 'M' || document.getElementById('idb').value !== id) {
                    //abre form
                    abmb = 'M';
                    x.style.display = "block";
                    document.getElementById('idb').value = id;
                    document.getElementById('modelobici').value = idModelo;
                    document.getElementById('patente').value = patente;
                    document.getElementById('tipob').value = tipo;
                    document.getElementById('descripb').value = descripcion;
                    document.getElementById('disponible').value = disponible;
                    document.getElementById('kmMantenimiento').value = parseFloat(kmMant.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('kmViajados').value = parseFloat(kmTot.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('imgbici').src = url;
                    document.getElementById('modelobici').focus();
                  } else {
                    //cerrar form
                    abmb = '';
                    x.style.display = "none";

                    document.getElementById('idb').value = '';
                    document.getElementById('modelobici').value = '';
                    document.getElementById('patente').value = '';
                    document.getElementById('tipob').value = '';
                    document.getElementById('descripb').value = '';
                    document.getElementById('disponible').value = '';
                    document.getElementById('kmMantenimiento').value = '';
                    document.getElementById('kmViajados').value = '';
                    document.getElementById('imgbici').src = "img/imagen-vacia.jpg";
                  }
                }

                function eliminarbici(id, patente, idModelo, tipo, descripcion, disponible, kmMant, kmTot, url) {
                  var x = document.getElementById("nuevotipo");
                  x.style.display = "none";
                  x = document.getElementById("nuevomodelo");
                  x.style.display = "none";

                  document.getElementById('modelobici').disabled = true;
                  document.getElementById('kmMantenimiento').disabled = true;
                  document.getElementById('kmViajados').disabled = true;
                  document.getElementById('descripb').disabled = true;
                  document.getElementById('disponible').disabled = true;
                  document.getElementById('patente').disabled = true;

                  document.getElementById('guardarb').style.display = "none";
                  document.getElementById('editarb').style.display = "none";
                  document.getElementById('eliminarb').style.display = "block";

                  x = document.getElementById("nuevabici");
                  if (abmb !== 'B' || document.getElementById('idb').value !== id) {
                    //abre form
                    abmb = 'B';
                    x.style.display = "block";
                    document.getElementById('idb').value = id;
                    document.getElementById('modelobici').value = idModelo;
                    document.getElementById('patente').value = patente;
                    document.getElementById('tipob').value = tipo;
                    document.getElementById('descripb').value = descripcion;
                    document.getElementById('disponible').value = disponible;
                    document.getElementById('kmMantenimiento').value = parseFloat(kmMant.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('kmViajados').value = parseFloat(kmTot.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                    document.getElementById('imgbici').src = url;
                    document.getElementById('eliminarb').focus();
                  } else {
                    //cerrar form
                    abmb = '';
                    x.style.display = "none";

                    document.getElementById('idb').value = '';
                    document.getElementById('modelobici').value = '';
                    document.getElementById('patente').value = '';
                    document.getElementById('tipob').value = '';
                    document.getElementById('descripb').value = '';
                    document.getElementById('disponible').value = '';
                    document.getElementById('kmMantenimiento').value = '';
                    document.getElementById('kmViajados').value = '';
                    document.getElementById('imgbici').src = "img/imagen-vacia.jpg";
                  }
                }

                $("#cruzNuevoTB").mousedown(function () {
                  document.getElementById("nuevotipo").style.display = "none";
                  abmtb = '';
                });

                $("#cruzNuevoM").mousedown(function () {
                  document.getElementById("nuevomodelo").style.display = "none";
                  abmm = '';
                });

                $("#cruzNuevoB").mousedown(function () {
                  document.getElementById("nuevabici").style.display = "none";
                  abmb = '';
                });


    </script>
  </body>

</html>
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

    <%if (session.getAttribute("Usuario") != null) {
        Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
        if (usrActual.isAdm()) {%>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">administrador de bicicletas</span>
    </h1>

    <div class="col-lg-10 col-centered well">

      <button class="tablink" onclick="openPage('tipos', this)" id="defaultOpen">Tipos</button>
      <button class="tablink" onclick="openPage('bicis', this)">Bicicletas</button>
      <!-- TIPO BICICLETA -->
      <div id="tipos" class="tabcontent">
        <div>
          <a style="float:left;" class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevotipo()"><span class="fa fa-plus-square"></span></a></p>
          <div align="right">          
            <i class="fa fa-search"></i>
            <input type="text" id="desctipo" class="myInput" onkeyup="buscartipo()" placeholder="Buscar Tipo de Bicicleta..." title="Ingresar nombre">
          </div>
        </div>
        <table class="table" id="tiposbici">
          <thead style="color: #fff;background-color: #373a3c;">
            <tr align="center">
              <th>#</th>
              <th>TIPO</th>
              <th>PRECIO X HORA</th>
              <th>PRECIO X DÍA</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>            
            <% DecimalFormat df2 = new DecimalFormat("0.00");
              ArrayList<TiposBicicleta> tipos = new ControladorBicicletas().getTiposBicicleta();
              if (tipos.size() > 0) {
                for (TiposBicicleta tipo : tipos) {%>
            <tr align="center" >
              <td style="vertical-align:middle"><%= tipo.getId()%></td>
              <td style="vertical-align:middle"><%= tipo.getNombre()%></td>
              <td style="vertical-align:middle">$ <%= df2.format(tipo.getPrecioXHr())%></td>
              <td style="vertical-align:middle">$ <%= df2.format(tipo.getPrecioXDia())%></td>
              <td style="vertical-align:middle">
                <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" onclick="editartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%= df2.format(tipo.getPrecioXHr())%>', '<%= df2.format(tipo.getPrecioXDia())%>')">
                  <span class="fa fa-edit"></span>
                </button>
              </td>
              <td style="vertical-align:middle">
                <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" onclick="eliminartipo('<%= tipo.getId()%>', '<%=tipo.getNombre()%>', '<%= df2.format(tipo.getPrecioXHr())%>', '<%= df2.format(tipo.getPrecioXDia())%>')">
                  <span class="fa fa-trash-o"></span>
                </button>
              </td>
            </tr>                
            <% }
              }%>
          </tbody>
        </table>
      </div>

      <!-- BICICLETA -->
      <div id="bicis" class="tabcontent">
        <div>
          <a style="float:left;" class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevabici()"><span class="fa fa-plus-square"></span></a></p>
          <div align="right">          
            <i class="fa fa-search"></i>
            <input type="text" id="descbici" onkeyup="buscarbici()" class="myInput"  placeholder="Buscar Bicicleta..." title="Ingresar nombre">
          </div>
        </div>
        <table class="table" id="bicicletas">
          <thead style="color: #fff;background-color: #373a3c;">
            <tr align="center">
              <th>#</th>
              <th>PATENTE</th>
              <th>TIPO</th>
              <th>DESCRIPCION</th>              
              <th>KM MANT</th>
              <th>KM ACUM</th>
              <th>DISPONIBLE</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>            
            <%ArrayList<Bicicletas> bicicletas = new ControladorBicicletas().getBicicletas();
              if (bicicletas.size() > 0) {
                for (Bicicletas b : bicicletas) {%>
            <tr align="center" >
              <td style="vertical-align:middle"><%= b.getId()%></td>
              <td style="vertical-align:middle"><%= b.getPatente()%></td>
              <td style="vertical-align:middle"><%= b.getTipo().getNombre()%></td>
              <td style="vertical-align:middle"><%= b.getDescripcion()%></td>       
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
                        onclick="editarbici('<%= b.getId()%>','<%= b.getPatente()%>', '<%= b.getTipo().getId()%>', '<%= b.getDescripcion()%>', '<%= b.isDisponible()%>', '<%= df2.format(b.getKmDsdMantenimiento())%>', '<%= df2.format(b.getKmEnViaje())%>')">
                  <span class="fa fa-edit"></span>
                </button>
              </td>
              <td style="vertical-align:middle">
                <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                        onclick="eliminarbici('<%= b.getId()%>','<%= b.getPatente()%>', '<%= b.getTipo().getId()%>', '<%= b.getDescripcion()%>', '<%= b.isDisponible()%>', '<%= df2.format(b.getKmDsdMantenimiento())%>', '<%= df2.format(b.getKmEnViaje())%>')">
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

    <!-- NUEVO TIPO BICICLETA -->
    <div class="container text-center" id="nuevotipo" style="display: none">
      <form class="form-text" method="POST" action="AltaTipoBici">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="text" name="tipo" id="tipo" maxlength="50" placeholder="Nombre del Tipo de Bicicleta" title="Nombre del Tipo de Bicicleta" class="form-control" autofocus="true" required="true">
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="preciohr" id="preciohr" placeholder="Precio x Hora" title="Precio x Hora" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="preciodia" id="preciodia" placeholder="Precio x Día" title="Precio x Día" class="form-control" autofocus="true" required="true">
                </div>
              </div>              
              <button type="submit" id="guardar" class="btn btn-lg btn-nuevo btn-block">Guardar</button>
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- MODIFICA TIPO BICICLETA -->
    <div class="container text-center" id="editartipo" style="display: none">
      <form class="form-text" method="POST" action="ModificarTipoBici">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="hidden" name="ediid" id="ediid">
                <input type="text" name="editipo" id="editipo" maxlength="50" placeholder="Nombre del Tipo de Bicicleta" title="Nombre del Tipo de Bicicleta" class="form-control" autofocus="true" required="true">
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="edipreciohr" id="edipreciohr" placeholder="Precio x Hora" title="Precio x Hora" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="edipreciodia" id="edipreciodia" placeholder="Precio x Día" title="Precio x Día" class="form-control" autofocus="true" required="true">
                </div>
              </div>              
              <button type="submit" id="editar" class="btn btn-lg btn-editar btn-block">Editar</button>
            </div>              
          </div>
        </div>
      </form>
    </div>

    <!-- ELIMINA TIPO BICICLETA -->
    <div class="container text-center" id="eliminartipo" style="display: none">
      <form class="form-text" method="POST" action="EliminarTipoBici">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <label class="error" id="msj" style="display: none"></label>
              <div class="form-group">
                <input type="hidden" name="eliid" id="eliid">                
                <input type="text" name="elitipo" disabled="true" id="elitipo" placeholder="Nombre del Tipo de Bicicleta" title="Nombre del Tipo de Bicicleta" class="form-control" autofocus="true" required="true">
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" disabled="true" name="elipreciohr" id="elipreciohr" placeholder="Precio x Hora" title="Precio x Hora" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" disabled="true" name="elipreciodia" id="elipreciodia" placeholder="Precio x Día" title="Precio x Día" class="form-control" autofocus="true" required="true">
                </div>
              </div>              
              <button type="submit" id="eliminar" class="btn btn-lg btn-eliminar btn-block">Eliminar</button>
            </div>              
          </div>
        </div>
      </form>
    </div> 

    <!-- NUEVA BICICLETA -->
    <div class="container text-center" id="nuevabici" style="display: none">
      <form class="form-text" method="POST" action="AltaBicicleta">
        <div class="col-lg-8 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="row">
                <div class="col-sm-4 form-group" title="Seleccione Tipo de Bicicleta">
                  <select class="form-control" name="clr" id="clr">
                    <% for (TiposBicicleta t : tipos) {%>
                    <option value="<%=t.getId()%>"><%=t.getNombre()%></option>
                    <%}%>
                  </select>
                </div>
                <div class="col-sm-6 form-group">
                  <input type="text" name="patente" maxlength="10" id="patente" style="text-transform:uppercase" placeholder="Patente Bicicleta" title="Patente Bicicleta" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-2 form-group">
                  <select class="form-control" name="disponible" id="disponible">
                    <option value="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="form-group">
                <input type="text" name="descrip" id="descrip" maxlength="100"  placeholder="Descripcion de la Bicicleta" title="Descripcion de la Bicicleta" class="form-control" autofocus="true" required="true">
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="kmMantenimiento" id="kmMantenimiento" placeholder="Kms desde el últ mantenimiento" title="Kms desde el últ mantenimiento" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="kmViajados" id="kmViajados" placeholder="Kms totales" title="Kms totales" class="form-control" autofocus="true" required="true">
                </div>
              </div>              
              <button type="submit" id="guardar" class="btn btn-lg btn-nuevo btn-block">Guardar</button>
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- MODIFICA BICICLETA -->
    <div class="container text-center" id="editarbici" style="display: none">
      <form class="form-text" method="POST" action="ModificarBicicleta">
        <div class="col-lg-8 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="row">
                <div class="col-sm-4 form-group" title="Seleccione Tipo de Bicicleta">
                  <input type="hidden" name="ediid_b" id="ediid_b">
                  <select class="form-control" name="ediclr" id="ediclr">
                    <% for (TiposBicicleta t : tipos) {%>
                    <option value="<%=t.getId()%>"><%=t.getNombre()%></option>
                    <%}%>
                  </select>
                </div>
                <div class="col-sm-6 form-group">
                  <input type="text" name="edipatente" maxlength="10" id="edipatente" style="text-transform:uppercase" placeholder="Patente Bicicleta" title="Patente Bicicleta" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-2 form-group">
                  <select class="form-control" name="edidisponible" id="edidisponible">
                    <option value="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="form-group">
                <input type="text" name="edidescrip" id="edidescrip" maxlength="100"  placeholder="Descripcion de la Bicicleta" title="Descripcion de la Bicicleta" class="form-control" autofocus="true" required="true">
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="edikmMantenimiento" id="edikmMantenimiento" placeholder="Kms desde el últ mantenimiento" title="Kms desde el últ mantenimiento" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" step="any" name="edikmViajados" id="edikmViajados" placeholder="Kms totales" title="Kms totales" class="form-control" autofocus="true" required="true">
                </div>
              </div>              
              <button type="submit" id="editar" class="btn btn-lg btn-editar btn-block">Editar</button>
            </div>              
          </div>
        </div>         
      </form>
    </div>

    <!-- ELIMINAR BICICLETA -->
    <div class="container text-center" id="eliminarbici" style="display: none">
    <form class="form-text" method="POST" action="EliminarBicicleta">
        <div class="col-lg-8 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <label class="error" id="msjBici" style="display: none"></label>
              <div class="row">
                <div class="col-sm-4 form-group" title="Seleccione Tipo de Bicicleta">
                  <input type="hidden" name="eliid_b" id="eliid_b">
                  <select class="form-control" name="ediclr" id="eliclr" disabled="true">
                    <% for (TiposBicicleta t : tipos) {%>
                    <option value="<%=t.getId()%>"><%=t.getNombre()%></option>
                    <%}%>
                  </select>
                </div>
                <div class="col-sm-6 form-group">
                  <input type="text" disabled="true" name="elipatente" maxlength="10" id="elipatente" style="text-transform:uppercase" placeholder="Patente Bicicleta" title="Patente Bicicleta" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-2 form-group">
                  <select class="form-control" disabled="true" name="elidisponible" id="elidisponible">
                    <option value="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="form-group">
                <input type="text" disabled="true" name="elidescrip" id="elidescrip" maxlength="100"  placeholder="Descripcion de la Bicicleta" title="Descripcion de la Bicicleta" class="form-control" autofocus="true" required="true">
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="number" disabled="true" step="any" name="elikmMantenimiento" id="elikmMantenimiento" placeholder="Kms desde el últ mantenimiento" title="Kms desde el últ mantenimiento" class="form-control" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="number" disabled="true" step="any" name="elikmViajados" id="elikmViajados" placeholder="Kms totales" title="Kms totales" class="form-control" autofocus="true" required="true">
                </div>
              </div>              
              <button type="submit" id="eliminar" class="btn btn-lg btn-eliminar btn-block">Eliminar</button>
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
    <script src="js/existePatente.js"></script>
    <script>
      function openPage(pageName, elmnt) {
        var i;
        var badColor = "#e6a756";
         
        var x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("nuevotipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";
        x = document.getElementById("eliminarbici");
        x.style.display = "none";
        x = document.getElementById("editarbici");
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

      function buscartipo() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("desctipo");
        filter = input.value.toUpperCase();
        table = document.getElementById("tiposbici");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[1];
          if (td) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }
        }
      }

      function buscarbici() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("descbici");
        filter = input.value.toUpperCase();
        table = document.getElementById("bicicletas");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td1 = tr[i].getElementsByTagName("td")[0];
          td2 = tr[i].getElementsByTagName("td")[1];
          td3 = tr[i].getElementsByTagName("td")[2];
          td4 = tr[i].getElementsByTagName("td")[3];
          if (td1 || td2 || td3 || td4) {
            if (td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td4.innerHTML.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }
        }
      }

      function nuevotipo() {
        var x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";
        x = document.getElementById("eliminarbici");
        x.style.display = "none";
        x = document.getElementById("editarbici");
        x.style.display = "none";
        x = document.getElementById("nuevabici");
        x.style.display = "none";

        x = document.getElementById("nuevotipo");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
          document.getElementById('tipo').value = '';
          document.getElementById('preciodia').value = '';
          document.getElementById('preciohr').value = '';
        }
      }

      function nuevabici() {
        var x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";
        x = document.getElementById("nuevotipo");
        x.style.display = "none";
        x = document.getElementById("eliminarbici");
        x.style.display = "none";
        x = document.getElementById("editarbici");
        x.style.display = "none";

        x = document.getElementById("nuevabici");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }

      function editartipo(id, nombre, preciohr, preciodia) {
        var x = document.getElementById("nuevotipo");
        x.style.display = "none";
        x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("editarbici");
        x.style.display = "none";
        x = document.getElementById("nuevabici");
        x.style.display = "none";
        x = document.getElementById("eliminarbici");
        x.style.display = "none";

        x = document.getElementById("editartipo");
        if (x.style.display === "none" || document.getElementById('ediid').value !== id) {
          //abre form
          x.style.display = "block";
          document.getElementById('ediid').value = id;
          document.getElementById('editipo').value = nombre;
          document.getElementById('edipreciohr').value = parseFloat(preciohr.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
          document.getElementById('edipreciodia').value = parseFloat(preciodia.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
        } else {
          //cerrar form
          x.style.display = "none";
          document.getElementById('ediid').value = '';
          document.getElementById('editipo').value = '';
          document.getElementById('edipreciohr').value = '';
          document.getElementById('edipreciodia').value = '';
        }
      }

      function editarbici(id, patente, tipo, descrip, dispo, kmMant, kmViaje) {
        var x = document.getElementById("nuevotipo");
        x.style.display = "none";
        x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";
        x = document.getElementById("nuevabici");
        x.style.display = "none";
        x = document.getElementById("eliminarbici");
        x.style.display = "none";

        x = document.getElementById("editarbici");
        if (x.style.display === "none" || document.getElementById('ediid_b').value !== id) {
          //abre form
          x.style.display = "block";
          document.getElementById('ediid_b').value = id;     
          document.getElementById('ediclr').value = tipo;
          document.getElementById('edipatente').value = patente;
          document.getElementById('edidisponible').value = dispo;
          document.getElementById('edidescrip').value = descrip;
          document.getElementById('edikmMantenimiento').value = parseFloat(kmMant.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
          document.getElementById('edikmViajados').value = parseFloat(kmViaje.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
          } else {
          //cerrar form
          x.style.display = "none";
          document.getElementById('ediid_b').value = '';
          document.getElementById('ediclr').value = '';
          document.getElementById('edipatente').value = '';
          document.getElementById('edidescrip').value = '';
          document.getElementById('edidisponible').value = '';
          document.getElementById('edikmMantenimiento').value = '';
          document.getElementById('edikmViajados').value = '';
        }
      }

      function eliminartipo(id, nombre, preciohr, preciodia) {
        var x = document.getElementById("nuevotipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";
        x = document.getElementById("nuevabici");
        x.style.display = "none";
        x = document.getElementById("editarbici");
        x.style.display = "none";
        x = document.getElementById("eliminarbici");
        x.style.display = "none";

        x = document.getElementById("eliminartipo");
        if (x.style.display === "none" || document.getElementById('eliid').value !== id) {
          //abre form
          x.style.display = "block";
          document.getElementById('eliid').value = id;
          document.getElementById('elitipo').value = nombre;
          document.getElementById('elipreciohr').value = parseFloat(preciohr.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
          document.getElementById('elipreciodia').value = parseFloat(preciodia.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
        } else {
          //cerrar form
          x.style.display = "none";
          document.getElementById('eliid').value = '';
          document.getElementById('elitipo').value = '';
          document.getElementById('elipreciohr').value = '';
          document.getElementById('elipreciodia').value = '';
        }
        
        $.post('ExistenBicicletasXTipo', 
          {
            id : $('#eliid').val()
          }, 
          function(responseText) 
          {
            //VALIDO
            if(responseText==="0")
            {
              document.getElementById('msj').style.display = "none";              
            }
            //INVALIDO
            else
            {
              document.getElementById('msj').style.display = "block";
              document.getElementById('msj').innerHTML = "<b>¡ATENCIÓN!</b> Existen bicicletas registradas de este tipo.<br>Al eliminarlo, se eliminarán automaticamente todas las bicicletas del mismo tipo.";
            }              
          });
      }

      function eliminarbici(id, patente, tipo, descrip, dispo, kmMant, kmViaje) {
        var x = document.getElementById("nuevotipo");
        x.style.display = "none";
        x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";
        x = document.getElementById("nuevabici");
        x.style.display = "none";
        x = document.getElementById("editarbici");
        x.style.display = "none";

        x = document.getElementById("eliminarbici");
        if (x.style.display === "none" || document.getElementById('eliid_b').value !== id) {
          //abre form
          x.style.display = "block";
          document.getElementById('eliid_b').value = id;     
          document.getElementById('eliclr').value = tipo;
          document.getElementById('elipatente').value = patente;
          document.getElementById('elidisponible').value = dispo;
          document.getElementById('elidescrip').value = descrip;
          document.getElementById('elikmMantenimiento').value = parseFloat(kmMant.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
          document.getElementById('elikmViajados').value = parseFloat(kmViaje.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
          } else {
          //cerrar form
          x.style.display = "none";
          document.getElementById('eliid_b').value = '';
          document.getElementById('eliclr').value = '';
          document.getElementById('elipatente').value = '';
          document.getElementById('elidescrip').value = '';
          document.getElementById('elidisponible').value = '';
          document.getElementById('elikmMantenimiento').value = '';
          document.getElementById('elikmViajados').value = '';
        }
      }
    </script>
  </body>

</html>
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
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
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
      <span class="site-heading-upper text-primary mb-3">administrador de usuarios</span>
    </h1>

    <!-- USUARIOS -->
    <div class="col-lg-10 col-centered well" >      
      <div style="overflow-x:auto;">
        <div>
          <a class="btn btn-nuevo" data-title="Nuevo" title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevousr()"><span class="fa fa-plus-square"></span></a></p>
        </div
        <br>
        <table class="display table" id="usuarios">
          <thead style="color: #fff;background-color: #373a3c;">
            <tr align="center">
              <th>USUARIO</th>
              <th>NOMBRE</th>
              <th>DOCUMENTO</th>
              <th>EMAIL</th>
              <th>ROL</th>
              <th>¿HABILITADO?</th>
              <th></th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>            
            <%ArrayList<Usuarios> usuarios = new ControladorUsuarios().getUsuarios();
            if (usuarios.size() > 0) {
              for (Usuarios u : usuarios) {%>
            <tr align="center" >
              <td style="vertical-align:middle"><%= u.getUsuario().trim()%></td>
              <td style="vertical-align:middle"><%= u.getApynom().trim()%></td>
              <td style="vertical-align:middle"><%= u.getDocumento().trim()%></td>
              <td style="vertical-align:middle"><%= u.getEmail().trim()%></td>
              <td style="vertical-align:middle">
                <% if (u.isAdm()) {%>
                <span class="label label-adm">ADMIN</span>
                <% }  if (u.isMecanico()) { %>
                <span class="label label-mecanico">MECANICO</span>
                <% } if (!u.isAdm() && !u.isMecanico()) { %>
                <span class="label label-cliente">CLIENTE</span>
                <% } %>
              </td>
              <td style="vertical-align:middle">
                <% if (u.isHabilitado()) {%>
                <span class="label label-success">SI</span>
                <% } else { %>
                <span class="label label-danger">NO</span>
                <% }%>
              </td>   
              <td style="vertical-align:middle">
                <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                        onclick="editarusr('<%= u.getId()%>', '<%=u.getUsuario().trim()%>', '<%= u.getApynom().trim()%>', '<%= u.getDocumento()%>',
                                    '<%= u.getEmail()%>', '<%= u.isAdm()%>', '<%= u.isMecanico()%>', '<%= u.isHabilitado()%>', '<%= u.getDomicilio().trim()%>', '<%= u.getTelefono()%>')">
                  <span class="fa fa-edit"></span>
                </button>
              </td>
              <td style="vertical-align:middle">
                <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                        onclick="eliminarusr('<%= u.getId()%>', '<%=u.getUsuario().trim()%>', '<%= u.getApynom().trim()%>', '<%= u.getDocumento()%>',
                                    '<%= u.getEmail()%>', '<%= u.isAdm()%>', '<%= u.isMecanico()%>', '<%= u.isHabilitado()%>', '<%= u.getDomicilio().trim()%>', '<%= u.getTelefono()%>')">
                  <span class="fa fa-trash-o"></span>
                </button>
              </td>
              <td style="vertical-align:middle">
                <button class="btn btn-reset" data-title="Reestablecer Contraseña" title="Reestablecer Contraseña" data-toggle="modal" data-target="#reset" onclick="reset('<%= u.getId()%>')">
                  <span class="fa fa-refresh"></span>
                </button>
              </td>
            </tr>                
            <% }
            }%>
          </tbody>
        </table>
      </div>
    </div>

    <!-- NUEVO USUARIO -->
    <div class="container text-center" id="nuevousr" style="display: none">
      <form class="form-text" method="POST" action="AltaUsuario">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzNuevo" class="fa fa-close" style="right: 50px"></span>
              </div>
              <div class="row">                
                <div class="col-sm-9 form-group">
                  <input type="text" title="Nombre de Usuario" name="usuario" id="usuario" placeholder="Usuario" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-3 form-group">
                  <select class="form-control" name="habilitado" id="habilitado" title="¿Usuario Habilitado?">
                    <option value="true" selected="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="row">
                <div class="password col-sm-6 form-group">
                  <input type="password" name="pass" id="pass" placeholder="Contraseña" title="Contraseña" class="form-control" autofocus="true" required="true">
                  <span id="ojopas" class="fa fa-eye" style="right: 23px"></span>
                </div>	
                <div class="password col-sm-6 form-group">
                  <input type="password" id="repass" name="repass" placeholder="Repita Contraseña" title="Repita Contraseña" class="form-control" autofocus="true" required="true">
                  <span id="ojore" class="fa fa-eye" style="right: 23px"></span>
                </div>
              </div>
              <div class="form-group">
                <input type="text" name="apenom" id="apenom" placeholder="Apellido y Nombre" title="Apellido y Nombre" class="form-control" autofocus="true" required="true">
              </div>			
              <div class="form-group">
                <input type="text" name="domicilio" id="domicilio" placeholder="Domicilio" title="Domicilio" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="documento" id="documento" placeholder="Documento de Identidad" title="Documento de Identidad" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="telefono" id="telefono" placeholder="Teléfono de contacto" title="Teléfono de contacto" class="form-control" autofocus="true" required="true">
              </div>		
              <div class="form-group">
                <input type="email" name="email" id="email" placeholder="Email de contacto" title="Email de contacto" class="form-control" autofocus="true" required="true">
              </div>
              <div class="col-sm-9 col-centered">
                <div class="panel panel-default">
                  <div class="panel-heading"><b>Tipo de Usuario</b></div>
                  <div class="panel-body">
                    <div class="form-check form-check-inline">
                      <label class="btn btn-admin">                        
                        <label class="form-check-label label label-adm"><input class="form-check-input" type="checkbox" id="admin" name="admin" value="false"
                             onclick="javascript:checkNuevo(this.form)">ADMIN</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">
                      <label class="btn btn-mecanico">
                        <label class="form-check-label label label-mecanico"><input class="form-check-input" type="checkbox" id="meca" name="meca" value="false"
                             onclick="javascript:checkNuevo(this.form)">MECANICO</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">                      
                      <label class="btn btn-cliente">
                        <label class="form-check-label label label-cliente"><input class="form-check-input" type="checkbox" id="cliente" name="cliente" value="false"
                             onclick="javascript:checkNuevo2(this.form)">CLIENTE</label>
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" id="enviar" class="btn btn-lg btn-nuevo btn-block">Guardar Nuevo</button>
            </div>              
          </div>
        </div>
      </form>
    </div>

    <!-- MODIFICA USUARIO -->
    <div class="container text-center" id="editarusr" style="display: none">
      <form class="form-text" method="POST" action="ModificarUsuario">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzEditar" class="fa fa-close" style="right: 50px"></span>
              </div>
              <div class="row">
                <div class="col-sm-10 form-group">
                  <input type="hidden" name="idusr" id="idusr">
                  <input type="text" title="Nombre de Usuario" disabled="true" name="ediusr" id="ediusr" placeholder="Usuario" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-2 form-group">
                  <select class="form-control" name="edihab" id="edihab" title="¿Usuario Habilitado?">
                    <option value="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="form-group">
                <input type="text" name="ediapenom" id="ediapenom" placeholder="Apellido y Nombre" title="Apellido y Nombre" class="form-control" autofocus="true" required="true">
              </div>			
              <div class="form-group">
                <input type="text" name="edidomicilio" id="edidomicilio" placeholder="Domicilio" title="Domicilio" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="edidocu" id="edidocu" placeholder="Documento de Identidad" title="Documento de Identidad" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="editel" id="editel" placeholder="Teléfono de contacto" title="Teléfono de contacto" class="form-control" autofocus="true" required="true">
              </div>		
              <div class="form-group">
                <input type="email" name="ediemail" id="ediemail" placeholder="Email de contacto" title="Email de contacto" class="form-control" autofocus="true" required="true">
              </div>
              <div class="col-sm-9 col-centered">
                <div class="panel panel-default">
                  <div class="panel-heading"><b>Tipo de Usuario</b></div>
                  <div class="panel-body">
                    <div class="form-check form-check-inline">
                      <label class="btn btn-admin">                        
                        <label class="form-check-label label label-adm"><input class="form-check-input" type="checkbox" id="ediadmin" name="ediadmin" value="false"
                             onclick="javascript:checkEditar(this.form)">ADMIN</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">
                      <label class="btn btn-mecanico">
                        <label class="form-check-label label label-mecanico"><input class="form-check-input" type="checkbox" id="edimeca" name="edimeca" value="false"
                             onclick="javascript:checkEditar(this.form)">MECANICO</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">                      
                      <label class="btn btn-cliente">
                        <label class="form-check-label label label-cliente"><input class="form-check-input" type="checkbox" id="edicliente" name="edicliente" value="false"
                             onclick="javascript:checkEditar2(this.form)">CLIENTE</label>
                      </label>
                    </div>
                  </div> 
                </div>                                 
                <div class="form-group">
                  <button type="button" id="r" title="Reestablacer contraseña" onclick="resetear()" class="btn btn-lg btn-reset btn-block">Reestablecer Contraseña</button>
                </div>
              </div>
              <button type="submit" id="guardar" class="btn btn-lg btn-editar btn-block">Editar</button>
            </div>              
          </div>
        </div>
      </form>
    </div>

    <!-- ELIMINA USUARIO -->
    <div class="container text-center" id="eliminarusr" style="display: none">
      <form class="form-text" method="POST" action="EliminarUsuario">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group float-sm-right">
                <span id="cruzEliminar" class="fa fa-close" style="right: 50px"></span>
              </div>
              <div class="row">
                <div class="col-sm-10 form-group">
                  <input type="hidden" name="eliid" id="eliid">
                  <input type="text" title="Nombre de Usuario" disabled="true" name="eliusr" id="eliusr" placeholder="Usuario" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-2 form-group">
                  <select class="form-control" name="elihab" disabled="true" id="elihab" title="¿Usuario Habilitado?">
                    <option value="true" selected="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="form-group">
                <input type="text" name="eliapenom" disabled="true" id="eliapenom" placeholder="Apellido y Nombre" title="Apellido y Nombre" class="form-control" autofocus="true" required="true">
              </div>			
              <div class="form-group">
                <input type="text" name="elidomicilio" disabled="true" id="elidomicilio" placeholder="Domicilio" title="Domicilio" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="elidocu" disabled="true" id="elidocu" placeholder="Documento de Identidad" title="Documento de Identidad" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="elitel" disabled="true" id="elitel" placeholder="Teléfono de contacto" title="Teléfono de contacto" class="form-control" autofocus="true" required="true">
              </div>		
              <div class="form-group">
                <input type="email" name="eliemail" disabled="true" id="eliemail" placeholder="Email de contacto" title="Email de contacto" class="form-control" autofocus="true" required="true">
              </div>
              <div class="col-sm-9 col-centered">
                <div class="panel panel-default">
                  <div class="panel-heading"><b>Tipo de Usuario</b></div>
                  <div class="panel-body">
                    <div class="form-check form-check-inline">
                      <label class="btn btn-admin">                        
                        <label class="form-check-label label label-adm" disabled="true"><input disabled="true" class="form-check-input" type="checkbox" id="eliadmin" name="eliadmin" value="false">ADMIN</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">
                      <label class="btn btn-mecanico">
                        <label class="form-check-label label label-mecanico" disabled="true"><input disabled="true" class="form-check-input" type="checkbox" id="elimeca" name="elimeca" value="false">MECANICO</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">                      
                      <label class="btn btn-cliente">
                        <label class="form-check-label label label-cliente" disabled="true"><input disabled="true" class="form-check-input" type="checkbox" id="elicliente" name="elicliente" value="false">CLIENTE</label>
                      </label>
                    </div>
                  </div> 
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
    <script src="js/existeUsuario.js"></script>
    <script src="js/registroNuevoUsr.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
      
      $(document).ready(function() {
        $('#usuarios').DataTable( {
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
                "previous": "Anterior" }
          },
          "order": [[ 4, "asc" ]],
          "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
          "pagingType": "simple_numbers",
          "columns": [            
              null,
              null,
              null,
              null,
              null,
              null,
              { "orderable": false },
              { "orderable": false },
              { "orderable": false }
            ]
          } );
      } );
            
      function nuevousr() {
        var x = document.getElementById("editarusr");
        x.style.display = "none";
        
        x = document.getElementById("nuevousr");        
        if (x.style.display === "none") {
          x.style.display = "block";
          document.getElementById('habilitado').value = true;
        } else {
          x.style.display = "none";
          document.getElementById('idusr').value = '';
          document.getElementById('usuario').value = '';
          document.getElementById('habilitado').value = '';
          document.getElementById('apenom').value = '';
          document.getElementById('domicilio').value= '';
          document.getElementById('documento').value = '';
          document.getElementById('telefono').value = '';
          document.getElementById('email').value = '';
          
          document.getElementById('admin').disabled = false;
          document.getElementById('meca').disabled = false;
          document.getElementById('cliente').disabled = false;
          document.getElementById('admin').checked = false;
          document.getElementById('meca').checked = false;
          document.getElementById('cliente').checked = false;
          document.getElementById('admin').value = false;
          document.getElementById('meca').value = false;
          document.getElementById('cliente').value = false;
        }
      }
      
      function editarusr(id,user,apenom,docu,email,admin,meca,habi,domi,tel) {
        var x = document.getElementById("nuevousr");
        x.style.display = "none";
        
        x = document.getElementById("eliminarusr");
        x.style.display = "none"; 
        
        x = document.getElementById("editarusr");
        if (x.style.display === "none" || document.getElementById('idusr').value !== id) {
          x.style.display = "block";
          document.getElementById('idusr').value = id;
          document.getElementById('ediusr').value = user;
          document.getElementById('edihab').value = habi;
          document.getElementById('ediapenom').value = apenom;
          document.getElementById('edidomicilio').value = domi;
          document.getElementById('edidocu').value = docu;
          document.getElementById('editel').value = tel;
          document.getElementById('ediemail').value = email;
                    
          if(admin==="true")
          {
            document.getElementById('ediadmin').checked = true;
            document.getElementById('ediadmin').value = true;
          }
          else
          {
            document.getElementById('ediadmin').checked = false;
            document.getElementById('ediadmin').value = false;
          }  
          
          if(meca==="true")  
          {
            document.getElementById('edimeca').checked = true;
            document.getElementById('edimeca').value = true;
          }
          else
          {
            document.getElementById('edimeca').checked = false;
            document.getElementById('edimeca').value = false;
          } 
            
          if(meca==="false" && admin==="false")           
          {
            document.getElementById('edicliente').checked = true;
            document.getElementById('edicliente').value = true;
          }
          else
          {
            document.getElementById('edicliente').checked = false;
            document.getElementById('edicliente').value = false;
          }
          
        } else {
          x.style.display = "none";
        }
      }
      
      function eliminarusr(id,user,apenom,docu,email,admin,meca,habi,domi,tel) {
        var x = document.getElementById("nuevousr");
        x.style.display = "none";
        
        x = document.getElementById("editarusr");
        x.style.display = "none";   
        
        x = document.getElementById("eliminarusr");
        if (x.style.display === "none" || document.getElementById('eliid').value !== id) {
          x.style.display = "block";
          document.getElementById('eliid').value = id;
          document.getElementById('eliusr').value = user;
          document.getElementById('elihab').value = habi;
          document.getElementById('eliapenom').value = apenom;
          document.getElementById('elidomicilio').value = domi;
          document.getElementById('elidocu').value = docu;
          document.getElementById('elitel').value = tel;
          document.getElementById('eliemail').value = email;
                    
          if(admin==="true")
            document.getElementById('eliadmin').checked = true;
          else
            document.getElementById('eliadmin').checked = false;
          
          if(meca==="true")  
            document.getElementById('elimeca').checked = true;
          else
            document.getElementById('elimeca').checked = false;
            
          if(meca==="false" && admin==="false")           
            document.getElementById('elicliente').checked = true;
          else            
            document.getElementById('elicliente').checked = false;
          
        } else {
          x.style.display = "none";
        }
      }
  
      function reset(id) {
        
        $.post('ResetContrasenia', 
          {
            id : id
          }, 
          function(responseText) 
          {
            //VALIDO
            if(responseText==="0")
            {
              alert("¡Contraseña reestablecida! Nueva contraseña: 12345");                
              location.reload();
            }
            //INVALIDO
            else
            {
              alert("¡No ha sido posible reestrablecer la cotnraseña!");                
              location.reload();
            }              
          });
      }
  
      function resetear() {
        $.post('ResetContrasenia', 
          {
            id : document.getElementById('idusr').value
          }, 
          function(responseText) 
          {
            //VALIDO
            if(responseText==="0")
            {
              alert("¡Contraseña reestablecida! Nueva contraseña: 12345");                
              location.reload();
            }
            //INVALIDO
            else
            {
              alert("¡No ha sido posible reestrablecer la cotnraseña!");                
              location.reload();
            }              
          });
        }
  
      function checkNuevo(form) {
        if (form.elements["admin"].checked)
          form.elements["admin"].value = true;
        else
          form.elements["admin"].value = false;

        if (form.elements["meca"].checked)
          form.elements["meca"].value = true;
        else
          form.elements["meca"].value = false;

        if (form.elements["admin"].checked || form.elements["meca"].checked) {
          form.elements["cliente"].disabled = true;
        } else {
          form.elements["cliente"].disabled = false;
        }
      }

      function checkNuevo2(form) {
        if (form.elements["cliente"].checked)
          form.elements["cliente"].value = true;
        else
          form.elements["cliente"].value = false;

        if (form.elements["cliente"].checked) {
          form.elements["admin"].disabled = true;
          form.elements["meca"].disabled = true;
        } else {
          form.elements["admin"].disabled = false;
          form.elements["meca"].disabled = false;
        }
      }
      
      function checkEditar(form) {
        if (form.elements["ediadmin"].checked)
          form.elements["ediadmin"].value = true;
        else
          form.elements["ediadmin"].value = false;

        if (form.elements["edimeca"].checked)
          form.elements["edimeca"].value = true;
        else
          form.elements["edimeca"].value = false;

        if (form.elements["ediadmin"].checked || form.elements["edimeca"].checked) {
          form.elements["edicliente"].disabled = true;
          form.elements["edicliente"].checked = false;
        } else {
          form.elements["edicliente"].disabled = false;
        }
      }

      function checkEditar2(form) {
        if (form.elements["edicliente"].checked)
          form.elements["edicliente"].value = true;
        else
          form.elements["edicliente"].value = false;

        if (form.elements["edicliente"].checked) {
          form.elements["ediadmin"].disabled = true;
          form.elements["edimeca"].disabled = true;
          form.elements["ediadmin"].checked = false;
          form.elements["edimeca"].checked = false; 
        } else {
          form.elements["ediadmin"].disabled = false;
          form.elements["edimeca"].disabled = false;
        }
      }

      $("#cruzNuevo").mousedown(function(){
        document.getElementById("nuevousr").style.display = "none"; 
      });
      
      $("#cruzEditar").mousedown(function(){
        document.getElementById("editarusr").style.display = "none"; 
      });
      
      $("#cruzEliminar").mousedown(function(){
        document.getElementById("eliminarusr").style.display = "none"; 
      });
    </script>
  </body>

</html>
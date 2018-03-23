var abmr = '';

$(document).ready(function () {  
  $('#rpendientes').DataTable({
    "language": {
      "decimal": ",",
      "search": "Buscar ",
      "emptyTable": "No se encontraron registros",
      "lengthMenu": "Registros por p\u00e1gina _MENU_",
      "zeroRecords": "No se encontraron registros",
      "info": " _PAGE_ de _PAGES_ ",
      "infoEmpty": "",
      "infoFiltered": " (Filtrados de un total de _MAX_ registros)",
      "paginate": {
        "first": "Primero",
        "last": "\u00daltimo",
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
      {"orderable": false},
      {"orderable": false}
    ]
  });
  
  $('#rencurso').DataTable({
    "language": {
      "decimal": ",",
      "search": "Buscar ",
      "emptyTable": "No se encontraron registros",
      "lengthMenu": "Registros por p\u00e1gina _MENU_",
      "zeroRecords": "No se encontraron registros",
      "info": " _PAGE_ de _PAGES_ ",
      "infoEmpty": "",
      "infoFiltered": " (Filtrados de un total de _MAX_ registros)",
      "paginate": {
        "first": "Primero",
        "last": "\u00daltimo",
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
      {"orderable": false},
      {"orderable": false},
      {"orderable": false}
    ]
  });

  $('#rfinalizadas').DataTable({
    "language": {
      "decimal": ",",
      "search": "Buscar ",
      "emptyTable": "No se encontraron registros",
      "lengthMenu": "Registros por p\u00e1gina _MENU_",
      "zeroRecords": "No se encontraron registros",
      "info": " _PAGE_ de _PAGES_ ",
      "infoEmpty": "",
      "infoFiltered": " (Filtrados de un total de _MAX_ registros)",
      "paginate": {
        "first": "Primero",
        "last": "\u00daltimo",
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
      null,
      {"orderable": false}
    ]
  });   
});

function openPage(pageName, elmnt) {
  var i;
  var badColor = "#373a3c";
  abmtm = '';
  abmm = '';

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

function nuevareserva() {
  window.open("reservar.jsp","_self");
}

/*
 * 
 iniciarReserva('<%=r.getId()%>','<%=reserva%>', '<%=bicicleta%>', '<%=r.getBici().getModelo().getUrl1() %>', 
                                    '<%= r.getCliente().getUsuario() %>','<%= r.getCliente().getDocumento()%>', '<%= df.format(r.getFechaInicioP())%>', 
                                    '<%= df.format(r.getFechaFinP())%>','<%= df2.format(r.getImporte())%>')">
 */

function editartipo(id, reserva, bicicleta, img1, usr, docu, inicio, fin, importe) {
  
  document.getElementById('nombretb').disabled = false;
  document.getElementById('descriptb').disabled = false;
  document.getElementById('urlPortada').disabled = false;
  document.getElementById('iniciar').style.display = "none";
  document.getElementById('editar').style.display = "block";
  document.getElementById('eliminar').style.display = "none";

  x = document.getElementById("reserva");
  if (abmr !== 'M' || document.getElementById('idr').value !== id) {
    //abre form
    abmr = 'M';
    x.style.display = "block";
    document.getElementById('idtb').value = id;
    document.getElementById('nombretb').value = nombre;
    document.getElementById('descriptb').value = descrip;
    document.getElementById('urlPortada').value = url;

    if (url)
      document.getElementById('portada').src = url;
    else
      document.getElementById('portada').src = "img/imagen-vacia.jpg";

    document.getElementById('nombretb').focus();
  } else {
    //cerrar form
    abmr = '';
    x.style.display = "none";
    document.getElementById('idtb').value = '';
    document.getElementById('nombretb').value = '';
    document.getElementById('descriptb').value = '';
    document.getElementById('urlPortada').value = '';
    document.getElementById('portada').src = "img/imagen-vacia.jpg";
  }
}


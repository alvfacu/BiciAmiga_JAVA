var abmtm = '';
var abmm = '';

$(document).ready(function () {  
  $('#tipos_mant').DataTable({
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
      {"orderable": false},
      {"orderable": false}
    ]
  });

  $('#mantenimientos').DataTable({
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
     "order": [[ 1, "asc" ]],
    "columns": [
      null,
      null,
      null,
      {"orderable": false},
      {"orderable": false}
    ]
  });
  
  $('#mantenimientosfin').DataTable({
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
     "order": [[ 1, "asc" ]],
    "columns": [
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
  var badColor = "#e6a756";
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

function nuevotipo() {
  var x = document.getElementById("nuevomantenimiento");
  x.style.display = "none";

  document.getElementById('editartm').style.display = "none";
  document.getElementById('eliminartm').style.display = "none";
  document.getElementById('guardartm').style.display = "block";
  
  document.getElementById('nombretm').disabled = false;
  document.getElementById('descriptm').disabled = false;
  document.getElementById('obligatorio').disabled = false;
  document.getElementById('km').disabled = true;
  
  document.getElementById('nombretm').value = '';
  document.getElementById('descriptm').value = '';
  document.getElementById('obligatorio').value = '';
  document.getElementById('km').value = '';
  document.getElementById('msj1').style.display = "none";

  x = document.getElementById("nuevotipo");
  if (abmtm !== 'A') {
    x.style.display = "block";
    abmtm = 'A';
    document.getElementById('nombretm').focus();
  } else {
    x.style.display = "none";
    abmtm = '';
  }
}

function editartipo(id, nombre, descrip, obligatorio, km) {
  var x = document.getElementById("nuevomantenimiento");
  x.style.display = "none";

  document.getElementById('msj1').style.display = "none";
  
  document.getElementById('nombretm').disabled = false;
  document.getElementById('descriptm').disabled = false;
  document.getElementById('obligatorio').disabled = false;
  
  document.getElementById('guardartm').style.display = "none";
  document.getElementById('editartm').style.display = "block";
  document.getElementById('eliminartm').style.display = "none";

  x = document.getElementById("nuevotipo");
  if (abmtm !== 'M' || document.getElementById('idtm').value !== id) {
    //abre form
    abmtm = 'M';
    x.style.display = "block";
    document.getElementById('idtm').value = id;
    document.getElementById('nombretm').value = nombre;
    document.getElementById('descriptm').value = descrip;
    document.getElementById('obligatorio').value = obligatorio;
    if(obligatorio === "true")
    {
      document.getElementById('km').disabled = false;
      document.getElementById('km').value = parseFloat(km.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
    }
    else
    {
      document.getElementById('km').disabled = true;
      document.getElementById('km').value = '';
    } 

    document.getElementById('nombretm').focus();
  } else {
    //cerrar form
    abmtm = '';
    x.style.display = "none";
    document.getElementById('idtm').value = '';
    document.getElementById('nombretm').value = '';
    document.getElementById('descriptm').value = '';
    document.getElementById('obligatorio').value = '';
    document.getElementById('km').value =  '';
  }
}

function eliminartipo(id, nombre, descrip, obligatorio, km) {
  var x = document.getElementById("nuevomantenimiento");
  x.style.display = "none";

  document.getElementById('guardartm').style.display = "none";
  document.getElementById('editartm').style.display = "none";
  document.getElementById('eliminartm').style.display = "block";

  x = document.getElementById("nuevotipo");
  if (abmtm !== 'B' || document.getElementById('idtm').value !== id) {
    //abre form
    x.style.display = "block";
    abmtm = 'B';
    document.getElementById('idtm').value = id;
    document.getElementById('nombretm').value = nombre;
    document.getElementById('descriptm').value = descrip;
    document.getElementById('obligatorio').value = obligatorio;
    document.getElementById('km').value = parseFloat(km.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);

    document.getElementById('nombretm').disabled = true;
    document.getElementById('descriptm').disabled = true;
    document.getElementById('obligatorio').disabled = true;
    document.getElementById('km').disabled = true;
    document.getElementById('eliminartm').focus();
  } else {
    //cerrar form
    x.style.display = "none";
    abmtm = '';
    document.getElementById('idtm').value = '';
    document.getElementById('nombretm').value = '';
    document.getElementById('descriptm').value = '';
    document.getElementById('obligatorio').value = '';
    document.getElementById('km').src = parseFloat('0'.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
    document.getElementById('nombretm').disabled = false;
    document.getElementById('descriptm').disabled = false;
    document.getElementById('obligatorio').disabled = false;
    document.getElementById('km').disabled = false;
  }

  $.post('ExistenMantenimientosXTipo',
          {
            id: $('#idtm').val()
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
              document.getElementById('msj1').innerHTML = "<b>¡ATENCIÓN!</b> Existen mantenimientos en vigencia.<br>Al eliminarlo, se eliminarán todos los mantenimientos de este tipo.";
            }
          });
}

function nuevomantenimiento() {
  window.open("nuevoMantenimiento.jsp","_self");
}

$("#cruzNuevoTM").mousedown(function () {
  document.getElementById("nuevotipo").style.display = "none";
  abmtm = '';
});

function habilitarKM() {
    var x = document.getElementById("obligatorio").value;
    if(x === "true")
    {
      document.getElementById("km").disabled = false;
      document.getElementById("km").value = "0,00";
      document.getElementById("km").required = true;
    }
    else
    {
      document.getElementById("km").disabled = true;
      document.getElementById("km").value = "0,00";
      document.getElementById("km").required = false;
    }
}
var abmtm = '';
var abmm = '';

$(document).ready(function () {
  $('#tipos_mant').DataTable({
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
      {"orderable": false},
      {"orderable": false}
    ]
  });

  $('#mantenimientos').DataTable({
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
      {"orderable": false},
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
  tablinks = document.getElementsByClassName("tablink2");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = badColor;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

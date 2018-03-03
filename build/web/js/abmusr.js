
$(document).ready(function () {
  $('#usuarios').DataTable({
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
    "order": [[4, "asc"]],
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
    document.getElementById('domicilio').value = '';
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

function editarusr(id, user, apenom, docu, email, admin, meca, habi, domi, tel) {
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

    if (admin === "true")
    {
      document.getElementById('ediadmin').checked = true;
      document.getElementById('ediadmin').value = true;
    } else
    {
      document.getElementById('ediadmin').checked = false;
      document.getElementById('ediadmin').value = false;
    }

    if (meca === "true")
    {
      document.getElementById('edimeca').checked = true;
      document.getElementById('edimeca').value = true;
    } else
    {
      document.getElementById('edimeca').checked = false;
      document.getElementById('edimeca').value = false;
    }

    if (meca === "false" && admin === "false")
    {
      document.getElementById('edicliente').checked = true;
      document.getElementById('edicliente').value = true;
    } else
    {
      document.getElementById('edicliente').checked = false;
      document.getElementById('edicliente').value = false;
    }

  } else {
    x.style.display = "none";
  }
}

function eliminarusr(id, user, apenom, docu, email, admin, meca, habi, domi, tel) {
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

    if (admin === "true")
      document.getElementById('eliadmin').checked = true;
    else
      document.getElementById('eliadmin').checked = false;

    if (meca === "true")
      document.getElementById('elimeca').checked = true;
    else
      document.getElementById('elimeca').checked = false;

    if (meca === "false" && admin === "false")
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
            id: id
          },
          function (responseText)
          {
            //VALIDO
            if (responseText === "0")
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
            id: document.getElementById('idusr').value
          },
          function (responseText)
          {
            //VALIDO
            if (responseText === "0")
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

$("#cruzNuevo").mousedown(function () {
  document.getElementById("nuevousr").style.display = "none";
});

$("#cruzEditar").mousedown(function () {
  document.getElementById("editarusr").style.display = "none";
});

$("#cruzEliminar").mousedown(function () {
  document.getElementById("eliminarusr").style.display = "none";
});

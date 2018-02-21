// Recomiendo leer este archivo de abajo hacia arriba para comprenderlo mejor.

$(function () {

  $(document).on("keypress", "form", function (event) {
    return event.keyCode != 13;
  });

  function siError(e) {
    alert('Ocurrió un error al realizar la petición: ' + e.statusText);
  }

  function peticion(e) {
    // Realizar la petición
    // $.ajax({type: "POST",
    //  url: 'ValidaUsuario',
    //  data: {"usuario": $('#usuario').val()}          
    //    });
    $.post('ValidaUsuario', 
          {
            patente : $('#usuario').val()
          }, 
          function(responseText) 
          {
            //VALIDO
            if(responseText==="0")
            {
              $("#enviar").removeAttr('disabled');                 
              $('#usuario').css("backgroundColor", "#66cc66"); 
            }
            //INVALIDO
            else
            {
              $("#enviar").attr('disabled', 'disabled');
              $('#usuario').css("backgroundColor", "#ff6666");
            }
              
          });
  }

  $('#patente').focusout(peticion); // Registrar evento al boton "Calcular" con la funcion "peticion"
});

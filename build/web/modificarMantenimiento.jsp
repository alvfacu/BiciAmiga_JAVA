<%@page import="Entidades.Usuarios"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <%if (session.getAttribute("Usuario") != null) {
        Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
        if (usrActual.isMecanico()) {%>
          <%= request.getParameter("idMant") %>
        <% } else { %>
        <h1>Hello World!</h1>
        <% } } else { %>
        <h1>ERRORs</h1>
        <% } %>        
  </body>
</html>

package Servlets;

import Entidades.Usuarios;
import Negocio.ControladorUsuarios;
import Util.Seguridad;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModificarUsuario", urlPatterns = {"/ModificarUsuario"})
public class ModificarUsuario extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    
    int id = Integer.valueOf(request.getParameter("idusr"));
    Usuarios u = new ControladorUsuarios().getUsuario(id);
    u.setApynom(request.getParameter("ediapenom"));
    u.setDomicilio(request.getParameter("edidomicilio"));
    u.setDocumento(request.getParameter("edidocu"));
    u.setTelefono(request.getParameter("editel"));
    u.setEmail(request.getParameter("ediemail"));
    
    boolean admin = false;
    if(Boolean.valueOf(request.getParameter("ediadmin")))
      admin = true;
    
    boolean meca = false;
    if(Boolean.valueOf(request.getParameter("edimeca")))
      meca = true;
    
    boolean habilitado = false;
    if(Boolean.valueOf(request.getParameter("edihab")))
      habilitado = true;
    
    u.setAdm(admin);
    u.setMecanico(meca);
    u.setHabilitado(habilitado);
    new ControladorUsuarios().modificarUsuario(u);
    response.sendRedirect("admusr.jsp");
  }
  
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}

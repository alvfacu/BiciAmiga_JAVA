
package Servlets;

import Entidades.TiposBicicleta;
import Negocio.ControladorBicicletas;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModificarTipoBici", urlPatterns = {"/ModificarTipoBici"})
public class ModificarTipoBici extends HttpServlet {

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
    int id = Integer.valueOf(request.getParameter("idtb"));
    String nombre = request.getParameter("nombretb");
    String descripcion = request.getParameter("descriptb");
    String url = request.getParameter("urlPortada");
    
    TiposBicicleta tb = new TiposBicicleta(id,nombre, descripcion,url);
    
    new ControladorBicicletas().modificarTipoBicicleta(tb);
    response.sendRedirect("admbici.jsp");
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}

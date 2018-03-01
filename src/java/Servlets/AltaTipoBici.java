package Servlets;

import Entidades.TiposBicicleta;
import Negocio.ControladorBicicletas;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AltaTipoBici", urlPatterns = {"/AltaTipoBici"})
public class AltaTipoBici extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {{
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String nombre = request.getParameter("nombretb");
    String descripcion = request.getParameter("descriptb");
    
    TiposBicicleta tb = new TiposBicicleta(nombre, descripcion);
    new ControladorBicicletas().altaTipoBicicleta(tb);
    response.sendRedirect("admbici.jsp");
  }

   @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}

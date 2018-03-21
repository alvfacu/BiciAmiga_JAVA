package Servlets;

import Entidades.Modelos;
import Negocio.ControladorBicicletas;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PreReserva", urlPatterns = {"/PreReserva"})
public class PreReserva extends HttpServlet {

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
    try{
      String[] fechaReserva = request.getParameter("fechaReserva").split("-");
      int idModelo = Integer.valueOf(request.getParameter("idModeloReserva"));
      Modelos modReserva = new ControladorBicicletas().getModelo(idModelo);
      boolean completo = Boolean.valueOf(request.getParameter("completoReserva"));
      String importe = request.getParameter("importeReserva");
      
      if(!completo)
      {
        String desdeReserva = request.getParameter("hrDesdeReserva");
        String hastaReserva = request.getParameter("hrHastaReserva");
        request.setAttribute("desdeReserva", desdeReserva);
        request.setAttribute("hastaReserva", hastaReserva);
      }
      
      request.setAttribute("fechaReserva", fechaReserva[2]+"/"+fechaReserva[1]+"/"+fechaReserva[0]);
      request.setAttribute("modeloReserva", modReserva);
      request.setAttribute("completoReserva", completo);
      request.setAttribute("importeReserva", importe);
      request.getRequestDispatcher("prereserva.jsp").forward(request, response);
    }
    catch(Exception ex)
    { 
      response.sendRedirect("error.jsp");
    }
    
    
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}

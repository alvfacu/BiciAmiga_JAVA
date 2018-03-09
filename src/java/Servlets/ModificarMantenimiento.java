package Servlets;

import Entidades.DetallesMantenimiento;
import Entidades.Mantenimientos;
import Negocio.ControladorBicicletas;
import Negocio.ControladorMantenimientos;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModificarMantenimiento", urlPatterns = {"/ModificarMantenimiento"})
public class ModificarMantenimiento extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {    
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    int idMant = Integer.valueOf(request.getParameter("idMant"));
    Mantenimientos m = new ControladorMantenimientos().getMantenimientos(idMant);
    m.setObservacion(request.getParameter("obs"));
    double kme = 0;
    
    String[] values = request.getParameterValues("checkbox");
    int cantReq = Integer.valueOf(request.getParameter("cantReq"));    
            
    ArrayList<DetallesMantenimiento> detalles = new ControladorMantenimientos().getDetMantenimientosXMantenimiento(idMant);
    for(int i = 0; i < detalles.size(); i++)
    {
      if(Arrays.asList(values).contains(String.valueOf(detalles.get(i).getTipo().getId())))
        detalles.get(i).setCompletado(true);
      else
        detalles.get(i).setCompletado(false);
      
      new ControladorMantenimientos().modificarDetalleMant(detalles.get(i));
    }
    
    if(values.length==cantReq)
    {
      kme = Double.valueOf(request.getParameter("km_egreso"));
      String[] fechae = request.getParameter("fec_egreso").split("\\/");
      String[] horae = request.getParameter("hr_egreso").split("\\:");
      int hora = Integer.valueOf(horae[0]);
      int min = Integer.valueOf(horae[1]);
      int dia = Integer.valueOf(fechae[0]);
      int mes  = Integer.valueOf(fechae[1]);
      int anio  = Integer.valueOf(fechae[2]);
      Calendar fecha = Calendar.getInstance();
      fecha.set(anio, (mes-1), dia, hora, min,0);
      
      m.setFechaEgreso(fecha.getTime());
      m.setKmEgreso(kme);
    }
    
    new ControladorMantenimientos().modificarMantenimiento(m);
    
    if(values.length==cantReq)
    {
      m.getBici().setDisponible(true);
      m.getBici().setKmDsdMantenimiento(0);
      m.getBici().setKmEnViaje(kme);
      new ControladorBicicletas().modificarBicicleta(m.getBici());
    }
    
    response.sendRedirect("admmant.jsp");

  }
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}

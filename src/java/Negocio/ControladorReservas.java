package Negocio;

import Datos.CatalogoReservas;
import Entidades.EstadosReserva;
import Entidades.Reservas;
import Entidades.Usuarios;
import java.util.ArrayList;

public class ControladorReservas {
  
  CatalogoReservas cr;
  
  public ControladorReservas() {
    this.cr = new CatalogoReservas();
  }

  public ArrayList<Reservas> getReservas() {
    return cr.getReservas();
  }
  
  public ArrayList<Reservas> getReservasPendientes() {
    return cr.getReservasNoFinalizadas(EstadosReserva.PENDIENTE.getId());
  }
  
  public ArrayList<Reservas> getReservasEnCurso() {
    return cr.getReservasNoFinalizadas(EstadosReserva.ENCURSO.getId());
  }
  
  public ArrayList<Reservas> getReservasFinalizados() {
    return cr.getReservasFinalizadas2();
  }
 
  public ArrayList<Reservas> getReservasPendientesXUsr(Usuarios usr){
    return cr.getReservasPendientesXUsr2(usr.getId());
  }
  
  public ArrayList<Reservas> getReservasFinalizadasXUsr(Usuarios usr){
    return cr.getReservasFinalizadasXUsr2(usr.getId());
  }
  
  public Reservas getReserva(int id) {
    return cr.getReserva(id);
  }

  public void altaReserva(Reservas r) {
    cr.altaReserva(r);
  }

  public void bajaReserva(Reservas r){
    cr.bajaReserva(r);
  }

  public void modificarReserva(Reservas r){
    cr.modificarReserva(r);
  }

  public void cancelarReserva(int idReserva) {
    cr.cancelarReserva(idReserva);
  }
 
  public boolean finalizarReserva(int idReserva) {
    Reservas rActual = cr.getReserva(idReserva);
    if(rActual!=null)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
}

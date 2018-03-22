package Negocio;

import Datos.CatalogoReservas;
import Entidades.Reservas;
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
    return cr.getReservasPendientes();
  }
  
  public ArrayList<Reservas> getReservasEnCurso() {
    return cr.getReservasPendientes();
  }
  
  public ArrayList<Reservas> getReservasFinalizados() {
    return cr.getReservasFinalizadas();
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
}

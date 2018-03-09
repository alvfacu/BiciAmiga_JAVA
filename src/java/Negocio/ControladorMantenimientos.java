package Negocio;

import Datos.CatalogoMantenimientos;
import Datos.CatalogoTiposMantenimiento;
import Entidades.DetallesMantenimiento;
import Entidades.Mantenimientos;
import Entidades.TiposMantenimiento;
import java.util.ArrayList;

public class ControladorMantenimientos {
  CatalogoTiposMantenimiento ctm;
  CatalogoMantenimientos cm;

  public ControladorMantenimientos() {
    this.ctm = new CatalogoTiposMantenimiento();
    this.cm = new CatalogoMantenimientos();
  }

  public ArrayList<Mantenimientos> getMantenimientos() {
    return cm.getMantenimientos();
  }
   
  public Mantenimientos getMantenimientos(int id) {
    return cm.getMantenimiento(id);
  }

  public void altaMantenimiento(Mantenimientos m) {
    cm.altaMantenimiento(m);
  }

  public void bajaMantenimiento(Mantenimientos m){
    cm.bajaMantenimientos(m);
  }

  public void modificarMantenimiento(Mantenimientos m){
    cm.modificarMantenimiento(m);
  }

  public ArrayList<TiposMantenimiento> getTiposMantenimientos() {
    return ctm.getTipos();
  }
   
  public TiposMantenimiento getTiposMantenimiento(int id) {
    return ctm.getTipo(id);
  }

  public void altaTipoMantenimiento(TiposMantenimiento tm){
    ctm.altaTipoMantenimiento(tm);
  }

  public void bajaTipoMantenimiento(TiposMantenimiento tm){
    ctm.bajaTipoMantenimiento(tm);
  }

  public void modificarTipoMantenimiento(TiposMantenimiento tm) {
    ctm.modificarTipoMantenimiento(tm);
  }

  public int existenMantenimientosXTipo(String id) {
    return ctm.existenMantenXTipo(id);
  }
  
  public ArrayList<Mantenimientos> getMantenimientosActivos(){
    return cm.getMantenimientosActivos();
  }
  
  public ArrayList<Mantenimientos> getMantenimientosFinalizados(){
    return cm.getMantenimientosFinalizados();
  }

  public void altaDetalleMant(DetallesMantenimiento det) {
    cm.altaDetalleMant(det);
  }
  
  public ArrayList<DetallesMantenimiento> getDetMantenimientosXMantenimiento(int idMant){
    return cm.getDetMantenimientosxMantenimiento(idMant);
  }

  public DetallesMantenimiento getDetMantenimiento(int idMant, int idTipo) {
    return cm.getDetMantenimiento(idMant,idTipo);
  }

  public void modificarDetalleMant(DetallesMantenimiento det) {
    cm.modificarDetalleMant(det);
  }
}

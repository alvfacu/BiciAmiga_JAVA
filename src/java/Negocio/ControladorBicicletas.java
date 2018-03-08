package Negocio;

import Datos.CatalogoBicicletas;
import Datos.CatalogoModelos;
import Datos.CatalogoTiposBicicletas;
import Entidades.Bicicletas;
import Entidades.TiposBicicleta;
import Entidades.Modelos;
import java.util.ArrayList;

public class ControladorBicicletas {
  CatalogoBicicletas cb;
  CatalogoTiposBicicletas ctb;
  CatalogoModelos cm;

  public ControladorBicicletas() {
    this.cb = new CatalogoBicicletas();
    this.ctb = new CatalogoTiposBicicletas();
    this.cm = new CatalogoModelos();
  }

  public ArrayList<Bicicletas> getBicicletas() {
    return cb.getBicicletas();
  }
   
  public Bicicletas getBicicleta(int patente) {
    return cb.getBicicleta(patente);
  }

  public void altaBicicleta(Bicicletas b) {
    cb.altaBicicleta(b);
  }

  public void bajaBicicleta(Bicicletas b) {
    cb.bajaBicicleta(b);
  }

  public void modificarBicicleta(Bicicletas b) {
    cb.modificarBicicleta(b);
  }

  public int existePatente(String patente) {
    return cb.existeBicicleta(patente);
  }
      
  public ArrayList<TiposBicicleta> getTiposBicicleta() {
    return ctb.getTipos();
  }
   
  public TiposBicicleta getTipo(int id) {
    return ctb.getTipo(id);
  }

  public void altaTipoBicicleta(TiposBicicleta tb){
    ctb.altaTipoBicicleta(tb);
  }

  public void bajaTipoBicicleta(TiposBicicleta tb){
    ctb.bajaTipoBicicleta(tb);
  }

  public void modificarTipoBicicleta(TiposBicicleta tb) {
    ctb.modificarTipoBicicleta(tb);
  }

  public int existenBicicletasXTipo(String idModelo) {
    return cb.existenBicicletasXModelo(idModelo);
  }

  public ArrayList<Modelos> getModelos(){
    return cm.getModelos();
  }
  
  public Modelos getModelo(int id){
    return cm.getModelo(id);
  }
  
  public void altaModelo(Modelos m){
    cm.altaModelo(m);
  }

  public void bajaModelo(Modelos m){
    cm.bajaModelo(m);
  }
  
  public void modificarModelo(Modelos m){
    cm.modificarModelo(m);
  }
  
  public int existenModelosXTipo(String id){
    return cm.existenModelosXTipo(id);
  }
  
  public String dameUrl(String idModelo){
    return cm.dameUrl(idModelo);
  }
  
  public ArrayList<Bicicletas> getBicicletasParaMantenimiento(){
    return cb.getBicicletasParaMantenimiento();
  }

  public void habilitarBicicleta(boolean estado, Bicicletas bici) {
    cb.habilitarBicicleta(estado,bici);
  }

}

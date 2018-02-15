package Entidades;

import java.sql.Date;

public class Mantenimientos {
  private TiposMantenimiento tipo;
  private Bicicletas bici;
  private Date fechaIngreso;
  private Date fechaEgreso;
  private String observacion;
  private double kmIngreso;
  private double kmEgreso;
  private int id;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
  
  public TiposMantenimiento getTipo() {
    return tipo;
  }

  public void setTipo(TiposMantenimiento tipo) {
    this.tipo = tipo;
  }

  public Bicicletas getBici() {
    return bici;
  }

  public void setBici(Bicicletas bici) {
    this.bici = bici;
  }

  public Date getFechaIngreso() {
    return fechaIngreso;
  }

  public void setFechaIngreso(Date fechaIngreso) {
    this.fechaIngreso = fechaIngreso;
  }

  public Date getFechaEgreso() {
    return fechaEgreso;
  }

  public void setFechaEgreso(Date fechaEgreso) {
    this.fechaEgreso = fechaEgreso;
  }

  public String getObservacion() {
    return observacion;
  }

  public void setObservacion(String observacion) {
    this.observacion = observacion;
  }

  public double getKmIngreso() {
    return kmIngreso;
  }

  public void setKmIngreso(double kmIngreso) {
    this.kmIngreso = kmIngreso;
  }

  public double getKmEgreso() {
    return kmEgreso;
  }

  public void setKmEgreso(double kmEgreso) {
    this.kmEgreso = kmEgreso;
  }

  public Mantenimientos() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  public Mantenimientos(TiposMantenimiento tipo, Bicicletas bici, Date fechaIngreso, Date fechaEgreso, String observacion, double kmIngreso, double kmEgreso, int id) {
    this.tipo = tipo;
    this.bici = bici;
    this.fechaIngreso = fechaIngreso;
    this.fechaEgreso = fechaEgreso;
    this.observacion = observacion;
    this.kmIngreso = kmIngreso;
    this.kmEgreso = kmEgreso;
    this.id = id;
  }
  
  
}
package Entidades;

public class TiposMantenimiento {
  
  private int id;
  private double kmParaMantenimiento;
  private boolean obligatorio;
  private String descripcion;

  public TiposMantenimiento() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  public double getKmParaMantenimiento() {
    return kmParaMantenimiento;
  }

  public void setKmParaMantenimiento(double kmParaMantenimiento) {
    this.kmParaMantenimiento = kmParaMantenimiento;
  }

  public boolean isObligatorio() {
    return obligatorio;
  }

  public void setObligatorio(boolean obligatorio) {
    this.obligatorio = obligatorio;
  } 

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public TiposMantenimiento(int id, double kmParaMantenimiento, boolean obligatorio, String descripcion) {
    this.id = id;
    this.kmParaMantenimiento = kmParaMantenimiento;
    this.obligatorio = obligatorio;
    this.descripcion = descripcion;
  }
  
  
  
}

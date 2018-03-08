package Entidades;

import java.util.Date;

public class DetallesMantenimiento {
  private Mantenimientos mantenimiento;
  private TiposMantenimiento tipo;
  private Date fecha;
  private double km;

  public Mantenimientos getMantenimiento() {
    return mantenimiento;
  }

  public void setMantenimiento(Mantenimientos mantenimiento) {
    this.mantenimiento = mantenimiento;
  }

  public TiposMantenimiento getTipo() {
    return tipo;
  }

  public void setTipo(TiposMantenimiento tipo) {
    this.tipo = tipo;
  }

  public Date getFecha() {
    return fecha;
  }

  public void setFecha(Date fecha) {
    this.fecha = fecha;
  }

  public double getKm() {
    return km;
  }

  public void setKm(double km) {
    this.km = km;
  }
  
  public DetallesMantenimiento(Mantenimientos mantenimiento, TiposMantenimiento tipo, Date fecha, double km) {
    this.mantenimiento = mantenimiento;
    this.tipo = tipo;
    this.fecha = fecha;
    this.km = km;
  }
}

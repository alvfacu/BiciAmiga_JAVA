package Entidades;

import java.text.DecimalFormat;

public class Bicicletas {
  
  private String patente;
  private int id;
  private String descripcion;
  private TiposBicicleta tipo;
  private boolean disponible;
  private double kmEnViaje;
  private double kmDsdMantenimiento;  
  private final DecimalFormat df2 = new DecimalFormat("0.00");

  public Bicicletas(int id, String patente, String descripcion, TiposBicicleta tb, Boolean disp, double kmViaje, double kmMant) {
    this.id = id;
    this.patente = patente;
    this.descripcion = descripcion;
    this.tipo = tb;
    this.disponible = disp;
    this.kmEnViaje = kmViaje;
    this.kmDsdMantenimiento = kmMant;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
  
  public double getKmEnViaje() {
    return kmEnViaje;
    
  }
  
  public String getKmViaje()
  {
    return df2.format(kmEnViaje);
  }

  public void setKmEnViaje(double kmRecorridosEnViaje) {
    this.kmEnViaje = kmRecorridosEnViaje;
  }

  public double getKmDsdMantenimiento() {
    return kmDsdMantenimiento;
  }

  public String getKmMantenimiento()
  {
    return df2.format(kmDsdMantenimiento);
  }
  public void setKmDsdMantenimiento(double kmRecorridosDsdMantenimiento) {
    this.kmDsdMantenimiento = kmRecorridosDsdMantenimiento;
  }

  public Bicicletas(String placa, String descripcion, TiposBicicleta tipo, boolean disponible, double kmRecorridosEnViaje, double kmRecorridosDsdMantenimeinto) {
    this.patente = placa;
    this.descripcion = descripcion;
    this.tipo = tipo;
    this.disponible = disponible;
    this.kmEnViaje = kmRecorridosEnViaje;
    this.kmDsdMantenimiento = kmRecorridosDsdMantenimeinto;
  }

  public Bicicletas() {  }

  public String getPatente() {
    return patente;
  }

  public void setPatente(String placa) {
    this.patente = placa;
  }  

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public TiposBicicleta getTipo() {
    return tipo;
  }

  public void setTipo(TiposBicicleta tipo) {
    this.tipo = tipo;
  }

  public boolean isDisponible() {
    return disponible;
  }

  public void setDisponible(boolean disponible) {
    this.disponible = disponible;
  }
  
}

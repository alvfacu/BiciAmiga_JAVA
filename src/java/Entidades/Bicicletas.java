package Entidades;

public class Bicicletas {
  
  private int patente;
  private String descripcion;
  private TiposBicicleta tipo;
  private boolean disponible;
  private double kmRecorridosEnViaje;
  private double kmRecorridosDsdMantenimeinto;

  public Bicicletas(int placa, String descripcion, TiposBicicleta tipo, boolean disponible, double kmRecorridosEnViaje, double kmRecorridosDsdMantenimeinto) {
    this.patente = placa;
    this.descripcion = descripcion;
    this.tipo = tipo;
    this.disponible = disponible;
    this.kmRecorridosEnViaje = kmRecorridosEnViaje;
    this.kmRecorridosDsdMantenimeinto = kmRecorridosDsdMantenimeinto;
  }

  public Bicicletas() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  public int getPatente() {
    return patente;
  }

  public void setPatente(int placa) {
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

  public double getKmRecorridosEnViaje() {
    return kmRecorridosEnViaje;
  }

  public void setKmRecorridosEnViaje(double kmRecorridosEnViaje) {
    this.kmRecorridosEnViaje = kmRecorridosEnViaje;
  }

  public double getKmRecorridosDsdMantenimeinto() {
    return kmRecorridosDsdMantenimeinto;
  }

  public void setKmRecorridosDsdMantenimeinto(double kmRecorridosDsdMantenimeinto) {
    this.kmRecorridosDsdMantenimeinto = kmRecorridosDsdMantenimeinto;
  }
  
  

}

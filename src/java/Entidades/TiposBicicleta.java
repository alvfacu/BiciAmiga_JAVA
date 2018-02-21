package Entidades;

public class TiposBicicleta {
  
  private int id;
  private String tipo;
  private double precioXHr;
  private double precioXDia;

  public TiposBicicleta(String tipo, double preciohr, double preciodia) {
    this.tipo = tipo;
    this.precioXHr = preciohr;
    this.precioXDia = preciodia;  }

  public double getPrecioXHr() {
    return precioXHr;
  }

  public void setPrecioXHr(double precioXHr) {
    this.precioXHr = precioXHr;
  }

  public double getPrecioXDia() {
    return precioXDia;
  }

  public void setPrecioXDia(double precioXDia) {
    this.precioXDia = precioXDia;
  }
    
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getNombre() {
    return tipo;
  }

  public void setNombre(String tipo) {
    this.tipo = tipo;
  }

  public TiposBicicleta() {
  }

  public TiposBicicleta(int id, String tipo, double precioXHr, double precioXDia) {
    this.id = id;
    this.tipo = tipo;
    this.precioXHr = precioXHr;
    this.precioXDia = precioXDia;
  }

  
  
}

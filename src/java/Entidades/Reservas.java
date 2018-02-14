package Entidades;

import java.sql.Date;

public class Reservas {
  
  private Usuarios cliente;
  private Bicicletas bici;
  private int id;
  private Date fechaSolicitud, fechaComienzo, fechaFinalizacion;  
  private double importe;
  private String observacion;
  private EstadosReserva estado;
  private double kmRecorridos;
  
  public Reservas(Usuarios cliente, Bicicletas bici, int id, Date fechaSolicitud, Date fechaComienzo, Date fechaFinalizacion, double importe, String observacion, EstadosReserva estado, double kmRecorridos) {
    this.cliente = cliente;
    this.bici = bici;
    this.id = id;
    this.fechaSolicitud = fechaSolicitud;
    this.fechaComienzo = fechaComienzo;
    this.fechaFinalizacion = fechaFinalizacion;
    this.importe = importe;
    this.observacion = observacion;
    this.estado = estado;
    this.kmRecorridos = kmRecorridos;
  }

  public Reservas() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  
  
  public Usuarios getCliente() {
    return cliente;
  }

  public void setCliente(Usuarios cliente) {
    this.cliente = cliente;
  }

  public Bicicletas getBici() {
    return bici;
  }

  public void setBici(Bicicletas bici) {
    this.bici = bici;
  }

  public Date getFechaSolicitud() {
    return fechaSolicitud;
  }

  public void setFechaSolicitud(Date fechaSolicitud) {
    this.fechaSolicitud = fechaSolicitud;
  }

  public Date getFechaComienzo() {
    return fechaComienzo;
  }

  public void setFechaComienzo(Date fechaComienzo) {
    this.fechaComienzo = fechaComienzo;
  }

  public Date getFechaFinalizacion() {
    return fechaFinalizacion;
  }

  public void setFechaFinalizacion(Date fechaFinalizacion) {
    this.fechaFinalizacion = fechaFinalizacion;
  }

  public double getImporte() {
    return importe;
  }

  public void setImporte(double importe) {
    this.importe = importe;
  }

  public String getObservacion() {
    return observacion;
  }

  public void setObservacion(String observacion) {
    this.observacion = observacion;
  }

  public EstadosReserva getEstado() {
    return estado;
  }

  public void setEstado(EstadosReserva estado) {
    this.estado = estado;
  }

  public double getKmRecorridos() {
    return kmRecorridos;
  }

  public void setKmRecorridos(double kmRecorridos) {
    this.kmRecorridos = kmRecorridos;
  }
  
  
     
}

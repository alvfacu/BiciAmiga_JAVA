package Entidades;

import java.util.HashMap;
import java.util.Map;

public enum EstadosReserva {
  PENDIENTE(1),
  ENCURSO(2),
  CANCELADO(3),
  FINALIZADO(4),
  DESCONOCIDO(0);
  
  private static final Map<Integer, EstadosReserva> MY_MAP = new HashMap<Integer, EstadosReserva>();
  static {
    for (EstadosReserva myEnum : values()) {
      MY_MAP.put(myEnum.getId(), myEnum);
    }
  }
    
  private final int id;

  private EstadosReserva(int id) {
      this.id = id;
  }

  public int getId() {
      return id;
  }
  
  public static EstadosReserva getXId(int id) {
    return MY_MAP.get(id);
  }

}

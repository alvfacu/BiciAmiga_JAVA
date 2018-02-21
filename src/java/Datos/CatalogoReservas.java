package Datos;

import Entidades.Bicicletas;
import Entidades.EstadosReserva;
import Entidades.Reservas;
import Entidades.Usuarios;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoReservas {
  public ArrayList<Reservas> getReservas() {
    ArrayList<Reservas> reservas = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from reservas";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Reservas r = new Reservas();        
        r.setId(rs.getInt("id"));
        Bicicletas b = new CatalogoBicicletas().getBicicleta(rs.getInt("id_bici"));
        r.setBici(b);
        Usuarios u = new CatalogoUsuarios().getUsuario(rs.getInt("id_usr"));
        r.setCliente(u);
        r.setEstado(EstadosReserva.getXId(rs.getInt("estado")));
        r.setFechaSolicitud(rs.getDate("fecha_solic"));
        r.setFechaComienzo(rs.getDate("fecha_comin"));
        r.setFechaFinalizacion(rs.getDate("fecha_fin"));
        r.setImporte(rs.getDouble("importe"));
        r.setKmRecorridos(rs.getDouble("km_totales"));
        r.setObservacion(rs.getString("obs"));
        reservas.add(r);
      }
    } catch (SQLException e1) {
      e1.printStackTrace();
    } finally {
      try {
        if (sentencia != null) {
          sentencia.close();
        }
        if (rs != null) {
          rs.close();
        }
        ConexionBD.getInstancia().CloseConn();
      } catch (SQLException e2) {
        e2.printStackTrace();
      }
    }
    return reservas;
  }

  public Reservas getReserva(int id) {    
    PreparedStatement sentencia = null;
    ResultSet rs = null;
    Reservas r = null;
    String sql = "select * from reservas where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        r = new Reservas();        
        r.setId(rs.getInt("id"));
        Bicicletas b = new CatalogoBicicletas().getBicicleta(rs.getInt("id_bici"));
        r.setBici(b);
        Usuarios u = new CatalogoUsuarios().getUsuario(rs.getInt("id_usr"));
        r.setCliente(u);
        r.setEstado(EstadosReserva.getXId(rs.getInt("estado")));
        r.setFechaSolicitud(rs.getDate("fecha_solic"));
        r.setFechaComienzo(rs.getDate("fecha_comin"));
        r.setFechaFinalizacion(rs.getDate("fecha_fin"));
        r.setImporte(rs.getDouble("importe"));
        r.setKmRecorridos(rs.getDouble("km_totales"));
        r.setObservacion(rs.getString("obs"));     
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return r;
  }

  public void altaReserva(Reservas r) {
    PreparedStatement sentencia = null;
    ResultSet rs=null;
    String sql = "insert into reservas(patente,id_usr,estado,fecha_solic,fecha_comin,fecha_fin,importe,km_totales,obs) "
            + "values(?,?,?,?,?,?,?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setInt(1,r.getBici().getId());
      sentencia.setInt(2,r.getCliente().getId());
      sentencia.setInt(3,r.getEstado().getId());
      sentencia.setDate(4, r.getFechaSolicitud());
      sentencia.setDate(5, r.getFechaComienzo());
      sentencia.setDate(6, r.getFechaFinalizacion());
      sentencia.setDouble(7,r.getImporte());
      sentencia.setDouble(8,r.getKmRecorridos());
      sentencia.setString(9,r.getObservacion());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        r.setId(rs.getInt(1));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (sentencia != null && !sentencia.isClosed()) {
          sentencia.close();
        }
        ConexionBD.getInstancia().CloseConn();
      } catch (SQLException sqle) {
        sqle.printStackTrace();
      }
    }
  }

  public void bajaReserva(Reservas r) {
    PreparedStatement sentencia = null;
    String sql = "delete from reservas where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, r.getId());
      sentencia.execute();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (sentencia != null && !sentencia.isClosed()) {
          sentencia.close();
        }
        ConexionBD.getInstancia().CloseConn();

      } catch (SQLException e2) {
        e2.printStackTrace();
      }
    }

  }

  public void modificarReserva(Reservas r) {
    PreparedStatement sentencia = null;
    String sql = "update reservas set patente=?, id_usr=?, estado=?, fecha_solic=?, fecha_comin=?, fecha_fin=? "
            +"importe=?, km_totales=?, obs=? where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, r.getBici().getId());
      sentencia.setInt(2, r.getCliente().getId());
      sentencia.setInt(3, r.getEstado().getId());
      sentencia.setDate(4, r.getFechaSolicitud());
      sentencia.setDate(5, r.getFechaComienzo());
      sentencia.setDate(6, r.getFechaFinalizacion());
      sentencia.setDouble(7, r.getImporte());
      sentencia.setDouble(8, r.getImporte());
      sentencia.setString(9, r.getObservacion());
      sentencia.setInt(10,r.getId());
      sentencia.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (sentencia != null && !sentencia.isClosed()) {
          sentencia.close();
        }
        ConexionBD.getInstancia().CloseConn();
      } catch (SQLException e2) {
        e2.printStackTrace();
      }
    }
  }
}

package Datos;

import Entidades.Modelos;
import Entidades.TiposBicicleta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoModelos {
  
  public ArrayList<Modelos> getModelos() {
    ArrayList<Modelos> modelos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from modelos";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Modelos m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
        modelos.add(m);
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
    return modelos;
  }

  public Modelos getModelo(int id) {    
    PreparedStatement sentencia;
    ResultSet rs;
    Modelos m = null;
    String sql = "select * from modelos where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return m;
  }

  public void altaModelo(Modelos m) {
    PreparedStatement sentencia = null;
    ResultSet rs;
    String sql = "insert into modelos(nombre,descrip,precio_hr,precio_dia,url1,url2,url3,id_tipo) "
            + "values(?,?,?,?,?,?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setString(1,m.getNombre());
      sentencia.setString(2,m.getCaracteristicas_gral());
      sentencia.setDouble(3,m.getPrecioXHr());
      sentencia.setDouble(4,m.getPrecioXDia());
      sentencia.setString(5,m.getUrl1());
      sentencia.setString(6,m.getUrl2());
      sentencia.setString(7,m.getUrl3());
      sentencia.setInt(8,m.getTipo().getId());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        m.setId(rs.getInt(1));
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

  public void bajaModelo(Modelos m) {
    PreparedStatement sentencia = null;
    String sql = "delete from modelos where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, m.getId());
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

  public void modificarModelo(Modelos m) {
    PreparedStatement sentencia = null;
    String sql = "update modelos set nombre=?, descrip=?, precio_hr=?, precio_dia=?, url1=?, url2=?, url3=?, id_tipo=?"
            + " where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, m.getNombre());
      sentencia.setString(2, m.getCaracteristicas_gral());
      sentencia.setDouble(3, m.getPrecioXHr());
      sentencia.setDouble(4, m.getPrecioXDia());
      sentencia.setString(5, m.getUrl1());
      sentencia.setString(6, m.getUrl2());
      sentencia.setString(7, m.getUrl3());
      sentencia.setInt(8, m.getTipo().getId());
      sentencia.setInt(9, m.getId());
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
  
  public int existenModelosXTipo(String idTipo) {
    PreparedStatement sentencia;
    ResultSet rs;
    
    String sql = "select count(*) from modelos where id_tipo=?";
    int cont = 0;
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, idTipo);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        cont = rs.getInt(1);     
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return cont;
  }

  public String dameUrl(String idModelo) {
    PreparedStatement sentencia;
    ResultSet rs;
    
    String sql = "select url1 from modelos where id=?";
    String url = "";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, idModelo);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        url = rs.getString(1);    
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return url;
  }

  public ArrayList<Modelos> getModelosDisponiblesXTipoXModelo(int tipo, int modelo) {
    ArrayList<Modelos> modelos = new ArrayList<>();
    Statement sentencia;
    ResultSet rs;
    String sql = "select m.* from modelos m inner join bicicletas b on b.id_modelo=m.id WHERE b.disponible=true AND m.id_tipo="+tipo+" AND m.id="+modelo+" GROUP BY m.id";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Modelos m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
        modelos.add(m);
      }
    } catch (SQLException e1) {
      e1.printStackTrace();
    } finally {
      ConexionBD.getInstancia().CloseConn();
    }
    return modelos;
  }

  public ArrayList<Modelos> getModelosDisponiblesXTipo(int tipo) {
    ArrayList<Modelos> modelos = new ArrayList<>();
    Statement sentencia;
    ResultSet rs;
    String sql = "select m.* from modelos m inner join bicicletas b on b.id_modelo=m.id WHERE b.disponible=true AND m.id_tipo="+tipo+" GROUP BY m.id";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Modelos m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
        modelos.add(m);
      }
    } catch (SQLException e1) {
      e1.printStackTrace();
    } finally {
      ConexionBD.getInstancia().CloseConn();
    }
    return modelos;
  }

  public ArrayList<Modelos> getModelosDisponibles() {
    ArrayList<Modelos> modelos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select m.* from modelos m inner join bicicletas b on b.id_modelo=m.id WHERE b.disponible=true GROUP BY m.id";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Modelos m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
        modelos.add(m);
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
    return modelos;
  }

  public ArrayList<Modelos> getModelosDisponiblesXModelo(int modelo) {
    ArrayList<Modelos> modelos = new ArrayList<>();
    Statement sentencia;
    ResultSet rs;
    String sql = "select m.* from modelos m inner join bicicletas b on b.id_modelo=m.id WHERE b.disponible=true AND m.id="+modelo+" GROUP BY m.id";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Modelos m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
        modelos.add(m);
      }
    } catch (SQLException e1) {
      e1.printStackTrace();
    } finally {
      ConexionBD.getInstancia().CloseConn();
    }
    return modelos;
  }

  public ArrayList<Modelos> getModelosXTipo(int tipo) {
    ArrayList<Modelos> modelos = new ArrayList<>();
    Statement sentencia;
    ResultSet rs;
    String sql = "select * from modelos WHERE id_tipo="+tipo;
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Modelos m = new Modelos();
        m.setId(rs.getInt("id"));
        m.setNombre(rs.getString("nombre"));
        m.setCaracteristicas_gral(rs.getString("descrip"));
        m.setPrecioXHr(rs.getDouble("precio_hr"));
        m.setPrecioXDia(rs.getDouble("precio_dia"));
        m.setUrl1(rs.getString("url1"));
        m.setUrl2(rs.getString("url2"));
        m.setUrl3(rs.getString("url3"));
        TiposBicicleta tb = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tb);
        modelos.add(m);
      }
    } catch (SQLException e1) {
      e1.printStackTrace();
    } finally {
      ConexionBD.getInstancia().CloseConn();
    }
    return modelos;
  }
}

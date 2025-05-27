package model;

import javax.swing.table.DefaultTableModel;
import java.sql.*;

public class PanelMatriculaBD {

    public void cargarMatriculas(DefaultTableModel modelo) {
        modelo.setRowCount(0);
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "SELECT cod_estudiante, cod_curso, nota_curso FROM matricula";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] fila = {
                    rs.getString("cod_estudiante"),
                    rs.getString("cod_curso"),
                    rs.getDouble("nota_curso")
                };
                modelo.addRow(fila);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean insertarMatricula(String estudiante, String curso, Double nota) {
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "INSERT INTO matricula (cod_estudiante, cod_curso, nota_curso) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, estudiante);
            ps.setString(2, curso);
            ps.setDouble(3, nota);

            int resultado = ps.executeUpdate();

            ps.close();
            con.close();

            return resultado > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
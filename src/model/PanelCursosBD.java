package model;

import javax.swing.table.DefaultTableModel;
import java.sql.*;

public class PanelCursosBD {

    public void cargarCursos(DefaultTableModel modelo) {
        modelo.setRowCount(0);
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "SELECT cod_curso, nom_curso, cod_docente FROM cursos";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] fila = {
                    rs.getString("cod_curso"),
                    rs.getString("nom_curso"),
                    rs.getString("cod_docente")
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

    public boolean insertarCurso(String codigo, String nombre, String docente) {
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "INSERT INTO cursos (cod_curso, nom_curso, cod_docente) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, codigo);
            ps.setString(2, nombre);
            ps.setString(3, docente);

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
package dao;

import java.sql.*;
import model.Admin;

public class AdminDao {

    Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }

    public Admin getAdminByEmailAndPasword(String email, String password) {
        Admin admin = null;

        try {

            String quary = "select * from admin where email=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(quary);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;

    }

    public boolean saveAdmin(Admin admin) {
        boolean f = false;

        try {

            String quary = "insert into admin(name,email,password) values(?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(quary);
            
            
            ps.setString(1, admin.getName());
            ps.setString(2, admin.getEmail());
            ps.setString(3, admin.getPassword());

            ps.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}

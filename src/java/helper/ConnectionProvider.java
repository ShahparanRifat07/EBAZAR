package helper;

import java.sql.*;

public class ConnectionProvider {

    public static Connection con;

    public static Connection conProvider() {

        try {

            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eshop","root","");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}

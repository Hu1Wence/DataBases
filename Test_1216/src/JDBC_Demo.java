import java.sql.*;

public class JDBC_Demo {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/homework";
            String username = "root";
            String password = "123456";

            Connection con = DriverManager.getConnection(url,username,password);
            System.out.println(con);
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

import java.sql.*;

public class Demo {
    public static void main(String[] args) throws SQLException {
        Connection con = null;//链接接口
        Statement stmt = null;//发送sql接口
        ResultSet rs = null;//结果集接口
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homework","root", "123456");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from emp");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString(2);
                String role = rs.getString("role");
                double salary = rs.getDouble(4);
                System.out.println("编号 = " + id + " 姓名 = " + name
                + " 角色 = " + role + " 工资 = " + salary);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}

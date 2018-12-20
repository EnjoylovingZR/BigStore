package com.RuoLiang;

import java.sql.*;

public class UserSignin {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    private String name;
    private String password;
    private String email;

    private int flag = 0;

    public void SignIn(String email,String password) {
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName(JDBC_DRIVER);

            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("开始检验登录···");
            stmt = conn.createStatement();
            String sql;
            sql = "select * from myuser";
            ResultSet rs = stmt.executeQuery(sql);
            rs.last();
            int size = rs.getRow();
            rs.beforeFirst();

            while(rs.next()){
                if (rs.getString("UEmail").equals(email) && rs.getString("UPassword").equals(password)) {
                    flag = 1;
                    System.out.println(email+" 登录成功！");
                    name = rs.getString("UName");
                }
            }

            stmt.close();
            conn.close();
            System.out.println("关闭连接···");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getFlag() {
        return flag;
    }
    public String getName() {
        return name;
    }
}

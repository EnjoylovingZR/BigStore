package com.RuoLiang;

import java.sql.*;

public class GetUser {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    User user = new User();

    public User GetTheSelect(String email){
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName(JDBC_DRIVER);

            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("开始获取用户信息···");
            stmt = conn.createStatement();
            String sql;
            sql = "select * from myuser where UEmail = '"+email+"'";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                user = new User(rs.getString("UName"),rs.getString("UPassword"),rs.getString("UEmail"),
                        Integer.parseInt(rs.getString("UBalance")));
            }

            stmt.close();
            conn.close();
            System.out.println("关闭连接···");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}

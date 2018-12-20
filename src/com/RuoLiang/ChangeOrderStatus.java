package com.RuoLiang;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ChangeOrderStatus {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    private int flag = 0;



    public void changeIt(String email,int total){
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行命令
            System.out.println("开始修改订单状态···");
            stmt = conn.createStatement();
            String sql;
            sql = "update myorder set OStatus = 1 where OUEmail = '"+email+"' and OStatus = 0";
            String sql2;
            sql2 = "update myuser set UBalance = UBalance - '"+total+"' where UEmail = '"+email+"'";

            Integer rs = stmt.executeUpdate(sql);
            Integer rs2 = stmt.executeUpdate(sql2);
            if(rs == 1&&rs2 ==1){
                System.out.println("商品购买成功！");
                flag = 1;
            }
            else
                System.out.println("商品购买失败！");
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
}

package com.RuoLiang;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class AddCar {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    private int flag = 0;



    public void Add(String Email,int GID,int Num,int Status){
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行命令
            System.out.println("开始加入购入车···");
            stmt = conn.createStatement();
            String sql;
            sql = "insert into myorder (OUEmail,OGID,ONum,OStatus) " +
                    "values ('"+Email+"','"+GID+"','"+Num+"','"+Status+"')";

            System.out.println(sql);

            Integer rs = stmt.executeUpdate(sql);
            if(rs == 1){
                System.out.println("添加成功！");
                flag = 1;
            }
            else
                System.out.println("添加失败！");

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

package com.RuoLiang;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ChangeGood {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    private int flag = 0;



    public void changeIt(int gid,String name,int price,int num,String type,String url,String text){
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行命令
            System.out.println("开始修改商品···");
            stmt = conn.createStatement();
            String sql;
            sql = "update good set GName = '"+name+"',GPrice = '"+price+"',GCategorie='"+type+"'," +
                    "GNum = '"+num+"',GUrl='"+url+"',GText='"+text+"'  where GID = '"+gid+"'";

            Integer rs = stmt.executeUpdate(sql);
            if(rs == 1){
                System.out.println("修改成功！");
                flag = 1;
            }
            else
                System.out.println("修改失败！");
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

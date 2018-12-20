package com.RuoLiang;

import java.sql.*;

public class ChangeGoodNum {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    private int flag = 0;



    public void changeNum(){
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行命令
            System.out.println("开始修改商品数量···");
            stmt = conn.createStatement();

            String sql;
            sql = "select ONum,OGID from myorder where OStatus = 1";
            ResultSet rs = stmt.executeQuery(sql);
            int[] ONum = new int[100];
            int[] OGID = new int[100];
            int i = 0;
            while (rs.next()){
                ONum[i]=Integer.parseInt(rs.getString("ONum"));
                OGID[i]=Integer.parseInt(rs.getString("OGID"));
                i++;
            }

            String sql2;
            sql2 = "select GNum,GID from good";
            ResultSet rs2 = stmt.executeQuery(sql2);
            int[] GNum = new int[100];
            int[] GID = new int[100];
            int j = 0;
            while (rs2.next()){
                GNum[j]=Integer.parseInt(rs2.getString("GNum"));
                GID[j]=Integer.parseInt(rs2.getString("GID"));
                j++;
            }
            for (int l=0;l<=j;l++){
                for (int k=0;k<=i;k++){
                    if (GID[l]==OGID[k]){
                        GNum[l] = GNum[l] - ONum[k];
                        System.out.println(GNum[l]);
                    }
                }
            }

            String sql3;
            for (int l=0;l<=j;l++){
                sql3="update good set GNum = '"+GNum[l]+"' where GID = '"+GID[l]+"'";
                int rs3 = stmt.executeUpdate(sql3);
            }

            String sql4;
            sql4="update myorder set OStatus = 2 where OStatus = 1";
            stmt.executeUpdate(sql4);

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

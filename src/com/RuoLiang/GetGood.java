package com.RuoLiang;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GetGood {
    private String GID;
    private String GName;
    private Integer GPrice;
    private String Type;
    private String GUrl;
    private Integer GNum;

    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    List<Good> list = new ArrayList<Good>();

    public List<Good> GetIt(){
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName(JDBC_DRIVER);

            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("开始获取商品···");
            stmt = conn.createStatement();
            String sql;
            sql = "select * from good";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                Good good = new Good(rs.getString("GID"),rs.getString("GName"), Integer.parseInt(rs.getString("GPrice")),
                        rs.getString("GCategorie"),rs.getString("GUrl"),Integer.parseInt(rs.getString("GNum")),
                        rs.getString("GText"));
                list.add(good);
            }

/*            for (Good good : list){
                System.out.println(good.getGID()+good.getGName()+good.getGPrice());
            }*/

            stmt.close();
            conn.close();
            System.out.println("关闭连接···");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

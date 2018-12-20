package com.RuoLiang;

import org.ietf.jgss.Oid;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GetCar {
    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/bigstore";

    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    static final String PASS = "a123";

    private int thenum;

    List<Car> list = new ArrayList<Car>();

    public List<Car> GetIt(String email){
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName(JDBC_DRIVER);

            System.out.println("连接数据库···");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("开始获取购物车信息···");
            stmt = conn.createStatement();
            String sql;
            sql = "select * from myorder where OUEmail = '"+email+"'";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                Car car = new Car(Integer.parseInt(rs.getString("OID")),rs.getString("OUEmail"),Integer.parseInt(rs.getString("OGID")), Integer.parseInt(rs.getString("ONum")),
                        Integer.parseInt(rs.getString("OStatus")));
                list.add(car);
            }
            List<Car> list2 = new ArrayList<>();
            for (Car car:list){
                if (car.getOStatus()==0){
                    list2.add(car);
                }
            }
            thenum = list2.size();

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

    public int getThenum() {
        return thenum;
    }
}

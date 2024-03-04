package com.mycompany.studentmanagementapp.web.helper;

import java.sql.Connection;

import java.sql.DriverManager;

public class CP {

    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String username = "root";
            String pwd = "8372038023";
            String url = "jdbc:mysql://localhost:3306/SMA";

            con = DriverManager.getConnection(url, username, pwd);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}

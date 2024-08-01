package com.ay.connection;

import java.sql.Connection;
import java.sql.DriverManager;


    public class DBConnection {
        private static final String driver_classname = "com.mysql.cj.jdbc.Driver";
        private static final String url = "jdbc:mysql://localhost:3306/HOTEL";
        private static final String username = "root";
        private static final String password = "1234567@Bc";

        public static Connection getConnection() {
            Connection con = null;
            try {
                Class.forName(driver_classname);
                con = DriverManager.getConnection(url, username, password);
            } catch (Exception e) {

            }
            return con;
        }
    }


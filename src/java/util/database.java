/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mirza
 */
public class database {
    
     private static database instance;
    private static Connection con;
    
    private database () {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            con = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e-commerce?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "admin");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static database getInstance() {
        if (instance == null) {
            instance = new database();
        }
        
        return instance;
    }
    
    public static Connection getConnection() {
        return con;
    }
    
}

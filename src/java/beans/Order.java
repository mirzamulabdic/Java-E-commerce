/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mirza
 */
public class Order {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    public Order(Connection con) {
        super();
        this.con = con;
    }
    
    public boolean insertOrder(orderData data) {
        boolean result = false;
        
        try {
            
            query = "INSERT INTO narudzba (proizvodi, total_cijena, status, datum_narudzbe, user_id) VALUES(?,?,?,?,?)";
            
            pst = this.con.prepareStatement(query);
            
            pst.setString(1, data.getProducts());
            pst.setFloat(2, data.getTotal_price());
            pst.setInt(3, data.getStatus());
            pst.setString(4, data.getDate());
            pst.setInt(5, data.getUser_id());
            pst.executeUpdate();
            result = true;
            
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return result;
    }
    
   public List<orderData> userOrders(int id) {
        List<orderData> list = new ArrayList<orderData>();
        
        try {
            query = "SELECT * FROM narudzba WHERE user_ID=? ORDER BY narudzba.status ASC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                orderData order = new orderData();
                
                order.setOrderID(rs.getInt("id"));
                order.setProducts(rs.getString("proizvodi"));
                order.setTotal_price(rs.getFloat("total_cijena"));
                order.setStatus(rs.getInt("status"));
                order.setDate(rs.getString("datum_narudzbe"));
                order.setUser_id(rs.getInt("user_id"));
                
                list.add(order);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<orderData> getAllOrders() {
        List<orderData> list = new ArrayList<orderData>();
        
        try {
            query = "SELECT * FROM narudzba ORDER BY narudzba.status ASC";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                orderData  order= new orderData();
   
                order.setOrderID(rs.getInt("id"));
                order.setProducts(rs.getString("proizvodi"));
                order.setTotal_price(rs.getFloat("total_cijena"));
                order.setStatus(rs.getInt("status"));
                order.setDate(rs.getString("datum_narudzbe"));
                order.setUser_id(rs.getInt("user_id"));
                list.add(order);
                
            }
        } catch(SQLException e) {
            e.printStackTrace();
            
        }
        
        return list;
    }
    
        public void cancelOrder(int id) {
        try {
            query = "UPDATE narudzba SET status = 2 WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch(Exception e) {
            e.printStackTrace();
            
        }
    }
    
    public void approveOrder(int id) {
        try {
            query = "UPDATE narudzba SET status = 1 WHERE id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
    

    
}

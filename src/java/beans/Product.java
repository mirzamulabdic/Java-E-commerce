/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mirza
 */
public class Product {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int id;
    private String name;
    private String description;
    private float price;
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Product(Connection con) {
		super();
		this.con = con;
    }
    
    public Product() {}
    
    
    
    public List<Product> getProducts(){
        List<Product> products = new ArrayList<Product>();
        try {
            query = "SELECT * FROM proizvodi";
            pst = this.con.prepareStatement(query);  
            rs = pst.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getFloat("price"));
                products.add(product);
            }
        }catch(Exception e) {
            
        };
        return products;
    }
    
    public List<Product> getCartProducts(ArrayList<Product> cartList) {
        List<Product> products = new ArrayList<Product>();
        
        try {
            if(cartList.size() > 0) {
                for(Product pr:cartList) {
                    String query = "SELECT * FROM proizvodi WHERE id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, pr.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Product product = new Product();
                        product.setId(rs.getInt("id"));
                        product.setName(rs.getString("name"));
                        product.setDescription(rs.getString("description"));
                        product.setPrice(rs.getFloat("price"));
                        products.add(product);
                    }
                }
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        return products;
    }
    
    public float getCartTotal(ArrayList<Product> cart_List) {
        float sum = 0;
        
        try {
            if(cart_List.size() >0){
                for(Product pr:cart_List) {
                    query = "SELECT price FROM proizvodi WHERE id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, pr.getId());
                    rs = pst.executeQuery();
                    
                    while(rs.next()) {
                        sum+=rs.getFloat("price");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return sum;
    }
}

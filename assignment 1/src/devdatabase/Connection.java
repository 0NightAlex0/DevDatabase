/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package devdatabase;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author Alex
 */
public class Connection {
    
// make connection with databaseserver
    public static void insertrs(String SQL) { 
              java.sql.Connection c = null;
              int rss;
              String password = "password";         // Your password as a String instead of 1234
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/Assignment1",  //Your database name instead of assignment1
            "postgres", password);
         Statement stmt = c.createStatement();
         rss = stmt.executeUpdate(SQL);
         c.close();
         System.out.println("Connection succesful.");

      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
          System.out.println("Connection failed.");
      }}
      //
      public static ArrayList returnrs(String SQL) { 
              java.sql.Connection c = null;
              ResultSet rs = null;
              ArrayList<String> listrs = new ArrayList<>();
              String password = "password";         // Your password as a String instead of 1234

      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/Assignment1",  //Your database path
            "postgres", password);
         Statement stmt = c.createStatement();
         rs = stmt.executeQuery(SQL);
         c.close();
         System.out.println("Connection succesful.");
         while(rs.next()){listrs.add(rs.getString(1));}
        
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
          System.out.println("Connection failed.");
      }
      return listrs;
    
            
    }
      public static ArrayList returnrs2(String SQL) { 
              java.sql.Connection c = null;
              ResultSet rs = null;
              ArrayList<ArrayList> listrs = new ArrayList<>();
              ArrayList<String> list1 = new ArrayList<>();
              ArrayList<String> list2 = new ArrayList<>();
              String password = "password";         // Your password as a String instead of 1234

      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/Assignment1",  //Your database path
            "postgres", password);
         Statement stmt = c.createStatement();
         rs = stmt.executeQuery(SQL);
         c.close();
         System.out.println("Connection succesful.");
         while(rs.next()){
             if(rs.getString(1) != null){list1.add(rs.getString(1));}else {list1.add("");}
             if(rs.getString(2) != null){list2.add(rs.getString(2));}else {list2.add("");}
         }
         listrs.add(list1);listrs.add(list2);
        
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
          System.out.println("Connection failed.");
      }
      return listrs;
    
            
    }      
}

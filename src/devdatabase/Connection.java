/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package devdatabase;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

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
         System.out.println("Connection succesful.");

      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
          System.out.println("Connection failed.");
      }}
      //
      public static ResultSet returnrs(String SQL) { 
              java.sql.Connection c = null;
              ResultSet rs = null;
              String password = "password";         // Your password as a String instead of 1234

      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/Assignment1",  //Your database path
            "postgres", password);
         Statement stmt = c.createStatement();
         rs = stmt.executeQuery(SQL);
         System.out.println("Connection succesful.");

      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
          System.out.println("Connection failed.");
      }
      return rs;
    }
}

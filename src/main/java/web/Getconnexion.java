package web;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Getconnexion {
 public static Connection conn;
 public static Connection getConnection() throws ClassNotFoundException, SQLException {
     Connection conn = null;
     try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost/painacare", "root", "");
         System.out.println("Connection successfully...");
         return conn;
     } catch (ClassNotFoundException e) {
         // Gérer l'exception de classe introuvable
         throw e;
     } catch (SQLException e) {
         // Gérer l'exception de base de données
         throw e;
     }
 }
 public static void main(String[] args) {
	 try {
		getConnection();
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }
}

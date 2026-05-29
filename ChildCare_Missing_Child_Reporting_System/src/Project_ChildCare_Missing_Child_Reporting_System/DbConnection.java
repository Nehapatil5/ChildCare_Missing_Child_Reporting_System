package Project_ChildCare_Missing_Child_Reporting_System;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	public static Connection connect(){
		Connection con = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("Class loaded sucessfully");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/childdb","root","");
				System.out.println("Connection established");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return con;
			
			
		}

}

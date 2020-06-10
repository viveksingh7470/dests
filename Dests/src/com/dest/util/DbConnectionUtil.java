package com.dest.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionUtil {

	//Define the database properties
		private static final String URL = "jdbc:mysql://localhost/destination?useSSL=false&serverTimezone=UTC";
		
		private static final String DRIVER = "com.mysql.jdbc.Driver";
		
		private static final String USERNAME = "root";
		
		private static final String PASSWORD = "";
		
		private static Connection connection = null;
		
		//Get the database connection
		public static Connection openConnection() throws SQLException {
			if (connection != null)
	            return connection;
	        else {
	            try {
	                Class.forName(DRIVER);
	                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	            }
	            catch (ClassNotFoundException e)
	            {
	                e.printStackTrace();
	            } 
	           
	            return connection;
	        }
		}
		
		
	}



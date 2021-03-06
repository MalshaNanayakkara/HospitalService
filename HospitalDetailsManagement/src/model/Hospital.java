package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.ws.rs.GET;
import javax.ws.rs.Path;


public class Hospital {
	
	public Connection connect()
	{
	 Connection con = null;

	 try
	 {
	 Class.forName("com.mysql.jdbc.Driver");
	 con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3307/healthcaredb","root","");
	 
	 //For testing
	 System.out.print("Successfully connected");
	 }
	 catch(Exception e)
	 {
	 e.printStackTrace(); 
	 }

	 return con;
	
	}
	
	public String insertHospitals(String hName, String hProvince, String hDistrict, String hEmail,String hPhone,String hServices) 
	{
			
		String output = ""; 
		
		try {
		Connection con = connect(); 
		 
		if (con == null) { 
			return "Error while connecting to the database"; 
		} 
	
	
		String query = " insert into hospital (hospitalID,hospitalName,hospitalProvince,hospitalDistrict,hospitalEmail,hospitalPhone,hospitalServices)" + " values (?,?,?,?,?,?,?)"; 
		java.sql.PreparedStatement preparedStmt = con.prepareStatement(query);
		
		preparedStmt.setInt(1, 0);
		preparedStmt.setString(2, hName);
		preparedStmt.setString(3, hProvince);
		preparedStmt.setString(4, hDistrict);
		preparedStmt.setString(5, hEmail);
		preparedStmt.setString(6, hPhone);
		preparedStmt.setString(7, hServices);
		preparedStmt.execute();
		con.close(); 

		String newHospital = readHospitals();    
		output = "{\"status\":\"success\", \"data\": \"" + 
						newHospital + "\"}";
		
		}
		catch(Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the Hospital.\"}"; 
			System.err.println(e.getMessage()); 
		}
		return output; 
	}

	public String readHospitals() 
	{
		String output = "";
		
		try {
		Connection con = connect(); 
			 
			if (con == null) { 
				return "Error while connecting to the database for reading."; 
			} 
			
			output = "<table border=\'1\'><tr><th>Hospital Name</th><th>Hospital Province</th><th>Hospital District</th><th>Email</th><th>Phone</th><th>Services</th><th>Update</th><th>Remove</th></tr>";
			 
			String query = "select * from hospital"; 
			Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) 
			{   
				String hospitalID = Integer.toString(rs.getInt("hospitalID")); 
				String hospitalName = rs.getString("hospitalName");  
				String hospitalProvince = rs.getString("hospitalProvince"); 
				String hospitalDistrict = rs.getString("hospitalDistrict");
				String hospitalEmail = rs.getString("hospitalEmail");
				String hospitalPhone = rs.getString("hospitalPhone");
				String hospitalServices = rs.getString("hospitalServices");
				
			output += "<tr><td><input id='hidHospitalIDUpdate' name='hidHospitalIDUpdate' type='hidden' value='"+ hospitalID
						+ "'>" + hospitalName + "</td>";
				output += "<td>" + hospitalProvince + "</td>";   
				output += "<td>" + hospitalDistrict + "</td>"; 
				output += "<td>" + hospitalEmail + "</td>";
				output += "<td>" + hospitalPhone + "</td>";
				output += "<td>" + hospitalServices + "</td>";
				
				
				output +=  "<td><input name='btnUpdate' type='button'  value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-hospitalid='" 
						+ hospitalID + "'>" + "</td></tr>";     
			 
			}
			con.close(); 
			output += "</table>";  
		
		}
		catch (Exception e) {  
			output = "Error while reading the hospitals.";  
			System.err.println(e.getMessage()); 
		}
		return output;
	}
	
	public String updateHospitals(String ID, String hName, String hProvince, String hDistrict, String hEmail, String hPhone, String hServices) 
	{
		String output = "";
		
		try   {   
			Connection con = connect(); 
		 
		   if (con == null) 
		   {
			   return "Error while connecting to the database for updating.";
		   }
		 
		   String query = "UPDATE hospital SET hospitalName=?,hospitalProvince=?,hospitalDistrict=?,hospitalEmail=?,hospitalPhone=?,hospitalServices=?  WHERE hospitalID=?"; 
		   PreparedStatement preparedStmt = con.prepareStatement(query); 
		   
		   preparedStmt.setString(1, hName);    
		   preparedStmt.setString(2, hProvince);    
		   preparedStmt.setString(3, hDistrict);    
		   preparedStmt.setString(4, hEmail);    
		   preparedStmt.setString(5, hPhone);
		   preparedStmt.setString(6, hServices);
		   preparedStmt.setInt(7, Integer.parseInt(ID));
		   
		   preparedStmt.execute();    
		   con.close();
		   
		   String newHospital = readHospitals();    
			output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";  
		   }   
		   catch (Exception e)  
		   {   
			   output = "{\"status\":\"error\", \"data\":\"Error while updating the hospital.\"}"; 
			   System.err.println(e.getMessage());  
		   } 
		  return output;
	}
	
	public String deleteHospitals(String hospitalID) 
	{
		String output = "";
		 
		try
		{
		Connection con = connect();
		
		 	if (con == null)
		 	{
		 		return "Error while connecting to the database for deleting.";
		 	}
		 
		 String query = "delete from hospital where hospitalID=?";
		 java.sql.PreparedStatement preparedStmt = con.prepareStatement(query);
		 
		 preparedStmt.setInt(1, Integer.parseInt(hospitalID));

		 // execute the statement
		 preparedStmt.execute();
		 con.close();

		 String newHospital = readHospitals();    
		 output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";
		 }
		 catch (Exception e)
		 {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the Hospital.\"}";   
			System.err.println(e.getMessage());
		 }
		return output;  
	}
		
}
	
	

	
		

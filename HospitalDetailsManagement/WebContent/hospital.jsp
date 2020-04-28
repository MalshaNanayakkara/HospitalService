<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% if (request.getParameter("hospitalName") != null)  
{  
	session.setAttribute("hospitalName", request.getParameter("hospitalName"));  
	session.setAttribute("hospitalProvince", request.getParameter("hospitalProvince"));  
	session.setAttribute("hospitalDistrict", request.getParameter("hospitalDistrict"));  
	session.setAttribute("hospitalEmail", request.getParameter("hospitalEmail"));
	session.setAttribute("hospitalPhone", request.getParameter("hospitalPhone"));
	session.setAttribute("hospitalServices", request.getParameter("hospitalServices"));;  
}  
%>  
  

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Hospital Management</title> 
</head> 
<body> 
 
	<h1>Hospital Management</h1>  
	<form method="post" action="hospital.jsp" >   
		Hospital Name: <input name="hospitalName" type="text" ><br>   
		Hospital Province: <input name="hospitalProvince" type="text" ><br>   
		Hospital District: <input name="hospitalDistrict" type="text" ><br>   
		Hospital Email: <input name="hospitalEmail" type="text" ><br>
		Hospital Phone: <input name="hospitalPhone" type="text" ><br>
		Hospital Services: <input name="hospitalServices" type="text" ><br>   
		<input name="btnSubmit" type="submit" value="Save">  
	</form>  
	<br> 
 
 	<table border="1">  
 		<tr>    
	 		<th>Hospital Name</th> 
	 		<th>Hospital Province</th> 
	 		<th>Hospital District</th> 
	 		<th>Hospital Email</th> 
	 		<th>Hospital Phone</th>
	 		<th>Hospital Services</th>
	 		<th>Update</th> 
	 		<th>Remove</th>   
 		</tr>   
 		<tr>    
 			<td><%out.print(session.getAttribute("hospitalName")); %></td>    
 			<td><%out.print(session.getAttribute("hospitalProvince")); %></td>    
 			<td><%out.print(session.getAttribute("hospitalDistrict")); %></td>    
 			<td><%out.print(session.getAttribute("hospitalEmail")); %></td> 
 			<td><%out.print(session.getAttribute("hospitalPhone")); %></td>
 			<td><%out.print(session.getAttribute("hospitalServices")); %></td>  
 			<td><input name="btnUpdate" type="button" value="Update"></td>    
 			<td><input name="btnRemove" type="button" value="Remove"></td>   
 		</tr>  
 	</table> 
 	
 </body> 
 </html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Hospital"%>
    
<% 
	if (request.getParameter("hospitalName") != null)  
	{  
		Hospital hospitalObj = new Hospital();   
	
		String stsMsg = hospitalObj.insertHospitals(request.getParameter("hospitalName"),     
										request.getParameter("hospitalProvince"),     
										request.getParameter("hospitalDistrict"),        
										request.getParameter("hospitalEmail"),
										request.getParameter("hospitalPhone"),
										request.getParameter("hospitalServices")); 
	 
	 session.setAttribute("statusMsg", stsMsg);
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
	
	<% 
		out.print(session.getAttribute("statusMsg"));
	%>
	<br>
	<%
		Hospital hospitalObj = new Hospital();
		out.print(hospitalObj.readHospitals());
	%>
 	
 </body> 
 </html>
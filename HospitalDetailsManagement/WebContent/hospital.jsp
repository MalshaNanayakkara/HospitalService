<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Hospital"%>
    
<% 
	if (request.getParameter("hospitalName") != null)  
	{  
		Hospital hospitalObj = new Hospital();
		String stsMsg = ""; 
	
		if(request.getParameter("hidHospitalIDSave") == "")
		{
		 	 stsMsg = hospitalObj.insertHospitals(request.getParameter("hospitalName"),     
										request.getParameter("hospitalProvince"),     
										request.getParameter("hospitalDistrict"),        
										request.getParameter("hospitalEmail"),
										request.getParameter("hospitalPhone"),
										request.getParameter("hospitalServices")); 
	 
		}
		else
		{
			stsMsg = hospitalObj.insertHospitals(request.getParameter("hospitalName"),     
					request.getParameter("hospitalProvince"),     
					request.getParameter("hospitalDistrict"),        
					request.getParameter("hospitalEmail"),
					request.getParameter("hospitalPhone"),
					request.getParameter("hospitalServices"));
		}
		session.setAttribute("statusMsg", stsMsg);
	}

	if (request.getParameter("hospitalID") != null)
	{
		Hospital hospitalObj = new Hospital();
		String stsMsg = hospitalObj.deleteHospitals(request.getParameter("hospitalID"));
		session.setAttribute("statusMsg", stsMsg);
	} 
%>
  

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Hospital Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<script src="Components/jquery-3.4.1.min.js"></script> 
<script src="Components/hospital.js"></script>
</head> 
<body> 
 
	<h1>Hospital Management</h1>  
	<form id="formHospital" name="formHospital" method="post" action="hospital.jsp" > 
	  
		Hospital Name: <input id="hospitalName" name="hospitalName" type="text" class="form-control form-control-sm"><br>   
		Hospital Province: <input id="hospitalProvince" name="hospitalProvince" type="text" class="form-control form-control-sm"><br>   
		Hospital District: <input id="hospitalDistrict" name="hospitalDistrict" type="text" class="form-control form-control-sm"><br>   
		Hospital Email: <input id="hospitalEmail" name="hospitalEmaile" type="text" class="form-control form-control-sm"><br>
		Hospital Phone:<input id="hospitalPhone" name="hospitalPhone" type="text" class="form-control form-control-sm"><br>
		Hospital Services: <input id="hospitalServices" name="hospitalServices" type="text" class="form-control form-control-sm"><br> 
		  
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 		<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
	</form>  
	<div class="alert alert-success">
		<% out.print(session.getAttribute("statusMsg")); %>
	</div>
	<br>

	<%
		Hospital hospitalObj = new Hospital();
		out.print(hospitalObj.readHospitals());
	%>
 	
 </body> 
 </html>
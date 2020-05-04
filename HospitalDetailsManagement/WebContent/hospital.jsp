<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Hospital"%>
    

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
		Hospital Email: <input id="hospitalEmail" name="hospitalEmail" type="text" class="form-control form-control-sm"><br>
		Hospital Phone:<input id="hospitalPhone" name="hospitalPhone" type="text" class="form-control form-control-sm"><br>
		Hospital Services: <input id="hospitalServices" name="hospitalServices" type="text" class="form-control form-control-sm"><br> 
		  
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 		<input type="hidden" id="hidHospitalIDSave" name="hidHospitalIDSave" value="">
	</form>  
	<div class="alert alert-success"></div>
	<div id ="alertError" class="alert alert-danger"></div>
	<br>

	<%
		Hospital hospitalObj = new Hospital();
		out.print(hospitalObj.readHospitals());
	%>
 	
 </body> 
 </html>
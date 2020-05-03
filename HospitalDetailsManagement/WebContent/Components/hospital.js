$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  	
	}  
	$("#alertError").hide(); 
	
}); 
 
$(document).on("click", "#btnSave", function(event)
{
		// Clear alerts---------------------
		$("#alertSuccess").text("");
		$("#alertSuccess").hide();
		$("#alertError").text("");
		$("#alertError").hide();
					 
		// Form validation-------------------
		var status = validateHospitalForm();
		if (status != true)
		{
			$("#alertError").text(status);
			$("#alertError").show();
			return;
		}
					
			// If valid------------------------
			$("#formHospital").submit(); 
 });

//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) {    
	$("#hidHospitalIDSave").val($(this).closest("tr").find('#hidHospitalIDUpdate').val());     
	$("#hospitalName").val($(this).closest("tr").find('td:eq(0)').text());     
	$("#hospitalProvince").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#hospitalDistrict").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#hospitalEmail").val($(this).closest("tr").find('td:eq(3)').text()); 
	$("#hospitalPhone").val($(this).closest("tr").find('td:eq(4)').text()); 
	$("#hospitalServices").val($(this).closest("tr").find('td:eq(5)').text()); 
}); 

function validateHospitalForm()
{

}

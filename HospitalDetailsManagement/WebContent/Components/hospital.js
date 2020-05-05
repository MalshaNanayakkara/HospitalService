$(document).ready(function()
{
	$("#alertSuccess").hide();
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
		var type = ($("#hidHospitalIDSave").val() == "") ? "POST" : "PUT"; 
		
		$.ajax( 
		{  
			url : "HospitalAPI",  
			type : type,  
			data : $("#formHospital").serialize(),  
			dataType : "text",  
			complete : function(response, status)  
			{   
				onHospitalSaveComplete(response.responseText, status);  
				
			} 
		});

 });

function onHospitalSaveComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 


		if (resultSet.status.trim() == "success") 
		{    
			$("#alertSuccess").text("Successfully saved.");    
			$("#alertSuccess").show(); 

 
			$("#divHospitalGrid").html(resultSet.data);   
		} 
		else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 


	} 
	else if (status == "error") 
	{   
		$("#alertError").text("Error while saving.");   
		$("#alertError").show();  
	}
	else  
	{   
		$("#alertError").text("Unknown error while saving..");   
		$("#alertError").show();  
	} 

	$("#hidHospitalIDSave").val("");  
	$("#formHospital")[0].reset(); 
	
} 

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

//remove
$(document).on("click", ".btnRemove", function(event) 
{  
	$.ajax(  
	{   
		url : "HospitalAPI",   
		type : "DELETE",   
		data : "hospitalID=" + $(this).data("hospitalid"),   
		dataType : "text",   
		complete : function(response, status)  
		
		{    
			onHospitalDeleteComplete(response.responseText, status);   
			
		}  
	}); 
	
})
	
function onHospitalDeleteComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 
 
		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully deleted.");    
			$("#alertSuccess").show(); 
 
			$("#divHospitalGrid").html(resultSet.data);   
			
		} 
		else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 
	} 
	else if (status == "error")  
	{   
		$("#alertError").text("Error while deleting.");   
		$("#alertError").show();  
		
	}
	else  
	{   
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
		
	} 
	
} 	
	

//Client
function validateHospitalForm()
{
	// Hospital Name
	if ($("#hospitalName").val().trim() == "")
	{
		return "Insert Hospital Name.";
	}
	
	//Hospital Province
	if ($("#hospitalProvince").val().trim() == "")
	{
		return "Insert Hospital Province.";
	} 
	
	//Hospital District
	if ($("#hospitalDistrict").val().trim() == "")
	{
		return "Insert Hospital District.";
	}
	
	
	// Hospital Email
	if ($("#hospitalEmail").val().trim() == "")
	{
		return "Insert Hospital Email.";
	}
	
	// Hospital Phone
	if ($("#hospitalPhone").val().trim() == "")
	{
		return "Insert Hospital Phone.";
	}
	
	// Hospital Services
	if ($("#hospitalServices").val().trim() == "")
	{
		return "Insert Hospital Services.";
	}
	return true;
}

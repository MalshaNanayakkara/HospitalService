package model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import model.Hospital;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HospitalAPI
 */
@WebServlet("/HospitalAPI")
public class HospitalAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Hospital hospitalObj = new Hospital();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//replace using for aviding db value changing
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		 String output = hospitalObj.insertHospitals(request.getParameter("hospitalName").replace("+"," "),     
									request.getParameter("hospitalProvince"),     
									request.getParameter("hospitalDistrict"),        
									request.getParameter("hospitalEmail").replace("%40", "@"),
									request.getParameter("hospitalPhone"),
									request.getParameter("hospitalServices").replace("+",",")); 
	
		 response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request); 
		 
		String output = hospitalObj.updateHospitals(paras.get("hidHospitalIDSave").toString(),
				paras.get("hospitalName").toString().replace("+"," "),     
				paras.get("hospitalProvince").toString().replace("+"," "),        
				paras.get("hospitalDistrict").toString().replace("+"," "),        
				paras.get("hospitalEmail").toString().replace("%40", "@"), 
				paras.get("hospitalPhone").toString(),
				paras.get("hospitalServices").toString().replace("%2C",","));
		 
		 response.getWriter().write(output);
	}

	private Map getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();  
		try  
		{   
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");  
			String queryString = scanner.hasNext() ?          
					scanner.useDelimiter("\\A").next() : "";   
			scanner.close();
			
			 String[] params = queryString.split("&");   
			 for (String param : params)   
			 {
				 String[] p = param.split("=");    
				 map.put(p[0], p[1]);   
			  }  
			 
		}  
		catch (Exception e)  
		{  	
		}  
		return map;
			
	} 	


	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Map paras = getParasMap(request); 
		 
		String output = hospitalObj.deleteHospitals(paras.get("hospitalID").toString()); 
		 
		response.getWriter().write(output);
	}

}

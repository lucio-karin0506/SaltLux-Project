package bicycle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bicyclelogic.BicycleDAO;
import bicyclelogic.BicycleVO;
import bicyclelogic.BicycleYearCountVO;
import bicyclelogic.LocationVO;
import bicyclelogic.RepairVO;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BicycleDAO dao = new BicycleDAO();
       
    public DispatcherServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    }
    
    /*
     * get 방식 요청 시 파라미터 처리
     * */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String reqCommand = request.getRequestURI();
	    String path = "index.jsp";
	    
	 // yearCount.jsp 실행
    	if("/BicyclePrj/bicycleYearCount.do".equals(reqCommand)) {
    		ArrayList<BicycleYearCountVO> yearCountList = new ArrayList<>();
    		HashMap<String, String> countedMap = new HashMap<String, String>();
    		
   		    yearCountList = dao.compareYearCount();
   		    countedMap = dao.sumYearCount(yearCountList);
    		
    		request.setAttribute("year_count_list", yearCountList);
    		request.setAttribute("countedMap", countedMap);
    		path = "yearCount.jsp";
    	}
    	
    	else if("/BicyclePrj/repairBicycle.do".equals(reqCommand)) {
			path = "repairBicycle.jsp";
		}
    	
		else if("/BicyclePrj/repairBicycleResult.do".equals(reqCommand)) {
			ArrayList<RepairVO> repairList = dao.getRepairList();
			request.setAttribute("repairList", repairList);
			path = "repairBicycleResult.jsp";
		}
    	
		else if("/BicyclePrj/pctResult.do".equals(reqCommand)) {
			ArrayList<RepairVO> repairList = dao.getRepairPctList();
			request.setAttribute("repairList", repairList);
			path = "repairPctResult.jsp";
		}
    	
		else if("/BicyclePrj/location.do".equals(reqCommand)) {
			path="location.jsp";
		}
	    
	    RequestDispatcher disp = request.getRequestDispatcher(path);
	    disp.forward(request, response);
	}

	/*
     * post 방식 요청 시 파라미터 처리
     * */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reqCommand = request.getRequestURI();
		String path = "index.jsp";
	    
		// bicycleInput.jsp 접속 시 실행
    	if("/BicyclePrj/bicycleinput.do".equals(reqCommand)) {
    		ArrayList<BicycleVO> bicycleList = new ArrayList<>();
    		
    		String lental_office = request.getParameter("lental_office");
    		String lental_hour = request.getParameter("lental_hour");
      	  	
      	  	bicycleList = dao.getRentalRank(lental_office, lental_hour);
      	  	
      	  	request.setAttribute("lental_hour", lental_hour);
	      	request.setAttribute("bicycleList", bicycleList); 	
      	  	path = "bicycleRentalResult.jsp";
    	}
    	
    	// bicycleMonthInput.jsp 실행
    	else if("/BicyclePrj/bicycleReturnInput.do".equals(reqCommand)) {
    		ArrayList<BicycleVO> bicycleList = new ArrayList<>();
    		
    		String return_office = request.getParameter("return_office");
    		String return_hour = request.getParameter("return_hour");
      	  	
      	  	bicycleList = dao.getReturnRank(return_office, return_hour);
      	  	
      	  	request.setAttribute("return_hour", return_hour);
	      	request.setAttribute("bicycleList", bicycleList); 	
      	  	path = "bicycleReturnResult.jsp";
    	}
    	
    	else if("/BicyclePrj/location.do".equals(reqCommand)) {
			String gu = request.getParameter("gu");
			ArrayList<LocationVO> locationList = dao.getRentalLocation(gu);
			
			request.setAttribute("gu", gu);
			request.setAttribute("locationList", locationList);
			path="locationResult.jsp";
	}
	    
	  RequestDispatcher disp = request.getRequestDispatcher(path);
	  disp.forward(request, response);
	 
	}

}

package com.tools;


import java.io.IOException; 
import java.io.PrintWriter;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer; 
import java.util.TimerTask;

import com.dish.model.DishService;
import com.ordit.model.OrditService;
import com.ordit.model.OrditVO;
import com.store.model.StrService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

 
public class Schedule  extends HttpServlet{
	 String strDate = ""; 
	 Timer timer;
	 
	 public void destroy() {
			timer.cancel();
		}
	 
	 @Override 
	 public void init() { 
	  
	  Timer timer = new Timer(); 
	  

	  
	  timer.schedule(new TimerTask(){ 
	   @Override 
	   public void run() { 
		   Map<String, Integer> map = new HashMap<String, Integer>();
		   Map<String, Integer> str_map = new HashMap<String, Integer>();
		   OrditService orditSvc = new OrditService();
		   DishService dishSvc = new DishService();
			  
	   
	   
		   List<OrditVO> orditVO = orditSvc.getAll();
		   for(int i=0;i<orditVO.size();i++){
			   String Dish_no = orditVO.get(i).getDish_no();
			   int Qrdit_qua = orditVO.get(i).getOrdit_qua();
			   
			   System.out.println(Dish_no);
			   System.out.println(Qrdit_qua);
			   
			   if(map.containsKey(Dish_no)){
				  Qrdit_qua = Qrdit_qua + map.get(Dish_no); 
			   }
			   
			   map.put(Dish_no, Qrdit_qua);
			   
		   	}
		   	ServletContext context = getServletContext();
			context.setAttribute("map", map);
			System.out.println(map+"所有加總");
			
			
			for (Object key : map.keySet()) {
				
				str_map.put(key, map.get(key));
				 
				        }
		
			
//			String dish_no = map.get(key);
//			 <DishVO> dishVO = dishSvc.getOneDish(dish_no);
			 
			
		
		  
		  
		  
		  
	   }  
	  }, new Date() , 60*60*1000); 
	  
	 
	  
	 } 
	 
	 protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	  res.setContentType("text/plain"); 
	  PrintWriter out = res.getWriter(); 
	 
	 } 
	}

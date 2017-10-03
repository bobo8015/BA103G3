package com.tools;

import java.io.File; 
import java.io.FileWriter; 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.util.Calendar; 
import java.util.Date; 
import java.util.GregorianCalendar; 
import java.util.Timer; 
import java.util.TimerTask; 
 
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
public class Schedule_2  extends HttpServlet{
	 String strDate = ""; 
	 
	 @Override 
	 public void init() { 
	  GregorianCalendar date = new GregorianCalendar(2017,6,20,0,0,0); 
	  Timer timer = new Timer(); 
	  timer.scheduleAtFixedRate(new TimerTask(){ 
	   @Override 
	   public void run() { 
	    Date exeTime = new Date(scheduledExecutionTime()); 
	// System.out.println(exeTime); 
	    strDate += exeTime.toString(); 
	    strDate += "\n";  
	    System.out.print(strDate);
	   }  
	  }, date.getTime(), 60*60*1000);  
	 } 
	 
	 protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
	  res.setContentType("text/plain"); 
	  PrintWriter out = res.getWriter(); 
	  out.write(strDate); 
	 } 
	}

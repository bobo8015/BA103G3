package com.pro.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.model.ProService;
import com.pro.model.ProVO;

public class ProServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String str_no = req.getParameter("str_no");
		System.out.print(str_no);
		
		
		if("Insert_For_Pro".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			java.sql.Date pro_str  = null;
			java.sql.Date pro_end = null;
			Integer pro_mon = null;
			Double pro_dis = null;
			String dcla_no1 = null;
			String dcla_no2 = null;
			
			pro_str = java.sql.Date.valueOf(req.getParameter("datestr").trim());
			pro_end = java.sql.Date.valueOf(req.getParameter("dateend").trim());
			
			long startDate = pro_str.getTime();
			
			System.out.println(startDate);
//			String tyu =pro_str.toString();
//			Date abc = DateFormat.parse(tyu);
			
			if(pro_str .equals(pro_end) ){
				pro_str =new java.sql.Date(System.currentTimeMillis());
				pro_end =new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("開始結束日期相同");
			}
			
			String pro_cat =req.getParameter("style"); 		
				
			if ("money".equals(pro_cat)){
				
				System.out.print(pro_cat);
				try{
					pro_mon = new Integer(req.getParameter("condition").trim());
				
					}catch (NumberFormatException e){
						errorMsgs.add("請輸入條件金額");
				 
				}
				try{
					pro_dis = new Double(req.getParameter("discount").trim());
					
					pro_dis=pro_dis/100;
				} catch (NumberFormatException e){
					errorMsgs.add("請輸入折扣金額");
				}
				
				ProVO proVO = new ProVO();
				
				proVO.setPro_str(pro_str);
				proVO.setPro_end(pro_end);
				proVO.setStr_no(str_no);
				proVO.setPro_cat(pro_cat);
				proVO.setPro_mon(pro_mon);
				proVO.setPro_dis(pro_dis);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proVO", proVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store/str_bonus_03.jsp");
					failureView.forward(req, res);
					return;
				}
				
				ProService proSvc = new ProService();
				proVO =proSvc.addPro1(pro_str, pro_end, str_no, pro_cat, pro_mon, pro_dis);
				
				String url = "/store/str_bonus_02.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
				
				}else{
					
					dcla_no1=new String(req.getParameter("dcla_1").trim());
					dcla_no2=new String(req.getParameter("dcla_2").trim());
					System.out.println(dcla_no1);
					System.out.println(dcla_no2);
					if(dcla_no1.equals(dcla_no2)){
						errorMsgs.add("種類相同");
					}
					try{
						pro_dis = new Double(req.getParameter("discount").trim());
						
						pro_dis=pro_dis/100;
					} catch (NumberFormatException e){
						errorMsgs.add("請輸入折扣金額");
					}	
					
					ProVO proVO = new ProVO();
					
					proVO.setPro_str(pro_str);
					proVO.setPro_end(pro_end);
					proVO.setStr_no(str_no);
					proVO.setPro_cat(pro_cat);
					proVO.setDcla_no1(dcla_no1);
					proVO.setDcla_no2(dcla_no2);
					proVO.setPro_dis(pro_dis);
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("proVO", proVO); 
						RequestDispatcher failureView = req
								.getRequestDispatcher("/store/str_bonus_03.jsp");
						failureView.forward(req, res);
						return;
					}
					
					ProService proSvc = new ProService();
					proVO =proSvc.addPro2(pro_str, pro_end, str_no, pro_cat,pro_dis, dcla_no1,dcla_no2 );
					
					String url = "/store/str_bonus_03.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);
					
				}
				
				}
				
			
	}

	
}
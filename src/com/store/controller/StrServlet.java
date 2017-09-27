package com.store.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.store.model.StrVO;
import com.storecategory.model.ShareTool;
import com.adv.model.AdvVO;
import com.fav.model.FavService;
import com.store.model.StrService;
import com.tools.*;
@MultipartConfig
public class StrServlet extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("有進入控制器");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		System.out.println("action:"+action);
		
		
//		 ------------------------店家註冊開始------------------------
		
		if ("getRegisterSt".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
//				 ------------------------第一頁------------------------				
				String str_acc = request.getParameter("str_acc").trim();
				String str_pas = request.getParameter("str_pas").trim();
				String re_repas = request.getParameter("str_repas").trim();
				
				if (str_acc == null || (str_acc.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
				if (str_pas == null || (str_pas.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				if (re_repas == null || (re_repas.trim()).length() == 0) {
					errorMsgs.add("請輸入確認密碼");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register01.jsp");
					failureView.forward(request, response);
					return;
				}
				
				if(!str_pas.equals(re_repas)) {
					errorMsgs.add("密碼不相符，請再次確認！");
				}
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register01.jsp");
					failureView.forward(request, response);
					return;
				}
				
				session.setAttribute("str_acc", str_acc);
				session.setAttribute("str_pas", str_pas);
				String url ="/easyfood/front-end/class/store/str_register02.jsp";
				RequestDispatcher registerSuccess= request.getRequestDispatcher(url);
				registerSuccess.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register01.jsp");
				failureView.forward(request, response);
			}
				
		}
		
//		 ------------------------第二頁------------------------			
		if("getRegisteEd".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String str_name = request.getParameter("str_name").trim();
				String stoca_no = request.getParameter("stoca_no").trim();
				String str_cou = request.getParameter("str_cou").trim();
				String str_city = request.getParameter("str_city").trim();
				String str_addr = request.getParameter("str_addr").trim();
				String str_atn = request.getParameter("str_atn").trim();
				String str_tel = request.getParameter("str_tel").trim();
				String str_ma = request.getParameter("str_ma").trim();
				String str_lat = request.getParameter("str_lat");
				String str_long = request.getParameter("str_long");
				
				System.out.println(str_lat);
				System.out.println(str_long);
				System.out.println(str_lat.length());
				System.out.println(str_long.length());
				
				if (str_name == null || str_name.length() == 0) {
					errorMsgs.add("請填寫店家名稱");
				}
				if (stoca_no.equals("請選擇")) {
					errorMsgs.add("請選擇店家類型");
				}
				if (str_cou.equals("請選擇")) {
					errorMsgs.add("請選擇店家縣市");
				}
				if (str_city == null || str_city.length() == 0) {
					errorMsgs.add("請填寫店家地區");
				}
				if (str_addr == null || str_addr.length() == 0) {
					errorMsgs.add("請填寫店家地址");
				}
				if (str_atn == null || str_atn.length() == 0) {
					errorMsgs.add("請填寫聯絡人");
				}
				if (str_tel == null || str_tel.length() == 0) {
					errorMsgs.add("請填寫電話");
				}
				if (str_ma == null || str_ma.length() == 0) {
					errorMsgs.add("請填寫有效信箱");
				}
				if(str_lat == null || str_lat.length() == 0) {
//					str_lat = "0.0";
				errorMsgs.add("無顯示經緯度");
				}
				if(str_long == null || str_long.length() == 0) {
//					str_long = "0.0";
				errorMsgs.add("無顯示經緯度");
				}
								
				if(str_lat.length() > 11) {
					int idxLat	= str_lat.indexOf(".");
					str_lat = str_lat.substring(0, idxLat+8);
				} 
				
				if(str_long.length() > 11) {
					int idxLng = str_long.indexOf(".");
					str_long = str_long.substring(0, idxLng+8);
				}
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register02.jsp");		
					failureView.forward(request, response);
					return;
				}
				
				session.setAttribute("str_name", str_name);
				session.setAttribute("stoca_no", stoca_no);
				session.setAttribute("str_cou", str_cou);
				session.setAttribute("str_city", str_city);
				session.setAttribute("str_addr", str_addr);
				session.setAttribute("str_atn", str_atn);
				session.setAttribute("str_tel", str_tel);
				session.setAttribute("str_ma", str_ma);
				session.setAttribute("str_lat", str_lat);
				session.setAttribute("str_long", str_long);
				
				System.out.println(session.getAttribute("str_lat"));
				System.out.println(session.getAttribute("str_long"));

				String url = "/easyfood/front-end/class/store/str_register03.jsp";
				RequestDispatcher reristerSuccess= request.getRequestDispatcher(url);
				reristerSuccess.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register02.jsp");
				failureView.forward(request, response);
			}
			
		}
//		 ------------------------第三頁------------------------				
		if("getRegisteTd".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String pre = request.getParameter("str_pre");
				String ship = request.getParameter("str_ship");
				
				session.setAttribute("str_pre", pre);
				session.setAttribute("str_ship", ship);
				
				
				String str_acc = session.getAttribute("str_acc").toString();
				String str_pas = session.getAttribute("str_pas").toString();
				String str_name = session.getAttribute("str_name").toString();
				String stoca_no = session.getAttribute("stoca_no").toString();
				String str_cou = session.getAttribute("str_cou").toString();
				String str_city = session.getAttribute("str_city").toString();
				String str_addr = session.getAttribute("str_addr").toString();
				String str_atn = session.getAttribute("str_atn").toString();
				String str_tel = session.getAttribute("str_tel").toString();
				String str_ma = session.getAttribute("str_ma").toString();
				Double str_lat = new Double(session.getAttribute("str_lat").toString());
				Double str_long = new Double(session.getAttribute("str_long").toString());
				Integer str_pre = new Integer(session.getAttribute("str_pre").toString());
				String str_ship = session.getAttribute("str_ship").toString();
				
				StrVO strVO = new StrVO();
				strVO.setStr_acc(str_acc);
				strVO.setStr_pas(str_pas);
				strVO.setStr_name(str_name);
				strVO.setStoca_no(stoca_no);
				strVO.setStr_cou(str_cou);
				strVO.setStr_city(str_city);
				strVO.setStr_addr(str_addr);
				strVO.setStr_atn(str_atn);
				strVO.setStr_tel(str_tel);
				strVO.setStr_ma(str_ma);
				strVO.setStr_lat(str_lat);
				strVO.setStr_long(str_long);
				strVO.setStr_pre(str_pre);
				strVO.setStr_ship(str_ship);
				
				
				if(!errorMsgs.isEmpty()) {
					request.setAttribute("strVO", strVO);
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register03.jsp");
					failureView.forward(request, response);
					return;	
				}
				
				StrService strSvc = new StrService();
				strVO = strSvc.addStr(str_name, stoca_no, str_cou, str_city, str_addr, str_atn, str_tel, str_ma, str_acc, str_pas, str_pre, str_ship, str_lat, str_long);
				System.out.print("add success");
				
//				 ------------------------清除session------------------------				
				Enumeration<String> en = session.getAttributeNames();
				while(en.hasMoreElements()) {
					String name = (String) en.nextElement();
					session.removeAttribute(name);
				}
				
				String url = "/easyfood/front-end/class/store/str_login.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_register03.jsp");
				failureView.forward(request, response);
			}	
		
		}	
		
//		 ------------------------店家登入開始------------------------
			
		if("str_login".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				String str_acc = (String) request.getParameter("str_acc");
				
				if (str_acc == null || (str_acc.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
				}

				String str_pas = (String) request.getParameter("str_pas");
				if (str_pas == null || (str_pas.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_login.jsp");
					failureView.forward(request, response);
					return;
				}
				
				StrService strSvc = new StrService();
				String str_no = strSvc.getOneStrNO(str_acc);
				StrVO strVO = strSvc.getOneStr(str_no);

				if (strVO == null) {
					errorMsgs.add("非店家身份");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_login.jsp");
					failureView.forward(request, response);
					return;
				}

				session = request.getSession();
				session.setAttribute("str_no", str_no);	
				String url = "/easyfood/front-end/class/store/str_center.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
			
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_login.jsp");
				failureView.forward(request, response);
			}
			
	}
		
		
//		 ------------------------店家修改基本資料開始------------------------
		if("str_update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			System.out.println("555555");
			try {
				System.out.println("5999955");
				String str_no = (String) session.getAttribute("str_no");
				String str_note = request.getParameter("str_note");
				String str_cou = request.getParameter("str_cou");
				String str_city = request.getParameter("str_city");
				String str_addr = request.getParameter("str_addr");
				String str_atn = request.getParameter("str_atn");
				String str_tel = request.getParameter("str_tel");
				String str_ma = request.getParameter("str_ma");
				Integer str_pre = new Integer(request.getParameter("str_pre"));
				String str_ship = request.getParameter("str_ship");
				Double str_lat = new Double(request.getParameter("str_lat"));
				Double str_long = new Double(request.getParameter("str_long"));
				
				System.out.println(str_no);
				System.out.println(str_note );
				System.out.println(str_cou);
				System.out.println(str_city);
				System.out.println(str_addr);
				System.out.println(str_atn);
				System.out.println(str_tel);
				System.out.println(str_ma);
				
				StrVO strVO = new StrVO();
				strVO.setStr_no(str_no);
				strVO.setStr_note(str_note);
				strVO.setStr_cou(str_cou);
				strVO.setStr_city(str_city);
				strVO.setStr_addr(str_addr);
				strVO.setStr_atn(str_atn);
				strVO.setStr_tel(str_tel);
				strVO.setStr_ma(str_ma);
				strVO.setStr_pre(str_pre);
				strVO.setStr_ship(str_ship);
				strVO.setStr_lat(str_lat);
				strVO.setStr_long(str_long);
				
				if(!errorMsgs.isEmpty()) {
					request.setAttribute("strVO", strVO);
					RequestDispatcher failureView = request.getRequestDispatcher("/store/str_profile02.jsp");
					failureView.forward(request, response);
					return;	
				}
				
				System.out.println(strVO.getStr_lat());
				System.out.println(strVO.getStr_long());
				System.out.println(strVO.getStr_note());
				
				StrService strSvc = new StrService();
				strSvc.updateStr(str_no, str_note, str_cou, str_city, str_addr, str_tel, str_atn, str_pre, str_ship, str_ma, str_long, str_lat);
				System.out.println("update success");
				String url = "/store/str_profile01.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				 
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/store/str_profile02.jsp");
				failureView.forward(request, response);
			}
			
		}
		
//		 ------------------------店家修改密碼開始------------------------
		
		if("str_change".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String pas = request.getParameter("str_pas");
				String newPas = request.getParameter("str_newPas");
				String reNewPas = request.getParameter("str_reNewPas");
				
				System.out.println("pas from USER old " + pas);
				System.out.println("pas from USER new " + newPas);
				System.out.println("pas from USER check " + reNewPas);
				
				String str_no = session.getAttribute("str_no").toString();
				StrService strSvc = new StrService();
				StrVO strVO = strSvc.getOneStr(str_no);
				String str_pas = strVO.getStr_pas();
				
				System.out.println("pas from DB " + str_pas);
				
				if(pas == null || (pas.trim()).length() == 0) {
					errorMsgs.add("請輸入舊密碼");
				}
				
				if(!(str_pas.equals(pas))) {
					errorMsgs.add("密碼輸入錯誤");
				}
				
				if(newPas == null || (newPas.trim()).length() == 0) {
					errorMsgs.add("請輸入更新密碼");
				}
				
				if(reNewPas == null || (reNewPas.trim()).length() == 0) {
					errorMsgs.add("請再次輸入新密碼");
				}
				
				if(!((newPas.trim()).equals(reNewPas.trim()))) {
					errorMsgs.add("更新密碼有錯誤");
				}
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_profile03.jsp");		
					failureView.forward(request, response);
					return;
				}
				System.out.println(str_no + " : " + newPas);
				strSvc.updatePas(str_no, newPas);
				System.out.println("update password success");
				
				session.invalidate();
				
				
				String url = "/easyfood/front-end/class/store/str_login.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/easyfood/front-end/class/store/str_profile03.jsp");
				failureView.forward(request, response);
			}
				
		}
		if("Up_For_Image".equals(action)){
	
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String str_no = (String) session.getAttribute("str_no");
				Part str_img=request.getPart("str_img");				
				byte[] str_img_byte = tools.getPictureByteArraypart(str_img);
				
				StrVO strVO = new StrVO();
				
				strVO.setStr_img(str_img_byte);
				strVO.setStr_no(str_no);
				
				StrService strSvc = new StrService();
				
				strSvc.updateImg(str_img_byte, str_no);
				
			
				
				String url = "/store/str_profile01.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			}catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/store/str_profile02.jsp");
				failureView.forward(request, response);
			}
			
			
		}
		
		if("str_up_pas".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String str_no =(String) session.getAttribute("str_no");
				String str_pas =request.getParameter("str_pas").trim();				
				String str_pas_new =request.getParameter("str_pas_new").trim();
				String str_pas_new2 =request.getParameter("str_pas_new2").trim();
				
				System.out.println(str_no );
				System.out.println(str_pas);
				System.out.println(str_pas_new);
				System.out.println(str_pas_new2);
				
				StrService strSvc = new StrService();
				StrVO strVO = strSvc.getOneStr(str_no);
				
				String str_pas_db =strVO.getStr_pas();
				
				
				if(!str_pas_db.equals(str_pas)) {
					errorMsgs.add("舊密碼錯誤");
				}
				if(str_pas_db.equals(str_pas_new)) {
					errorMsgs.add("密碼與舊密碼相同");
				}
				
				if(!str_pas_new.equals(str_pas_new2)) {
					errorMsgs.add("新密碼與再輸入密碼不同");
				}
												
				
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = request.getRequestDispatcher("/store/str_profile03.jsp");		
					failureView.forward(request, response);
					return;
				}
				
				
				strSvc.updatePas(str_no, str_pas_new);
				
				String url = "/store/str_profile01.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				
			}catch (Exception e) {
				errorMsgs.add("更新失敗" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/store/str_profile02.jsp");
				failureView.forward(request, response);
			}
			
			
		}
		
		
		
		
		
		
		
		
	}

	
	
	

}

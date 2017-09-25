<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.storecategory.model.*"%>

<%
	String str_no = (String) session.getAttribute("str_no");	
	
	if(str_no == null){
		session.setAttribute("str_no", "STR_0003");		
		str_no = (String) session.getAttribute("str_no");		
	}
%>
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StrService" />
<jsp:useBean id="dishclassSvc" scope="page" class="com.dishclass.model.DclaService" />
 <% StrVO storVO = storeSvc.getOneStr(str_no); %>

<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>食在方便</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/store/css/str_profile.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/store/css/style.css">
	</head>
	<body onload="gettime();">
<!-- header======================================= -->	
		<div class="page-header center-header">
		  <span>食在方便<small>店家中心</small></span>
		</div>

<!-- navbar======================================= -->
		<nav class="navbar center-navbar navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
						<span class="sr-only">選單切換</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="str_profile01.html"><%= storVO.getStr_name()%></a>
				</div>
				
		<!-- 手機隱藏選單區=======================================-->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
			<!-- 左選單 =======================================-->
					<ul class="nav navbar-nav">
						<li><a href="str_center.html">店家中心</a></li>
						<li><a href="str_dish.html">菜單專區</a></li>
						<li><a href="str_order.html">訂單記錄</a></li>
						<li><a href="str_inform.html">個人訊息</a></li>
						<li><a href="str_advertise.html">廣告專區</a></li>
						<li><a href="str_bonus.html">優惠專區</a></li>
					</ul>
				
			<!-- 右選單 =======================================-->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= storVO.getStr_name()%> 您好<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="str_profile01.html">店家資料</a></li>
								<li><a href="str_order.html">訂單查詢</a></li>
								<li><a href="str_inform.html">個人訊息</a></li>
							</ul>
						</li>
						<li><a href='#modal-id' data-toggle="modal">登出</a></li>
					</ul>
				</div>
		<!-- 手機隱藏選單區結束 =======================================-->
			</div>
		</nav>

<!-- modal登出視窗 =======================================-->
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">確定登出</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-success" data-dismiss="modal">關閉</button>
					</div>
				</div>
			</div>
		</div>
		
<!-- breadcrumb 麵包屑 =======================================-->
		<ol class="breadcrumb">
			<li>
				<a href="../index.html">首頁</a>
			</li>
			<li>
				<a href="str_center.html">店家中心</a>
			</li>
			<li class="active">店家帳號</li>
		</ol>


<!-- container 內文開始 =======================================-->
<div class="container">
	<div class="row">
<!-- 左邊開始 =======================================-->
		<div class="col-xs-12 col-sm-3">

			<div class="list-group">
				<a href="#" class="list-group-item list-group-custom active">店家帳號</a>
				<a href="str_profile01.html" class="list-group-item">基本資料</a>
				<a href="str_profile02.html" class="list-group-item list-group-item-info">修改資料</a>
				<a href="str_profile03.html" class="list-group-item">修改密碼</a>
			</div>
		</div>


<!-- 右邊開始 =======================================-->			
		<div class="col-xs-12 col-sm-9">
		
		
			
			<table>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/storeupdata.do" >
				<div class="css_tr">		
					<div class="input-group-addon">店家頭像</div>
					<div class="css_td"><img class="strimg" src="http://localhost:8081<%=request.getContextPath()%>/tools/Mem_Red_Img?str_no=<%= str_no%> "></div>
				</div>
				</FORM>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/storeupdata.do" >
				 
				<div class="css_tr">
					<div class="input-group-addon">店家簡介</div>
					<div class="css_td"><input class="input" type="text" name="STR_NAME" value=<%= storVO.getStr_note()%>></div>
				</div>


				<div class="css_tr">
					<div class="input-group-addon">店家名稱</div>
					<div class="css_td"><input class="input" type="text" name="STR_NAME" value=<%= storVO.getStr_name()%> disabled></div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">店家類別</div>
					<div class="css_td"><input class="input" type="text" name="STOCA_NAME" value=<%= storVO.getStoca_no()%> disabled></div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">店家地址</div>
					<div class="css_td">
						<input class="input" type="text" name="STR_COUN" value=<%= storVO.getStr_cou()%>>
					
						
						<input class="input" type="text" name="STR_CITY" value=<%= storVO.getStr_city()%>>
					
					
						<input class="input" type="text" name="STR_ADDR" value=<%= storVO.getStr_addr()%>>
					</div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">聯絡人</div>
					<div class="css_td">
						<input class="input" type="text" name="STR_ATN" value=<%= storVO.getStr_atn()%>>
					</div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">聯絡電話</div>
					<div class="css_td">
						<input class="input" type="text" name="STR_TEL" value=<%= storVO.getStr_tel()%>>
					</div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">聯絡信箱</div>
					<div class="css_td">
						<input class="input" type="text" name="STR_MAL" value=<%= storVO.getStr_ma()%>>
					</div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">平均備餐時間</div>
					<div class="css_td">
						<select name="month" class="select-sm" id="time">
							<option value=“15”>15</option>
							<option value="30">30</option>
							<option value="60">60</option>
							<option value="90">90</option>
						</select>
						&nbsp;分鐘
					</div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">提供外送</div>
					<div class="css_td">
						<input type="radio" name="STR_SHIP" id="true" value="TRUE" <%= "TRUE".equals(storVO.getStr_ship()) ? "checked" : " "%> >
						<label for="true">Yes</label>&nbsp;
						<input type="radio" name="STR_SHIP" id="false" value="FALSE" <%= "FALSE".equals(storVO.getStr_ship()) ? "checked" : " "%> >
						<label for="false">No</label>
					</div>
				</div>

				<div class="css_tr">
					<div class="css_td">
						<input class="btn btn-update" type="submit" value="修改">
	       				<input type="hidden" name="action" value="getOne_For_Display">
       				</div>
				</div>
       				
				</form>
		
			
			</div>
		
		</div>
		
	
<!-- 右邊結束 =======================================-->
	</div>
</table>



		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<script>
		
		function gettime(){
		
			var time = <%=storVO.getStr_pre()%>;
			
			switch(time) {
		    case 15:
		    	$('#time').val('15');
		        break;
		    case 30:
		    	$('#time').val('30');
		        break;
		    case 60:
		    	$('#time').val('60');
		        break;
		    case 90:
		    	$('#time').val('90');
		        break;
			}
 		}
		
		
		




		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.pro.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.dishclass.model.*"%>
<%
	String str_no = (String) session.getAttribute("str_no");	
	
	if(str_no == null){
		session.setAttribute("str_no", "STR_0003");		
		str_no = (String) session.getAttribute("str_no");		
	}
%>

	<jsp:useBean id="proSvc" scope="page" class="com.pro.model.ProService" />
	<jsp:useBean id="dishclassSvc" scope="page" class="com.dishclass.model.DclaService" />
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Information Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
<!-- 		<link rel="stylesheet" type="text/css" href="../css/base.css"> -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/store/css/style.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/store/css/str_bonus_01.css">
		
			
	</head>
	<body>
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
					<a class="navbar-brand" href="str_profile01.html">百花窯</a>
				</div>
				
		<!-- 手機隱藏選單區=======================================-->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
			<!-- 左選單 =======================================-->
					<ul class="nav navbar-nav">
						<li><a href="str_center.html">店家中心</a></li>
						<li><a href="str_dish.html">菜單專區</a></li>
						<li><a href="str_order.html">訂單專區</a></li>
						<li><a href="str_inform.html">個人訊息</a></li>
						<li><a href="str_advertise.html">廣告專區</a></li>
						<li class="active"><a href="str_bonus.html">優惠專區</a></li>
					</ul>
				
			<!-- 右選單 =======================================-->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">百花窯 您好<b class="caret"></b></a>
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
			<li class="active">優惠專區</li>
		</ol>


<!-- container 內文開始 =======================================-->
	<div class="container">
	<div class="row">
<!-- 左邊開始 =======================================-->
		<div class="col-xs-12 col-sm-3">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-custom active">促銷優惠</a>
				<a href="#" class="list-group-item list-group-item-info">促銷專區總覽</a>
				<a href="#" class="list-group-item">促銷活動申請</a>
				
			</div>
		</div>


<!-- 右邊開始 =======================================-->			
		<div class="col-xs-12 col-sm-9" >
			
				
			<div class="page-header order-page">優惠總覽</div>
		  	<table class="table table-striped">
    		<caption></caption>
    		<thead>
    			<tr>
    				<th>&nbsp;</th>
    				<th>優惠編號</th>
    				<th>開始日期</th>
    				<th>結束日期</th>
    				<th>優惠種類</th>
    				<th>條件</th>
    				<th>折扣</th>
    				
    				
    		</thead>
    			<c:forEach var="proVO" items="${proSvc.getStrPro(str_no)}" > 
    		<tbody>   			
    			<tr>
    				<td></td>
    				<td>${proVO.pro_no}</td>
    				<th>${proVO.pro_str}</th>
    				<th>${proVO.pro_end}</th>
    				<td>${proVO.pro_cat}</td>
    				<td>${(proVO.pro_mon==0) ? '' : proVO.pro_mon}
    					<c:forEach var="dishclassVO" items="${dishclassSvc.all}">
	    					<c:if test="${proVO.dcla_no1 == dishclassVO.dcla_no}">  
	    						${dishclassVO.dcla_name}<br>
	    					</c:if>
	    					<c:if test="${proVO.dcla_no2 == dishclassVO.dcla_no}">  
	    						${dishclassVO.dcla_name}<br>
	    					</c:if> 
    					</c:forEach> 
    				</td>
    				<td>${proVO.pro_dis}</td>
    				<td><button type="button" class="btn btn-danger ">下架</button></td>
    			</tr>  			
    		</tbody>
    		</c:forEach>	
    	</table>
				
    	


				
			
		</div>

	</div>
</div>

		



		
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
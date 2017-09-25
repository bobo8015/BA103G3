<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>

<%
	String str_no = (String) session.getAttribute("str_no");	
	
	if(str_no == null){
		session.setAttribute("str_no", "STR_0003");		
		str_no = (String) session.getAttribute("str_no");		
	}
%>

<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StrService" />


<!DOCTYPE html>
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
						<li><a href="str_order.html">訂單記錄</a></li>
						<li><a href="str_inform.html">個人訊息</a></li>
						<li><a href="str_advertise.html">廣告專區</a></li>
						<li><a href="str_bonus.html">優惠專區</a></li>
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
				<a href="str_profile02.html" class="list-group-item">修改資料</a>
				<a href="str_profile03.html" class="list-group-item list-group-item-info">修改密碼</a>
			</div>
		</div>


<!-- 右邊開始 =======================================-->			
		<div class="col-xs-12 col-sm-9 between">
			
		<form action="" method="">
			<div id="css_table">

				<div class="css_tr">
					<div class="input-group-addon">原本密碼</div>
					<div class="css_td">
						<input class="input" type="text" name="STR_NAME" value="">
					</div>
				</div>


				<div class="css_tr">
					<div class="input-group-addon">更改密碼</div>
					<div class="css_td">
						<input class="input" type="text" name="STR_NAME" value="">
					</div>
				</div>

				<div class="css_tr">
					<div class="input-group-addon">再輸入一次</div>
					<div class="css_td">
						<input class="input" type="text" name="STOCA_NAME" value="">
					</div>
				</div>

				<div class="update">
					<button class="btn btn-update">修改</button>
				</div>

			</div>
		</form>

		</div>
<!-- 右邊結束 =======================================-->
	</div>
</div>


























		
<!-- footer -->
<!-- 		<footer >
	      <div class="container">
	        <div class="col-sm-2">
	          <img src="../images/logo.jpg" class="img-responsive">
	        </div>
	        <div class="col-sm-2">
	          <h5>公司</h5>
	          <ul class="list-unstyled">
	            <li><a href="#">文件資料</a></li>
	            <li><a href="#">Packt出版社</a></li>
	            <li><a href="#">關於我們</a></li>
	            <li><a href="#">聯絡資訊</a></li>
	          </ul>
	        </div>
	        <div class="col-sm-2">
	          <h5>社群</h5>
	          <ul class="list-unstyled">
	            <li><a href="#">Facebook</a></li>
	            <li><a href="#">Twitter</a></li>
	            <li><a href="#">部落格</a></li>
	          </ul>
	        </div>
	        <div class="col-sm-2">
	          <h5>客戶支援</h5>
	          <ul class="list-unstyled">
	            <li><a href="#">聯絡資訊</a></li>
	            <li><a href="#">隱私政策</a></li>
	            <li><a href="#">條款與細則</a></li>
	            <li><a href="#">服務台</a></li>
	          </ul>
	        </div>
	        <div class="col-sm-4">
	          <address>
	            <strong>食在方便有限公司</strong>
	            地址第 1 行<br>
				地址第 2 行<br>
	            <abbr title="Phone">TEL：</abbr> (02) 1234-5678
	          </address>
	        </div>
	      </div>
	    </footer>

 -->


		
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="/js/plugins/piexif.js"></script>
		<script src="/js/fileinput.js"></script>
		<script>
		function $id(id) {
			return document.getElementById(id);
		}
		function Output(msg) {
			var m = $id("messages");
			m.innerHTML = msg + m.innerHTML;
		}
		if (window.File && window.FileList && window.FileReader) {
			Init();
		}
		function Init() {

			var fileselect = $id("fileselect"),
				filedrag = $id("filedrag"),
				submitbutton = $id("submitbutton");

			// file select
			fileselect.addEventListener("change", FileSelectHandler, false);

			// is XHR2 available?
			var xhr = new XMLHttpRequest();
			if (xhr.upload) {
			
				// file drop
				filedrag.addEventListener("dragover", FileDragHover, false);
				filedrag.addEventListener("dragleave", FileDragHover, false);
				filedrag.addEventListener("drop", FileSelectHandler, false);
				filedrag.style.display = "block";
				
				// remove submit button
				submitbutton.style.display = "none";
			}

		}




		</script>
	</body>
</html>
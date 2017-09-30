<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.util.*"%>
<%@ page import="com.adv.model.*"%>

<jsp:useBean id="advSvc" scope="page" class="com.adv.model.AdvService" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>食在方便管理系統</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/easyfood/back-end/css/base.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-3">
		    
                <div id ="small">
                  <img src="<%=request.getContextPath()%>/easyfood/back-end/images/logo.png" width=97%>
                </div>


		    <div class="list-group"><b>
			    <a href="../member/member.html" class="list-group-item list-group-item-warning">會員管理</a>
			    <a href="../store/store.html" class="list-group-item list-group-item-warning">店家管理</a>
			    <a href="../administrator/administrator.html" class="list-group-item list-group-item-warning">管理員管理</a>
          <a href="../admprivileges/admprivileges.html" class="list-group-item list-group-item-warning">管理員權限管理</a>
			    <a href="../report/report.html" class="list-group-item list-group-item-warning">檢舉管理</a>
			    <a href="#" class="list-group-item list-group-item-warning active">廣告管理</a>
		    </b></div>



			</div>
			<div class="col-xs-12 col-sm-9">
			     <br>

			     <!--右邊導覽列-->
			 <div class="row">   
			     <div class="container-fluid">                  
                 <nav class="navbar navbar-default" role="navigation">
                  
                  <div class="navbar-header">
                   <a href="../../index.html" class="navbar-brand" href="#" id="navbar-title"><b>食在方便管理系統</b></a>
                  </div>
                 <ul class="nav navbar-nav navbar-right">
                    <li><a href="class/member/login.html"><span class="glyphicon glyphicon-user"></span><b>員工登入　</b></a></li>
                 </ul>   
                    
                </nav>
                </div>
             </div> 

     <!--==========內容====================-->

	<div class="row second_row">
		<div id="second_content">

    <div >
      <ol class="breadcrumb">
        <li>
          <a href="#">首頁</a>
        </li>
        <li>
          <a href="#">廣告管理</a>
        </li>
      </ol>
      </div>
        <div role="tabpanel">
            <!-- 標籤面板：標籤區 -->
            
            
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">待審核廣告</a>                 
                </li>
                <li role="presentation">
                    <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">上架廣告總覽</a>  
                </li>
            </ul>
            
            <!-- 標籤面板：內容區 -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="tab1">
                	<c:forEach var="advVO1" items="${advSvc.getAllStrAudit()}">	
                	<div class="aaatop">
                		<div>
							<div class="col-xs-12 col-sm-4">開始時間:${advVO1.adv_str }</div>
			                <div class="col-xs-12 col-sm-3">結束時間:${advVO1.adv_end }</div>
			                <div class="col-xs-12 col-sm-3">
			                	<form style="display:inline-block" METHOD="post" ACTION="<%=request.getContextPath()%>/adv/adv_in.do">
			                		<input type="hidden" name="adv_no" value="${advVO1.adv_no}">
			                		<input type="hidden" name="adv_sta" value="通過">
                					<input type="hidden" name="action"value="Update_For_adv">
			                		<button type="submit" class="btn btn-primary btn-sm">通過</button>
			                	</form>
			                	<form style="display:inline-block" METHOD="post" ACTION="<%=request.getContextPath()%>/adv/adv_in.do">
			                		<input type="hidden" name="adv_no" value="${advVO1.adv_no}">
			                		<input type="hidden" name="adv_sta" value="不通過">
                					<input type="hidden" name="action"value="Update_For_adv">
			                		<button type="submit" class="btn btn-danger btn-sm">不通過</button>
			                	</form>	              
	                    </div>

                        </div> 
                		<img src="<%=request.getContextPath()%>/tools/Adv_Red_Img?str_no=${advVO1.str_no}&adv_no=${advVO1.adv_no}">
						     
                    </div>
                    </c:forEach>
                </div>
                
                <div role="tabpanel" class="tab-pane" id="tab2">
             	<c:forEach var="advVO2" items="${advSvc.getAllStrAuditOk()}">
                	<div class="aaatop">
                		<div>
							<div class="col-xs-12 col-sm-4">開始時間:${advVO2.adv_str }</div>
			                <div class="col-xs-12 col-sm-3">結束時間:${advVO2.adv_end }</div>
			                <div class="col-xs-12 col-sm-3">
			                	
	                    </div>
                		<img src="<%=request.getContextPath()%>/tools/Adv_Red_Img?str_no=${advVO2.str_no}&adv_no=${advVO2.adv_no}">
						

                        </div>      
                    </div>	
                	
                	</c:forEach> 
                
                </div>
                
            </div>

           
        </div>
   </div>




	</div>



			</div>

		</div>
	</div>
</div>

<!-- footer -->
    <footer >
      <div class="container">
        <div class="col-sm-2">
          <img src="<%=request.getContextPath()%>/easyfood/back-end/images/logo.png" class="img-responsive">
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
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
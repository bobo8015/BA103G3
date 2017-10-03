<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String mem_no = (String) session.getAttribute("mem_no");

%>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>食在方便</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="short Icon" type="images/x-icon" href="../../images/logo.png">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/easyfood/front-end/css/base.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/easyfood/front-end/class/rank/css/rank.css">

		
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
    <style type="text/css">
      .item1{
        margin-top:10px;
        margin-bottom: 5px;
        background-color: #eee;
        border-radius:10px
      }
      
      .abc{
        -webkit-border-radius: 100px;
        -moz-border-radius: 10px;
        border-radius: 100px;
        padding-top: 5px;
        padding-bottom: 5px;

      } 
      .nav-tabs{
         background-color: #eee;
      }
      .title{
        color: red;       
      }
      .item1_title{
      	color: 	#46A3FF; 
      }
	  

    </style>
	</head>
	<body>


	<!--導覽列==========================================================================-->
<jsp:include page="/easyfood/front-end/navbar.jsp" flush="true" />

<br>
<div class="container">

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12">
				<ol class="breadcrumb">
					<li><a href="<%=request.getContextPath()%>/easyfood/front-end/index.do?action=navbar&title=index">首頁</a></li>
					<li class="active"><a href="#">排行榜</a></li>
				</ol>
			</div>
		</div>
	</div>
	
  <div class="row firstRow">  
	   <div class="col-xs-12 col-sm-6">
	    <H3 class="title">熱門店家排名</H3>
        <div role="tabpanel">
             <!-- 標籤面板：標籤區 -->
             <ul class="nav nav-tabs" role="tablist">
                 <li role="presentation" class="active">
                     <a href="#tab1_1" aria-controls="tab1" role="tab" data-toggle="tab">週排名</a>
                 </li>
                 <li role="presentation">
                     <a href="#tab1_2" aria-controls="tab2" role="tab" data-toggle="tab">月排名</a>
                 </li>
                 <li role="presentation">
                     <a href="#tab1_3" aria-controls="tab3" role="tab" data-toggle="tab">年度排名</a>
                 </li>
             </ul>
         
             <!-- 標籤面板：內容區 -->
             <div class="tab-content">
                 <div role="tabpanel" class="tab-pane active" id="tab1_1">

                 	<div class="container-fluid item1 ">
                    <div class="col-xs-12 col-sm-3">
                    	<div>                    		
                    		<img class="abc img-responsive " src="images/bobo_image/4_7.jpg"  >
                    	</div>		
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <h4 >夏慕尼 - 1桃園中山東店 </h4>
                 		  <div>燒烤類</div>		
                      <div>我是店家簡介</div>
                    </div>              
                  </div>

                  <div class="container-fluid item1">
                    <div class="col-xs-12 col-sm-3">
                      <div>                       
                        <img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                      </div>    
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <h4>夏慕尼 - 2桃園中山東店 </h4>
                 
                      <div>
                     		  我是店家簡介
                      </div>
                    </div>              
                  </div>

 
                    
               </div>
                 <div role="tabpanel" class="tab-pane" id="tab1_2">
                 	<div class="container-fluid item1">
                    <div class="col-xs-12 col-sm-3">
                    	<div>                    		
                    		<img class="abc img-responsive " src="images/bobo_image/4_7.jpg"  >
                    	</div>		
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <h4>夏慕尼 - 3桃園中山東店 </h4>
             
                      <div>
                     	 我是店家簡介
                      </div>
                    </div>              
                  </div>

                  <div class="container-fluid item1">
                    <div class="col-xs-12 col-sm-3">
                      <div>                       
                        <img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                      </div>    
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <h4>夏慕尼 - 4桃園中山東店 </h4>
                 
                      <div>
                     		  我是店家簡介
                      </div>
                    </div>              
                  </div>
                 </div>
                 <div role="tabpanel" class="tab-pane" id="tab1_3">
					         <div class="container-fluid item1">
                    <div class="col-xs-12 col-sm-3">
                      <div>                       
                        <img class="abc img-responsive " src="images/bobo_image/4_7.jpg"  >
                      </div>    
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <h4>夏慕尼 - 5桃園中山東店 </h4>
             
                      <div>
                       我是店家簡介
                      </div>
                    </div>              
                  </div>

                  <div class="container-fluid item1">
                    <div class="col-xs-12 col-sm-3">
                      <div>                       
                        <img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                      </div>    
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <h4>夏慕尼 - 6桃園中山東店 </h4>
                 
                      <div>
                          我是店家簡介
                      </div>
                    </div>              
                  </div>
                </div>
             </div>
         </div> 
     </div>
     
     <div class="col-xs-12 col-sm-6">
        <h3 class="title">熱門種類排名</h3>
        <div role="tabpanel">
             <!-- 標籤面板：標籤區 -->
             <ul class="nav nav-tabs" role="tablist">
                 <li role="presentation" class="active">
                 
                     <a href="#tab2_1" aria-controls="tab1" role="tab" data-toggle="tab">義大利麵</a>             
                 <li role="presentation">
                     <a href="#tab2_2" aria-controls="tab2" role="tab" data-toggle="tab">素食</a>
                 </li>
                 <li role="presentation">
                     <a href="#tab2_3" aria-controls="tab3" role="tab" data-toggle="tab">燉飯</a>
                 </li>
                 <li role="presentation">
                     <a href="#tab2_4" aria-controls="tab4" role="tab" data-toggle="tab">飲品</a>
                 </li>
             </ul>
         
             <!-- 標籤面板：內容區 -->
             <div class="tab-content">
                 <div role="tabpanel" class="tab-pane active" id="tab2_1">
                 	<div class="item1">
                    <div class="col-xs-12 col-sm-3">
                    	<div>
                    		
                    		<img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                    	</div>		
                    </div>
                    <div class="col-xs-12 col-sm-9">
                                    夏慕尼 - 1桃園中山東店 
                      <br><br>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque ducimus minus doloremque id 
                      temporibus omnis ipsam ab dolore, labore beatae.

                    </div>
                    
                  </div>  
                   
                 </div>
                 <div role="tabpanel" class="tab-pane" id="tab2_2">
                  	<div class="item1">
                    <div class="col-xs-12 col-sm-3">
                    	<div>
                    		
                    		<img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                    	</div>		
                    </div>
                    <div class="col-xs-12 col-sm-9">
                                    夏慕尼 - 2桃園中山東店 
                      <br><br>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque ducimus minus doloremque id 
                      temporibus omnis ipsam ab dolore, labore beatae.

                    </div>
                    
                  </div> 
                   
                 </div> 
                 <div role="tabpanel" class="tab-pane" id="tab2_3">
                  	<div class="item1">
                    <div class="col-xs-12 col-sm-3">
                    	<div>
                    		
                    		<img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                    	</div>		
                    </div>
                    <div class="col-xs-12 col-sm-9">
                                    夏慕尼 - 3桃園中山東店 
                      <br><br>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque ducimus minus doloremque id 
                      temporibus omnis ipsam ab dolore, labore beatae.

                    </div>
                    
                  </div> 
                   
                 </div>
                 <div role="tabpanel" class="tab-pane" id="tab2_4">
                 	<div class="item1">
                    <div class="col-xs-12 col-sm-3">
                    	<div>
                    		
                    		<img class="abc img-responsive" src="images/bobo_image/4_7.jpg"  >
                    	</div>		
                    </div>
                    <div class="col-xs-12 col-sm-9">
                                    夏慕尼 - 4桃園中山東店 
                      <br><br>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque ducimus minus doloremque id 
                      temporibus omnis ipsam ab dolore, labore beatae.

                    </div>
                    
                  </div>  
                   
                 </div>
             </div>
         </div> 
     </div>
    
	</div>
</div>



    <footer >
      <div class="container">
        <div class="col-sm-2">
          <img src="../../images/logo.png" class="img-responsive">
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
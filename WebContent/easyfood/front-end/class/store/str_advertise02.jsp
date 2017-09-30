<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyfood/front-end/class/store/css/style.css">
		<style type="text/css">
			.page-header.order-page {
				margin-top: 0;
				margin-bottom: 20px;
				font-size: 24px;
			}
			form.search,
			.input-group-sm {
				line-height: 2;
				display: flex;
			}
			span.middle,
			span.divider {
				margin-left: 8px;
				margin-right: 8px;
				vertical-align: middle;
			}
			th {
				font-size: 16px;
				max-width: 100%;
				white-space:nowrap;
			}
			td {
				font-size: 14px;
				max-width: 100%;
				white-space:nowrap;
			}
			caption {
				font-size: large;
				text-align: center;
				color: #777;
			}
			.input-sm {
				border: 2px solid #ccc;
				border-top-right-radius: 0;
				border-bottom-right-radius: 0;
			}
			button.btn.btn-query.btn-sm {
				border-top-left-radius: 0;
				border-bottom-left-radius: 0;
				color: #fff;
				font-size: 14px;
			}
			.pagination>li>a {
				color: #34495E;
				font-size: 18px;
			}
			.pagination>li>a:focus {
				color: #fff;
				background-color: #888;
				border-color: #888;
			}
			.pager>li>a {
				color: #34495E;
				font-size: 18px;
			}
			.pager>li>a:focus {
				color: #fff;
				background-color: #888;
				border-color: #888;
			}
			.btn {
				font-size: 15px;
				text-align: right;
				padding: 3px;
				margin-top: 10px;
            }
            .margintt{
             	margin-bottom: 5px;	
             } 
		</style>
		
		<%java.sql.Date date_SQL = new java.sql.Date(System.currentTimeMillis());%>
        <%String mem_no = (String) session.getAttribute("str_no");	
			if(mem_no == null){
				session.setAttribute("str_no", "STR_0003");		
				mem_no = (String) session.getAttribute("str_no");		
			}   
		%>
	</head>
	<body>
<!-- header======================================= -->	
		<div class="page-header center-header">
		  <span>���b��K<small>���a����</small></span>
		</div>

<!-- navbar======================================= -->
		<nav class="navbar center-navbar navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
						<span class="sr-only">������</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="str_profile01.html">�ʪ�`</a>
				</div>
				
		<!-- ������ÿ���=======================================-->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
			<!-- ����� =======================================-->
					<ul class="nav navbar-nav">
						<li><a href="str_center.html">���a����</a></li>
						<li><a href="str_dish.html">���M��</a></li>
						<li><a href="str_order.html">�q��M��</a></li>
						<li><a href="str_inform.html">�ӤH�T��</a></li>
						<li><a href="str_advertise.html">�s�i�M��</a></li>
						<li class="active"><a href="str_bonus.html">�u�f�M��</a></li>
					</ul>
				
			<!-- �k��� =======================================-->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">�ʪ�` �z�n<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="str_profile01.html">���a���</a></li>
								<li><a href="str_order.html">�q��d��</a></li>
								<li><a href="str_inform.html">�ӤH�T��</a></li>
							</ul>
						</li>
						<li><a href='#modal-id' data-toggle="modal">�n�X</a></li>
					</ul>
				</div>
		<!-- ������ÿ��ϵ��� =======================================-->
			</div>
		</nav>

<!-- modal�n�X���� =======================================-->
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">�T�w�n�X</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-success" data-dismiss="modal">����</button>
					</div>
				</div>
			</div>
		</div>
		
<!-- breadcrumb �ѥ]�h =======================================-->
		<ol class="breadcrumb">
			<li>
				<a href="../index.html">����</a>
			</li>
			<li>
				<a href="str_center.html">���a����</a>
			</li>
			<li class="active">�u�f�M��</li>
		</ol>


<!-- container ����}�l =======================================-->
	<div class="container">
	<div class="row">
<!-- ����}�l =======================================-->
		<div class="col-xs-12 col-sm-3">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-custom active">�Z�n�s�i</a>
				<a href="#" class="list-group-item ">�s�i�`��</a>
				<a href="#" class="list-group-item list-group-item-info">�s�i�W�[�ӽ�</a>
				
			</div>
		</div>


<!-- �k��}�l =======================================-->			
		<div class="col-xs-12 col-sm-9" >
		
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/adv/adv_in.do" enctype="multipart/form-data">
				<div class="page-header order-page">�s�i�W�[�ӽ�</div>
				<div class="margintt"><td>�}�l���:</td>
					<input type="date" id="bookdate" name="adv_str" value=<%=date_SQL%> min=<%=date_SQL%> max="2020-09-18">
				</div>
				<div class="margintt"><td>�������:</td>
					<input type="date" id="bookdate" name="adv_end"value=<%=date_SQL%> min=<%=date_SQL%> max="2020-09-18">
				</div>
				<div class="margintt">
					<img id="image" class="strimg" width="600" height="300">				
					<input type="file" id="files" name="adv_img" value=""/>							
					<input type="hidden" name="action" value="In_For_Adv">
					<input class="btn btn-primary" type="submit" value="�e�X" />				
				</div>
			</form>	
		</div>
			
	</div>
</div>

		
		<script>
			document.getElementById("files").onchange = function () {
			    var reader = new FileReader();
	
			    reader.onload = function (e) {
			        // get loaded data and render thumbnail.
			        document.getElementById("image").src = e.target.result;
			    };
	
			    // read the image file as a data URL.
			    reader.readAsDataURL(this.files[0]);
			};
		</script>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
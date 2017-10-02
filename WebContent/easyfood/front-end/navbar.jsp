<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.tools.*" %>
<% 
String navbar_page=(String) request.getAttribute("navbar_page");
String mem_no = (String) session.getAttribute("mem_no");
if(mem_no==null){
	session.setAttribute("mem_no","MEM_0002");
	mem_no=(String) session.getAttribute("mem_no");
}

String mem_name=tools.getMemName(mem_no);

String navbar_select=(String) session.getAttribute("navbar_select");
%>



	<!--導覽列=============================================================================================-->
	<header>

	
		    <div class="navbar navbar-default" id="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">選單切換</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="<%=request.getContextPath()%>/easyfood/front-end/index.do?action=navbar&title=index" class="navbar-brand" 
						id="navbar-title"><img src="<%=request.getContextPath()%>/easyfood/front-end/images/logo.png" width="30px"
						id="imgTop" class="pull-left"><b>食在方便</b></a>
			</div>
	
	
	   <div class="collapse navbar-collapse navbar-ex1-collapse">
		<nav class="navbar navbar-default navbar-fixed-top" id="navbar-default">
			<div class="container">
				<div class="navbar-header">
					<a href="<%=request.getContextPath()%>/easyfood/front-end/index.do?action=navbar&title=index" class="navbar-brand" 
						id="navbar-title"><img src="<%=request.getContextPath()%>/easyfood/front-end/images/logo.png" width="30px"
						id="imgTop" class="pull-left"><b>食在方便</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="<%=request.getContextPath()%>/easyfood/front-end/index.do?action=navbar&title=search" id="search"  style="<%="search".equals(navbar_select) ? "background-color:#C63300;border-color: #C63300;" : "" %>" >搜尋店家</a></li>
					<li><a href="<%=request.getContextPath()%>/easyfood/front-end/index.do?action=navbar&title=blog" id="blog" style="<%="blog".equals(navbar_select) ? "background-color:#C63300;border-color: #C63300;" : "" %>">美食日記</a></li>
					<li><a href="#">排行榜</a></li>
					<li><a href="#">便當盒</a></li>
					<li><a href="<%=request.getContextPath()%>/easyfood/front-end/index.do?action=navbar&title=member" id="member" style="<%="member".equals(navbar_select) ? "background-color:#C63300;border-color: #C63300;" : "" %>">會員專區</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				    <% if(mem_no!=null){%>
				    <li><a href="#"><span
							class="glyphicon glyphicon-user"></span><b><%=mem_name %>　您好</b></a></li>
					<li><a href="#"><b> 登出</b></a></li>
				    <%}else{ %>
					<li><a href="class/member/login.html"><span
							class="glyphicon glyphicon-user"></span><b> 會員登入</b></a></li>
					<li><a href="class/store/str_login.html"><span
							class="glyphicon glyphicon-home"></span><b> 店家登入</b></a></li>
					<%} %>		
				</ul>

			</div>
		</nav>
		</div>

	</header>





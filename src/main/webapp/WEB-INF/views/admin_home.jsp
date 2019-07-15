<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Admin_Home</title>
<style type="text/css">
	#container {
	 	box-sizing: border-box;
		width: 100vw;
		height: 150px;
	}
	
	#header>div {
			background-color:#FF6600;
		color: white;
	}
	

	
	#leftbar {
		float: left;
		width: 140px;
		height: 100vh;
		background-color: #FFCC99;
		overflow: visible;
		padding: 5px;
			
	}
	
	#leftbar ul{
		margin-left: 0;
		padding-left: 0;
		list-style-type: none;
		font: bold;
		font-size: 1em;
	}
	
	#menulist>li{
		margin-top: 15px;
		margin-left: 5px;
	}


</style>
</head>
<body> 

	<div id="container">
	
		<div id="header">
			<div>
				<h1>&nbsp;ICT레시피</h1>
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;ICT RECIPE</h3>
			</div>
			
		</div>
	
	
		<!--메뉴영역-->
		<div id="leftbar">
			<ul id="menulist"> 
			<!-- <li><input type="button" value="[HOME]" onclick="ad_home_go(this.form)" style="background-color: #FFCC99"/></li>
			<li><input type="button" value="레시피 관리" onclick="ad_recipe_manage_go(this.form)" style="background-color: #FFCC99"/></li> -->
			<li><a class="lef-nav-menu" href="ad_home">[HOME]</a></li>
			<li><a class="lef-nav-menu" href="ad_recipe_manage">레시피 관리</a></li>
			<li><a class="lef-nav-menu" href="ad_content_add">게시물 등록</a></li>
			<li><a class="lef-nav-menu" href="ad_member_manage">회원관리</a></li>
			<li><a class="lef-nav-menu" href="ad_qna_manage">문의관리</a></li>
			<li><a class="lef-nav-menu" href="ad_event_manage">이벤트관리</a></li>
			<li><a class="lef-nav-menu" href="ad_op_manage">운영자 관리</a></li>
			<li><a class="lef-nav-menu" href="ad_option">설정</a></li>
			</ul>
		</div>
	
	
	

	
	</div>
	
	<script type="text/javascript">
		function home_go(f){
			f.action="amdin_home.jsp";
		}		
	</script>


	<body style="position: relative;">
		<jsp:include page="admin_body.jsp" />
	</body>
</body>
</html>


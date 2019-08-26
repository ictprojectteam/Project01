<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Recipe</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
body, html{
	width: 100%;
	height: 100%;
	overflow: hidden;
}
*{
	margin: 0;
	padding: 0;
	font-family: monospace;
	box-sizing: border-box;
	transition: all ease-in-out .2s;
}
#container{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #f7f7f7;
	overflow: auto;
}
nav{
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 200px;
	margin-left: 0px;
	height: 100%;
	background-color: #333333;
}
#logo{
	height: 50px;
	background-color: #333333;
	color: #1E90FE;
	text-align: center;
	line-height: 50px;
	font-size: 1.3em;
	font-family: arial;
}
#logo span{
	font-size: 1em;
	font-family: monospace;
	font-style: italic;
	color: #f7f7f7;
}
#menu{
	width: 100%;
	background-color: #333333;
	min-height: 1500px;
}
#menu li{
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: #333333;
}
#menu li>a{
	font-size: 1.05em;
	font-family: arial;
	width: 100%;
	height: 100%;
	color: #f7f7f7;
	display: block;
	text-align: center;
	text-decoration: none;
}
#menu li:hover{
	background-color: #151515;
}
#menu li>a:hover{
	color: #1E90FF;
	border-left: 3px solid #1E90FF;
}
header{
	width: calc(100% - 200px);
	height: 50px;
	position: absolute;
	display: block;
	top: 0;
	left: 200px;
	background-color: #333333;
	color: #f7f7f7;
	line-height: 50px;
}
header #links{
	float: right;
	height: 50px;
	display: block;
	color: #f7f7f7;
	font-size: 1em;
	margin-right: 1em;
}
#links>a{
	color: #f7f7f7;
	text-decoration: none;
	padding: 0.5em;
	width: 100%;
	height: 100%;
	display: block;
}
#links:hover{
	background-color: #1E90FF;
}
#search-table{
	margin: 5px;
}
#double{
	display: grid;
	grid-template-columns: 140px 360px 140px 360px;
}
.label{
	border: 0.5px solid #999;
	background: #ccc;
	padding: 10px;
	font-weight: bolder;
	color: #2b686e;
}
.content{
	padding: 10px;
	border: 0.5px solid #999;
}
.content input[type=text]{
	width: 95%;
	padding-right: 10px;
}
#input-name{
	width: 70%;
	padding-right: 10px;
}
.reg{
	display: grid;
	grid-template-columns: 140px 860px;
}
#button{
	width: 160px;
	margin: 5px auto;
}
#button input{
	width: 100%;
}
#main{
	margin-left: 20em;
	margin-top: 5em;
}
#body{
	border: 1px solid #999;
	width: 1002px;
	margin: 10px 5px;
}
.title-line{
	width: 1002px;
	display: grid;
	grid-template-columns: 90px 90px 90px 150px 250px 90px 120px 120px;
	text-align: center;
}
#content-box{
	width: 1002px;
}
.each-content{
	width: 1002px;
	display: grid;
	grid-template-columns: 90px 90px 90px 150px 250px 90px 120px 120px;
	text-align: center;
}
.each-content:hover{
	background: #ccc;
	cursor: pointer;
}
#empty{
	width: 1002px;
	text-align: center;
	font-size: 12pt;
	padding: 10px;
}
.title{
	border: 0.5px solid #999;
	font-size: 10pt;
	font-weight: bolder;
	padding: 5px;
	background: #ccc;
	color: #2b686e;
}
.body-content{
	padding: 5px;
	border: 0.5px solid #bbb;
	overflow: hidden;
}
.comp{
	background: #9f9;
}
.waiting{
	background: #f99;
}
legend{
	font-size: 16pt;
	font-weight: bolder;
}
/* paging */
.paging{
	width: 1000px;
	text-align: center;
	margin: 5px;
}
.paging .now{
	margin-right: 8px;
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
.paging [class^=page]{
	padding: 3px 7px;
	color: #2f313e;
	font-weight: bold;
}
.paging [class^=page]:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
	cursor: pointer;
}
.disable {
	padding: 3px 7px;
	color: silver;
}
.content-inf{
	cursor: pointer;
}
.content-inf:hover{
	background: #ddd;
}
</style>
<script>
	var rvo = {};
	$(function(){
		$("#today").on("click", function(){
			var date = new Date(Date.now() - new Date().getTimezoneOffset()*60000);
			$("#start").val(date.toISOString().substring(0, 10));
			$("#end").val(date.toISOString().substring(0, 10));
		});
		
		$("#yesterday").on("click", function(){
			var date = new Date(Date.now() - new Date().getTimezoneOffset()*60000);
			$("#end").val(date.toISOString().substring(0, 10));
			date.setDate(date.getDate() - 1);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		
		$("#week").on("click", function(){
			var date = new Date(Date.now() - new Date().getTimezoneOffset()*60000);
			$("#end").val(date.toISOString().substring(0, 10));
			date.setDate(date.getDate() - 7);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		$("#month").on("click", function(){
			var date = new Date(Date.now() - new Date().getTimezoneOffset()*60000);
			$("#end").val(date.toISOString().substring(0, 10));
			date.setMonth(date.getMonth() - 1);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		$("#3month").on("click", function(){
			var date = new Date(Date.now() - new Date().getTimezoneOffset()*60000);
			$("#end").val(date.toISOString().substring(0, 10));
			date.setMonth(date.getMonth() - 3);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		$("#start").on("change", function(){
			if($("#end").val() < $("#start").val()) $("#end").val($("#start").val());
			$("#end").attr("min", $("#start").val());
			$("#start").attr("max", $("#end").val());
		});
		$("#end").on("change", function(){
			if($("#start").val() > $("#end").val()) $("#start").val($("#end").val());
			$("#end").attr("min", $("#start").val());
			$("#start").attr("max", $("#end").val());
		});
		$("[name=a_permission]").on("change", function(){
			rvo.a_permission = $("[name=a_permission]:checked").val();
			load_list(rvo);
		});
		$("[name=type]").on("change", function(){
			rvo.type = $("[name=type]:checked").val();
			load_list(rvo);
		});
		$("#month").click();
		getList();
		load_page(1);
	});
	
	function getList(){
		$.ajax({
			url: "admin_rlist",
			dataType: "text",
			type : "post",
			success: function(data){
				$("#content-box").empty();
				$("#content-box").append(data);
			},
			error: function(){
				alert("읽기 실패");
			}
		});
	}
	function search_recipe() {
		rvo = {};
		var name = $("#input-name").val();
		if(name != "") {
			if($("[name=name_idx]").val() == "name") rvo.name = name;
			if($("[name=name_idx]").val() == "id") rvo.id = name;
			if($("[name=name_idx]").val() == "idx") rvo.r_idx = name; 
		}
		var email = $("[name=email]").val();
		if(email != "") rvo.email = email;
		var r_title = $("[name=recipe_title]").val();
		if(r_title != "") rvo.recipe_title = r_title;
		rvo.a_permission = $("[name=a_permission]:checked").val();
		rvo.type = $("[name=type]:checked").val();
		rvo.start = $("#start").val();
		rvo.endt = $("#end").val();
		
		load_list(rvo);
	}
	function move_page(e) {
		rvo.cPage = e;
		load_list(rvo);
	}
	
	function load_list(e) {
		$.ajax({
			url: "admin_rlist",
			data : e,
			dataType: "text",
			type : "post",
			success: function(data){
				$("#content-box").empty();
				$("#content-box").append(data);
			},
			error: function(){
				alert("읽기 실패");
			}
		});
		load_page(e);
	}
	
	function load_page(cPage) {
		$.ajax({
			url: "admin_rpage",
			data : cPage,
			dataType: "text",
			type : "post",
			success: function(data){
				$(".paging").empty();
				$(".paging").append(data);
			},
			error: function(){
				alert("읽기 실패");
			}
		});
	}
	
	function view(e) {
		location.href="admin_view_one_recipe?r_idx=" + e;
	}
</script>
</head>
<body>
	<div id="container">
		<nav>
			<div id="logo">
				ICT레시피 <span>ict recipe</span>
			</div>
			<ul id="menu">
				<li><a id="home" href="home">HOME</a></li>
				<li><a id="recipe" href="a_recipe">레시피 관리</a></li>
				<li><a id="content" href="a_write_recipe">게시물 등록</a></li>
				<li><a id="user" href="a_membership">회원 관리</a></li>
				<li><a id="board" href="admin_qna">문의 관리</a></li>
				<li><a id="event" href="admin_event">이벤트 관리</a></li>
				<li><a id="op" href="a_manager">운영자 관리</a></li>
				<li><a id="setting" href="/">Main</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<a href="logout">로그아웃</a>
			</div>
		</header>
		<div id="main">
			<div id="user-action">
				<form id="search-form">
					<fieldset style="width: 1000px;">
						<legend>레시피 관리</legend>
							<div id="search-table">
								<div id="double">
									<div class="label">회원이름/회원ID<br>고유ID</div>
									<div class="content">
										<select name="name_idx">
											<option value="name">회원이름</option>
											<option value="id">회원ID</option>
											<option value="idx">고유ID</option>
										</select>
										<input type="text" name="name" id="input-name">
									</div>
									<div class="label">이메일</div>
									<div class="content">
										<input type="text" name="email">
									</div>
								</div>
								<div class="reg">
									<div class="label">레시피 제목</div>
									<div class="content">
										<input type="text" name="recipe_title">
									</div>
								</div>
								<div class="reg">
									<div class="label">상태별</div>
									<div class="content">
										<input type="radio" name="a_permission" value="" checked>전체
										<input type="radio" name="a_permission" value="0">승인대기
										<input type="radio" name="a_permission" value="1">승인완료
									</div>
								</div>
								<div class="reg">
									<div class="label">종류별</div>
									<div class="content">
										<input type="radio" name="type" value="" checked>전체
										<input type="radio" name="type" value="1">일반레시피
										<input type="radio" name="type" value="2">영상레시피
									</div>
								</div>
								<div class="reg">
									<div class="label">등록일시</div>
									<div class="content">
										<input type="date" id="start" name="start" min="2019-01-01" max="2019-12-31">
										<a>~</a>
										<input type="date" id="end" name="endt" min="2019-01-01" max="2019-12-31">
										<input type="button" id="today" value="오늘">
										<input type="button" id="yesterday" value="어제">
										<input type="button" id="week" value="7일">
										<input type="button" id="month" value="1개월">
										<input type="button" id="3month" value="3개월">
									</div>
								</div>
								<div id="button">
									<input type="button" id="search" value="검  색" onclick="search_recipe()">
								</div>
							</div>
					</fieldset>
				</form>
				<div id="body">
					<div class="title-line">
						<div class="title">고유ID</div>
						<div class="title">회원이름</div>
						<div class="title">아이디</div>
						<div class="title">이메일</div>
						<div class="title">레시피 제목</div>
						<div class="title">종류 구분</div>
						<div class="title">등록 일시</div>
						<div class="title">게시글 상태</div>
					</div>
					<div id="content-box">
						
					</div>
				</div>
				<div class="paging">
				   
				</div>
			</div>
		</div>
	</div>
</body>
</html>
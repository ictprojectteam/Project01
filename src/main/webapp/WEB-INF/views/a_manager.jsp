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
	width:70%;
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
	width: 980px;
	display: grid;
	grid-template-columns: 40px 110px 90px 120px 200px 200px 70px 170px;
	text-align: center;
}
#content-box{
	width: 980px;
}
.each-content{
	width: 1000px;
	display: grid;
	grid-template-columns: 40px 110px 90px 120px 200px 200px 70px 170px;
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
#foot{
	width: 1002px;
	margin: 10px 5px;
	text-align: right;
}
.reg-button{
	display: inline-block;
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #777;
	background: #ccc;
	cursor: pointer;
}
/* paging */
.paging{
	clear: both;
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
.empty{
	padding: 5px;
	font-size: 12pt;
	color: #aaa;
}
</style>
<script>
	var mvo = {};
	mvo.cPage = 1;
	$(function(){
		$("#today").on("click", function(){
			var date = new Date();
			$("#start").val(date.toISOString().substring(0, 10));
			$("#end").val(date.toISOString().substring(0, 10));
		});
		
		$("#yesterday").on("click", function(){
			var date = new Date();
			$("#end").val(date.toISOString().substring(0, 10));
			date.setDate(date.getDate() - 1);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		
		$("#week").on("click", function(){
			var date = new Date();
			$("#end").val(date.toISOString().substring(0, 10));
			date.setDate(date.getDate() - 7);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		$("#month").on("click", function(){
			var date = new Date();
			$("#end").val(date.toISOString().substring(0, 10));
			date.setMonth(date.getMonth() - 1);
			$("#start").val(date.toISOString().substring(0, 10));
		});
		$("#3month").on("click", function(){
			var date = new Date();
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
		
		$("#month").click();

		$(".reg-button").on("click", function(){
			location.href = 'a_reg_manager';
		});
		
		getList();
		load_page(mvo);
	});
	
	function getList(){
		$.ajax({
			url: "admin_mnglist",
			dataType: "json",
			type : "post",
			success: function(data){
				$("#content-box").empty();
				var res = "";
				$.each(data, function(k, v){
					res += "<div class='each-content' onclick='view(" + v["mng_idx"] + ")'><div class='body-content'>" + v["mng_idx"] + 
						"</div><div class='body-content'>" + v["name"] + "</div><div class='body-content'>" + v["id"] +
						"</div><div class='body-content'>" + v["mng_contact"] + "</div><div class='body-content'>" + v["email"] + 
						"</div><div class='body-content'>" + v["mng_email"] + "</div><div class='body-content'>" + v["mng_grade"] + 
						"</div><div class='body-content'>" + v["mng_regdate"] + "</div></div>";     
				});
				$("#content-box").append(res);
			},
			error: function(){
				alert("읽기 실패1");
			}
		});
	}
	
	function search_manager() {
		mvo = {};
		mvo.cPage = 1;
		var name = $("#input-name").val();
		if(name != "") {
			if($("[name=name_idx]").val() == "name") mvo.name = name;
			if($("[name=name_idx]").val() == "id") mvo.id = name;
		}
		var email = $("[name=email]").val();
		if(email != "") {
			if($("[name=email_number]").val() == "email") mvo.mng_email = email;
			if($("[name=email_number]").val() == "number") mvo.mng_contact = email;
		}
		mvo.start = $("#start").val();
		mvo.endt = $("#end").val();
		load_list(mvo);
	}
	
	function move_page(e) {
		mvo.cPage = e;
		load_list(mvo);
		load_page(mvo);
	}
	 
	function load_list(e) {
		$.ajax({
			url: "admin_mnglist",
			data : e,
			dataType: "json",
			type : "post",
			success: function(data){
				$("#content-box").empty();
				var res = "";
				if(data != null && data != "") {
					$.each(data, function(k, v){
						res += "<div class='each-content' onclick='view(" + v["mng_idx"] + ")'><div class='body-content'>" + v["mng_idx"] + 
						"</div><div class='body-content'>" + v["name"] + "</div><div class='body-content'>" + v["id"] +
						"</div><div class='body-content'>" + v["mng_contact"] + "</div><div class='body-content'>" + v["email"] + 
						"</div><div class='body-content'>" + v["mng_email"] + "</div><div class='body-content'>" + v["mng_grade"] + 
						"</div><div class='body-content'>" + v["mng_regdate"] + "</div></div>";     
					});
				} else {
					res += "<div class='empty'>원하는 정보가 없습니다.</div>";
				}
				
				$("#content-box").append(res);
				load_page(e);
			},
			error: function(){
				alert("읽기 실패2");
			}
		});
	}

	function load_page(e) {
		$.ajax({
			url: "admin_mngPaging",
			data : e,
			dataType: "json",
			type : "post",
			success: function(data) {
				$(".paging").empty();
				var res = "";
				if(data.beginBlock <= data.pagePerBlock){
					res += "<span class='disable'> 이전으로 </span>";
				} else {
					res += "<span class='active pre-block'> 이전으로 </span>";
				}
				for(var i = data.beginBlock; i <= data.endBlock; i++) {
					if(i == data.nowPage) {
						res += "<span class='now'>" + i + "</span>";
					} else {
						res += "<span class='page'>" + i + "</span>";
					}
				}
				if(data.endBlock >= data.totalPage){
					res += "<span class='disable'> 다음으로 </span>";
				} else {
					res += "<span class='active next-block'> 다음으로 </span>";
				}
				$(".paging").append(res);
			},
			error: function(){
				alert("읽기 실패2");
			}
		});
	}
	/* 
	function load_page(cPage) {
		$.ajax({
			url: "admin_oppage",
			data : cPage,
			dataType: "text",
			type : "post",
			success: function(data){
				$(".paging").empty();
				$(".paging").append(data);
			},
			error: function(){
				alert("읽기 실패3");
			}
		});
	}
	 */
	function view(e) {
		location.href="admin_view_one_member?m_idx=" + e;
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
				<a href="m">로그아웃</a>
			</div>
		</header>
		<div id="main">
			<div id="user-action">
				<form id="search-form">
					<fieldset style="width: 1000px;">
						<legend>운영자 관리</legend>
							<div id="search-table">
								<div id="double">
									<div class="label">이름/ID</div>
									<div class="content">
										<select name="name_idx">
											<option value="name">이름</option>
											<option value="id">ID</option>
										</select>
										<input type="text" name="name" id="input-name">
									</div>
									<div class="label">이메일/연락처</div>
									<div class="content">
										<select name="email_number">
											<option value="email">이메일</option>
											<option value="number">연락처</option>
										</select>
										<input type="text" name="email" id="input-email">
									</div>
								</div>
								<div class="reg">
									<div class="label">가입일시</div>
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
									<input type="button" id="search" value="검  색" onclick="search_manager()">
								</div>
							</div>
					</fieldset>
				</form>
				<div id="body">
					<div class="title-line">
						<div class="title">NO.</div>
						<div class="title">회원이름</div>
						<div class="title">ID</div>
						<div class="title">연락처</div>
						<div class="title">이메일</div>
						<div class="title">개인 이메일</div>
						<div class="title">직책</div>
						<div class="title">가입 일시</div>
					</div>
					<div id="content-box">
						
					</div>
				</div>
				<div id="foot">
					<span class="reg-button">신규 등록</span>
				</div>
				<div class="paging">
				    <c:choose>
				    	<c:when test="${qp.beginBlock <= qp.pagePerBlock}">
				    		<span class="disable"> 이전으로 </span>
				    	</c:when>
				    	<c:otherwise>
				    		<span><a href="admin_qna?cPage=${qp.beginBlock-qp.pagePerBlock}"> 이전으로 </a></span>
				    	</c:otherwise>
				    </c:choose>
				    
					<c:forEach begin="${qp.beginBlock}" end="${qp.endBlock}" step="1" var="k">
						<c:if test="${k==qp.nowPage}">
							<span class="now">${k}</span>
						</c:if>
						<c:if test="${k!=qp.nowPage}">
							<span class="page${k}">${k}</span>
						</c:if>
					</c:forEach>
					
					<c:choose>
				    	<c:when test="${qp.endBlock >= qp.totalPage }">
				    		<span class="disable"> 다음으로 </span>
				    	</c:when>
				    	<c:otherwise>
				    		<span><a href="admin_qna?cPage=${qp.beginBlock+qp.pagePerBlock}"> 다음으로 </a></span>
				    	</c:otherwise>
				    </c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
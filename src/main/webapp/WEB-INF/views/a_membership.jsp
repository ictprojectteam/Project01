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
	width: 980px;
	display: grid;
	grid-template-columns: 100px 150px 300px 150px 100px 200px;
	text-align: center;
}
#content-box{
	width: 980px;
}
.each-content{
	width: 1000px;
	display: grid;
	grid-template-columns: 100px 150px 300px 150px 100px 200px;
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
#body td{
	text-align: center;
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
	var mvo = {};
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
		
		$("#month").click();
		getList();
		load_page(1);
	});
	
	function getList(){
		$.ajax({
			url: "admin_mlist",
			dataType: "text",
			type : "post",
			success: function(data){
				$("#content-box").empty();
				$("#content-box").append(data);
			},
			error: function(){
				alert("읽기 실패1");
			}
		});
	}
	function search_member() {
		mvo = {};
		var name = $("#input-name").val();
		if(name != "") {
			if($("[name=name_idx]").val() == "name") mvo.name = name;
			if($("[name=name_idx]").val() == "id") mvo.id = name;
			if($("[name=name_idx]").val() == "idx") mvo.m_idx = name; 
		}
		var email = $("[name=email]").val();
		if(email != "") mvo.email = email;
		mvo.start = $("#start").val();
		mvo.endt = $("#end").val();
		
		load_list(mvo);
	}
	function move_page(e) {
		mvo.cPage = e;
		load_list(mvo);
	}
	
	function load_list(e) {
		$.ajax({
			url: "admin_mlist",
			data : e,
			dataType: "text",
			type : "post",
			success: function(data){
				$("#content-box").empty();
				$("#content-box").append(data);
			},
			error: function(){
				alert("읽기 실패2");
			}
		});
		load_page(e);
	}
	function load_page(cPage) {
		$.ajax({
			url: "admin_mpage",
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
	function view(e) {
		location.href="admin_view_one_member?m_idx=" + e;
	}
</script>
</head>
<body>
	<div id="container">
		<jsp:include page="admin_menu.jsp" />
		<div id="main">
			<div id="user-action">
				<form id="search-form">
					<fieldset style="width: 1000px;">
						<legend>회원 관리</legend>
							<div id="search-table">
								<div id="double">
									<div class="label">회원이름/회원ID<br>회원번호</div>
									<div class="content">
										<select name="name_idx">
											<option value="name">회원이름</option>
											<option value="id">회원ID</option>
											<option value="idx">회원번호</option>
										</select>
										<input type="text" name="name" id="input-name">
									</div>
									<div class="label">이메일</div>
									<div class="content">
										<input type="text" name="email">
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
									<input type="button" id="search" value="검  색" onclick="search_member()">
								</div>
							</div>
					</fieldset>
				</form>
				<div id="body">
					<div class="title-line">
						<div class="title">회원번호</div>
						<div class="title">회원이름</div>
						<div class="title">이메일</div>
						<div class="title">아이디</div>
						<div class="title">성별</div>
						<div class="title">가입 일시</div>
					</div>
					<div id="content-box">
						
					</div>
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
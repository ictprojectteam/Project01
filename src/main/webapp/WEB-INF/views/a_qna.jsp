<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin qna</title>
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
	grid-template-columns: 120px 380px 120px 380px;
}
.label{
	border: 0.5px solid #999;
	background: #ccc;
	padding: 5px 10px;
	font-weight: bolder;
	color: #2b686e;
}
.content{
	padding: 10px;
	border: 0.5px solid #999;
}
.content input[type=text]{
	width: 75%;
	padding-right: 10px;
}
#date{
	display: grid;
	grid-template-columns: 120px 880px;
	
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
	display: grid;
	grid-template-columns: 90px 100px 150px 90px 280px 100px 120px 70px;
	text-align: center;
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
.body-content button{
	display: block;
	width: 100%;
	height: 100%;
}
.body-content button:hover{
	color: #4f4;
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
#qna-modal{
	z-index:3;
	display:none;
	padding-top:100px;
	position:fixed;
	left:0;
	top:0;
	width:100%;
	height:100%;
	overflow:auto;
	background-color: #0008;
}
#qna-modal-content{
	margin:auto;
	background-color:#fff;
	position:relative;
	padding:0;
	outline:0;
	width:350px;
	border: 1px solid #aaa;
	animation: animatetop 0.4s;
	border-radius: 15px;
}
#qna-modal-content div{
	padding: 13px;
}
@keyframes animatetop{
	from{top:-300px;opacity:0}
	to{top:0;opacity:1}
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
.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}	
</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
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
		$("[class^=page]").on("click", function(){
			var p = $(this).text();
			var l = window.location.href;
			if (l.match(/cPage/)) {
				l = l.substring(0, l.length - 1);
				l = l + p;
			} else if (l.match(/\?/)) {
				l = l + "&cPage=" + p;
			} else {
				l = l + "?cPage=" + p;
			}
			location.href = l;
		});

		window.onclick = function(event) {
			if (event.target == document.getElementById("qna-modal")) $("#qna-modal").css({"display":"none"});
		}
		
		$("#month").click();
	});

	function view_detail(r, c) {
		$("#qna-modal-content").empty();
		$.ajax({
			url : "qna_detail",
			data : {"r_idx" : r, "r_c_idx" : c},
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#qna-modal-content").append(data);
			},
			error : function(){
				alert("읽기 실패2");
			}
		});
		$("#qna-modal").css("display", "block");
	}

	function comp_qna(e) {
		location.href = "admin_complete?q_idx=" + e;
	}

	function com_del(e) {
		$.ajax({
			url : "recipe_comdelete",
			data : "r_c_idx=" + e,
			dataType : "text",
			type : "post",
			success : function(data) {
				if(data == 1) {
					alert("삭제 성공");
				} else {
					alert("삭제 실패");
				}
			},
			error : function(){
				alert("읽기 실패2");
			}
		});
	}
	
	function send_one(f){
		f.action = "admin_qna";
		f.submit();
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
			<form>
				<fieldset style="width: 1000px;">
					<legend>문의관리</legend>
					<div id="search-table">
						<div id="double">
							<div class="label">아이디/닉네임<br>회원번호</div>
							<div class="content">
								<select name="name_idx">
									<option value="id">아이디</option>
									<option value="name">닉네임</option>
									<option value="m_idx">회원번호</option>
								</select>
								<input type="text" name="name">
							</div>
							<div class="label">이메일</div>
							<div class="content">
								<input type="text" name="email">
							</div>
						</div>
						<div id="date">
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
							<input type="button" id="search" value="검  색" onclick="send_one(this.form)">
						</div>
					</div>
				</fieldset>
			</form>
			<div id="body">
				<div class="title">회원이름</div>
				<div class="title">아이디</div>
				<div class="title">이메일</div>
				<div class="title">문의 구분</div>
				<div class="title">문의 내용</div>
				<div class="title">등록 일시</div>
				<div class="title">처리 상태</div>
				<div class="title">처리</div>
				<c:choose>
					<c:when test="${!empty q_list}">
						<c:forEach items="${q_list}" var="k">
							<div class="body-content">${k.name}</div>
							<div class="body-content">${k.id}</div>
							<div class="body-content">${k.email}</div>
							<div class="body-content">${k.q_def}</div>
							<c:choose>
								<c:when test="${k.q_def eq '댓글신고'}">
									<c:set var="content" value="${k.content}"></c:set>
									<c:set var="inr" value="${fn:indexOf(content, '번')}"></c:set>
									<c:set var="rno" value="${fn:substring(content, 0, inr)}"></c:set>
									<c:set var="content" value="${fn:substring(content, inr + 6, fn:length(content))}"></c:set>
									<c:set var="inr" value="${fn:indexOf(content, '번')}"></c:set>
									<c:set var="rcno" value="${fn:substring(content, 0, inr)}"></c:set>
									<div class="body-content" onclick="view_detail(${rno}, ${rcno})">${k.content}</div>
								</c:when>
								<c:otherwise>
									<div class="body-content">${k.content}</div>
								</c:otherwise>
							</c:choose>
							
							<div class="body-content">${k.regdate}</div>
							<div class="body-content<c:choose><c:when test="${k.status eq '처리 대기중'}"> waiting</c:when><c:otherwise> comp</c:otherwise></c:choose>">${k.status}</div>
							<div class="body-content"><c:if test="${k.status eq '처리 대기중'}"><button onclick="comp_qna(${k.q_idx})">완료</button></c:if></div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div id="empty">표시할 내용이 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="qna-modal">
				<div id="qna-modal-content">
					
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin event</title>
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

#event-div{
	display: grid;
	grid-template-columns: 120px 880px;
}

.label{
	border: 1px solid #999;
	background: #ccc;
	padding: 10px 10px;
	font-weight: bolder;
	color: #2b686e;
}

.label:nth-last-child(2){
	border-width: 0px 1px 1px 1px;
}

.content{
	padding: 10px;
	border: solid #999;
	border-width: 1px 1px 1px 0px;
}

.content:last-child{
	border-width: 0px 1px 1px 0px;
}

#button input{
	width: 100%;
}

#main{
	margin-left: 20em;
	margin-top: 5em;
}

#body{
	width: 1002px;
	margin: 10px 5px;
}

.each-line{
	border: 1px solid #999;
	display: grid;
	grid-template-columns: 70px 100px 460px 140px 140px 90px;
	text-align: center;
}

#empty{
	width: 1002px;
	text-align: center;
	font-size: 12pt;
	padding: 10px;
	border: solid #999;
	border-width: 0px 1px 1px 1px;
}

.title:not(:last-child){
	border: solid #999;
	border-width: 0px 1px 0px 0px;
	font-size: 10pt;
	font-weight: bolder;
	padding: 5px;
	background: #ccc;
	color: #2b686e;
}

.title:last-child{
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

#head{
	font-size: 16pt;
	font-weight: bolder;
}

#foot{
	height: 40px;
}

#regbutton{
	float: right;
	padding: 5px 25px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 5px;
	background: #fa8;
	color: #333;
	font-weight: bolder;
	cursor: pointer;
}

#regbutton:hover{
	color: #eee;
	background: #f86;
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
	});

	function reg_event() {
		location.href="admin_reg_event";
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
				<li><a id="op" href="home">운영자 관리</a></li>
				<li><a id="setting" href="/">Main</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<a href="logout">로그아웃</a>
			</div>
		</header>
		<div id="main">
			<div id="head">이벤트관리</div>
			<div id="search-table">
				<div id="event-div">
					<div class="label">상태</div>
					<div class="content">
						<input type="radio" name="eventst" checked> 전체
						<input type="radio" name="eventst" value="1"> 진행중인 이벤트
						<input type="radio" name="eventst" value="0"> 종료된 이벤트
					</div>
					<div class="label">구분</div>
					<div class="content">
						<input type="radio" name="eventty" checked> 전체
						<input type="radio" name="eventty" value="1"> 이벤트 공지
						<input type="radio" name="eventty" value="2"> 당첨자 발표
					</div>
				</div>
			</div>
			<div id="body">
				<div class="each-line">
					<div class="title">NO</div>
					<div class="title">구분</div>
					<div class="title">이벤트 제목</div>
					<div class="title">이벤트 시작일</div>
					<div class="title">이벤트 종료일</div>
					<div class="title">상태</div>
				</div>
				<c:choose>
					<c:when test="${!empty q_list}">
						<c:forEach items="${q_list}" var="k">
							<div class="each-line">
								<div class="body-content">${k.name}</div>
								<div class="body-content">${k.id}</div>
								<div class="body-content">${k.email}</div>
								<div class="body-content">${k.q_def}</div>
								<div class="body-content">${k.regdate}</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div id="empty">표시할 내용이 없습니다.</div>
					</c:otherwise>
				</c:choose>
				<div id="foot">
					<div id="regbutton" onclick="reg_event()">신규 이벤트 등록</div>
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
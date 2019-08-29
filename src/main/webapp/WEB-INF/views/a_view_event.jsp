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

#logo {
	height: 50px;
	background-color: #333333;
	color: #1E90FE;
	text-align: center;
	line-height: 50px;
	font-size: 1.3em;
	font-family: arial;
	margin-left:0.5em;
}

#logo:hover{
	cursor: pointer;
	background-color: #151515;
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

#links>span {
	padding-top:1.0em;
	color: #fff;
	text-decoration: none;
	width: 100%;
	height: 100%;
	display: block;
	line-height: 1.1em;
}

#links:hover {
	cursor:pointer;
	background-color: #151515;
}

#links span:hover{
	color: #1E90FF;
}

#event-div{
	width: 990px;
	margin: 5px auto;
	border: 1px solid #999;
}

.double{
	display: grid;
	grid-template-columns: 150px 344px 150px 344px;
}

.regular{
	display: grid;
	grid-template-columns: 150px 838px;
}

.label{
	border: 1px solid #999;
	background: #ccc;
	padding: 10px 10px;
	font-weight: bolder;
	color: #2b686e;
}

.center{
	text-align: center;
}

.content{
	padding: 10px;
	border: solid #999;
	border-width: 1px 1px 1px 0px;
}

.detail{
	width: 970px;
	margin: 10px auto;
	border: 1px solid #999;
}

.detail-title{
	width: 950px;
	border: 1px solid #999;
	border-radius: 5px;
	background: #ccc;
	padding: 5px 10px;
	margin: 5px auto;
	font-weight: bolder;
	color: #2b686e;
}

.detail-box{
	width: 950px;
	margin: 5px auto;
}

.e_content{
	resize: none;
	margin: 10px auto;
	width: 98%;
	min-height: 200px;
	font-size: 12pt;
	padding: 5px;
	display: block;
	border: 0px;
}

#main{
	margin-left: 20em;
	margin-top: 5em;
}

#body{
	width: 1002px;
	margin: 10px 5px;
}

img.banner{
	width: 490px;
	height: 150px;
}

#foot{
	text-align: center;
}
#foot span{
	display: inline-block;
	width: 150px;
	padding: 5px;
	border: 1px solid #aaa;
	border-radius: 5px;
	margin: 0px 10px;
	cursor: pointer;
}

#editbutton{
	background: #af8;
}

#list{
	background: #f8a;
}

legend{
	font-size: 16pt;
	font-weight: bolder;
}

fieldset{
	margin: 5px;
	width: 1000px;
	border: 0px;
}

input[type=text], input[type=date]{
	width: 100%;
}

</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#list").on("click", function(){
			history.go(-1);
		});

		$("#editbutton").on("click", function(){
			location.href="#";
		});
	});

</script>
</head>
<body>
	<div id="container">
		<nav>
			<div id="logo" onclick="javascript:location.href='home'">
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
				<span href="logout">${mvo.name}님 안녕하세요! <br> 로그아웃</span>
			</div>
		</header>
		<div id="main">
			<form method="post" id="e_form">
				<fieldset>
					<legend>이벤트관리</legend>
					<div id="event-div">
						<div class="double">
							<div class="label">NO</div>
							<div class="content">${evo.e_idx}</div>
							<div class="label">등록자</div>
							<div class="content">${evo.name}</div>
						</div>
						<div class="regular">
							<div class="label">이벤트 제목</div>
							<div class="content">${evo.e_title}</div>
						</div>
						<div class="double">
							<div class="label">시작일</div>
							<div class="content">${evo.e_start}</div>
							<div class="label">종료일</div>
							<div class="content">${evo.e_end}</div>
						</div>
						<div class="regular">
							<div class="label">구분</div>
							<div class="content">
								<c:choose>
									<c:when test="${evo.e_type eq '1'}">이벤트 공지</c:when>
									<c:otherwise>당첨자 발표</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="regular">
							<div class="label">공개</div>
							<div class="content">
								<c:choose>
									<c:when test="${evo.e_public eq '1'}">공개</c:when>
									<c:otherwise>비공개</c:otherwise>
								</c:choose>
								<label class="switch"><input type="checkbox"></label>
							</div>
						</div>
						<div class="regular">
							<div class="label">메인 배너 이미지</div>
							<div class="content">
								<img class="banner" src="${evo.e_banner}">
							</div>
						</div>
						<div class="label center">상세내용</div>
						<div class="detail">
							<div class="detail-title">이벤트 상세보기</div>
							<div class="detail-box">
								<c:choose>
									<c:when test="${empty evo.e_content || evo.e_content==''}">
										<img src="${evo.e_image}">
									</c:when>
									<c:otherwise>
										<pre class="e_content">${evo.e_content}</pre>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</fieldset>
				<div id="body">
				<div id="foot">
					<span id="editbutton">수정</span><span id="list">목록으로</span>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
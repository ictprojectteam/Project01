<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
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

#actions-container{
	width: 80%;
	height: calc(100% -4em);
	background-color: #dadada;
}

#main{
	margin-left: 20em;
}
.title{
	width: 100%;
	height: 50px;
	display: block;
	text-align: left;
	line-height: 50px;
	margin-bottom: 1em;
	font-size: 1.0em;
	font-family: arial;
	font-weight: bold;
}

.row{
	display: flex;
	width: 100%;
	height: 30%;
	flex-wrap: nowrap;
	flex-direction: row;
	padding: 1em;
}

#user-action{
	margin-top: 5em;
}

#action{
	margin-top: 20em;
}

table, th, td {
	border: solid #000;
	border-collapse: collapse;
	color: #2b686e;
	text-align: center;
	font-size: 1.0em;
}

table{
	position: relative;
	width: 800px;
	height: 30px;
	background-color: #cccccc;
}
table th{
	border-spacing: 0;
}


</style>
</head>
<body>
	<div id="container">
		<nav>
			<div id="logo">
				ICT레시피 <span>ict recipe</span>
			</div>
			<ul id="menu">
				<li><a id="home" href="home">HOME</a></li>
				<li><a id="recipe" href="/">레시피 관리</a></li>
				<li><a id="content" href="/">게시물 등록</a></li>
				<li><a id="user" href="/">회원 관리</a></li>
				<li><a id="board" href="/">문의 관리</a></li>
				<li><a id="event" href="/">이벤트 관리</a></li>
				<li><a id="op" href="/">운영자 관리</a></li>
				<li><a id="setting" href="/">설정</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<a href="#">로그아웃</a>
			</div>
		</header>
		<main id="main">
			<div id="action-container">
				<div id="user-action">
					<div class="title">
						신규 회원
						<div id="body">
							<table>
								<thead>
									<tr>
										<th>회원번호</th>
										<th>회원이름</th>
										<!-- <th>연착처</th> -->
										<th>이메일</th>
										<!-- <th>닉네임</th> -->
										<th>성별</th>
										<th>가입 일시</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="5"><h3>원하는 정보가 존재하지 않습니다</h3></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="k" items="${list}">
												<tr>
													<td>${k.m_idx}</td>
													<td>${k.name}</td>
													<td>${k.email}</td>
													<td>${k.gender}</td>
													<td>${k.regdate}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div id="action">
				<div class="title">
						새로 등록된 레시피
						<div id="body">
							<table>
								<thead>
									<tr>
										<th>회원이름</th>
										<!-- <th>연착처</th> -->
										<th>이메일</th>
										<th>레시피 제목</th>
										<th>종류 구분</th>
										<th>고유 ID</th>
										<th>등록 일시</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<div id="action">
					<div class="title">
						신규 문의
						<div id="body">
							<table>
								<thead>
									<tr>
										<th>회원이름</th>
										<!-- <th>연착처</th> -->
										<th>이메일</th>
										<th>문의 구분</th>
										<th>문의 내용</th>
										<th>등록 일시</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
</html>
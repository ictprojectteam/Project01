<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	nav {
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
	position: relative;
	z-index: 3;
	width: 300px;
	height: 50px;
	background-color: #333333;
	color: #1E90FE;
	text-align: center;
	line-height: 50px;
	font-size: 1.3em;
	font-family: arial;
}

#logo:hover{
	cursor: pointer;
	background-color: #151515;
}

#logo span {
	font-size: 1em;
	font-family: monospace;
	font-style: italic;
	color: #f7f7f7;
}

#menu {
	width: 100%;
	background-color: #333333;
	min-height: 1500px;
}

#menu li {
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: #333333;
}

#menu li>a {
	font-size: 1.05em;
	font-family: arial;
	width: 100%;
	height: 100%;
	color: #f7f7f7;
	display: block;
	text-align: center;
	text-decoration: none;
}

#menu li:hover {
	background-color: #151515;
}

#menu li>a:hover {
	color: #1E90FF;
	border-left: 3px solid #1E90FF;
}

header {
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

header #links {
	float: right;
	height: 50px;
	display: block;
	color: #1E90FE;
	font-size: 1em;
	margin-right: 1em;
}

#links>a {
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

#links a:hover{
	color: #1E90FF;
}
</style>
</head>
<body>
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
			<a href="logout">${mvo.name}님 안녕하세요! <br> 로그아웃</a>
		</div>
	</header>
</body>
</html>
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
	line-height: 30px;
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
	border: 1px solid black;
	border-collapse: collapse;
	color: #2b686e;
	text-align: left;
	font-size: 1.0em;
	margin-top: 1em;
}

table{
	position: relative;
	width: 1000px;
}

table th{
	border-spacing: 0;
	text-align: center;
}

tabel td{
	font-size: 1.0em;
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
				<li><a id="recipe" href="a_recipe">레시피 관리</a></li>
				<li><a id="content" href="home">게시물 등록</a></li>
				<li><a id="user" href="home">회원 관리</a></li>
				<li><a id="board" href="home">문의 관리</a></li>
				<li><a id="event" href="home">이벤트 관리</a></li>
				<li><a id="op" href="home">운영자 관리</a></li>
				<li><a id="setting" href="home">설정</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<a href="#">로그아웃</a>
			</div>
		</header>
		<div id="main">
			<div id="action-container">
				<div id="user-action">
					<div>
						<form>
							<fieldset>
								<legend><h2>검색하기</h2></legend>
									<table>
										<thead>
											<tr>
												<th>회원이름/
												고유ID</th>						
												<td>
													<select name="name_idx">
														<option value="name">회원이름</option>
														<option value="idx_id">고유ID</option>
													</select>
													<input type="text" name="name" size="48">
												</td>
												<th>이메일/연락처</th>
												<td>
													<select name="email_number">
														<option value="email">이메일</option>
														<option value="number">연락처</option>
													</select>
														<input type="text" name="e_write" size= "48"> 
												</td>
											</tr>
											<tr>
												<th>레시피 제목</th>
												<td colspan="3"><input type="text" name="content" size="137"></td>
											</tr>
											<tr>
												<th>상태별</th>
												<td colspan="3">
													<input type="checkbox"  name="condition" size="50">전체								
													<input type="checkbox"  name="condition" size="50">승인대기
													<input type="checkbox"  name="condition" size="50">승인완료
												</td>
											</tr>
											<tr>
												<th>종류별</th>
												<td colspan="3">
													<input type="checkbox"  name="type" size="50">전체								
													<input type="checkbox"  name="type" size="50">일반레시피
													<input type="checkbox"  name="type" size="50">영상레시피
												</td>
											</tr>
											<tr>
												<th>등록일시</th>
												<td colspan="3">
													<input type="date" id="start" name="start" value="sysdate" min="2019-01-01" max="2019-12-31">
													<a>~</a>
													<input type="date" id="end" name="endt" value="sysdate" min="2019-01-01" max="2019-12-31">
													<input type="button" id="today" value="오늘">
													<input type="button" id="yesterday" value="어제">
													<input type="button" id="week" value="7일">
													<input type="button" id="month" value="1개월">
													<input type="button" id="3month" value="3개월">
													
												</td>
											</tr>
										</thead>
									</table>
							</fieldset>
						</form>
						<div class="title">
						레시피 관리
						<div id="body">
							<table>
								<thead>
									<tr bgcolor="#cccccc">
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
			</div>
		</div>
	</div>
	</div>
</body>
</html>
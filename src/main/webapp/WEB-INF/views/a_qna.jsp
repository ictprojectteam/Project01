<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	background: #bbb;
	padding: 5px 10px;
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
	border: 0.5px solid #999;
}

#button input{
	width: 100%;
}

#main{
	margin-left: 20em;
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

#body{
	border: 1px solid red;
	width: 1000px;
	margin: 10px 5px;
	display: grid;
	grid-template-columns: 90px 120px 150px 90px 280px 150px 120px;
	text-align: center;
}

.title{
	border: 0.5px solid #999;
	font-size: 10pt;
	font-weight: bolder;
	padding: 5px;
}

legend{
	font-size: 16pt;
	font-weight: bolder;
}


/* paging */
.pageing{
	margin: 0 auto;
	text-align: center;
}

.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	display: block;
	padding: 3px 7px;
	color: #2f313e;
	font-weight: bold;
}

.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
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
	});
	function send_one(f){
		
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
				<li><a id="user" href="membership">회원 관리</a></li>
				<li><a id="board" href="admin_qna">문의 관리</a></li>
				<li><a id="event" href="home">이벤트 관리</a></li>
				<li><a id="op" href="home">운영자 관리</a></li>
				<li><a id="setting" href="home">설정</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<a href="m">로그아웃</a>
			</div>
		</header>
		<div id="main">
			<div id="user-action">
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
								<div class="label">이메일/연락처</div>
								<div class="content">
									<select name="email_number">
										<option value="email">이메일</option>
										<option value="number">연락처</option>
									</select>
									<input type="text" name="e_write">
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
					<div class="title">연락처</div>
					<div class="title">이메일</div>
					<div class="title">문의 구분</div>
					<div class="title">문의 내용</div>
					<div class="title">등록 일시</div>
					<div class="title">답변 상태</div>
					
					<table>
						<!-- 페이지기법 -->
						<tfoot>
							<div class="pageing">
							<ol class="paging">
							   <%-- 이전 --%>
							    <c:choose>
							    	<c:when test="${pageing.beginBlock <= pageing.pagePerBlock }">
							    		<li class="disable"> 이전으로 </li>
							    	</c:when>
							    	<c:otherwise>
							    		<li><a href="membership.do?cPage=${pageing.beginBlock-pageing.pagePerBlock}"> 이전으로 </a></li>
							    	</c:otherwise>
							    </c:choose>
							    
								<c:forEach begin="${pageing.beginBlock}" end="${pageing.endBlock}" step="1" var="k">
									<c:if test="${k==pageing.nowPage}">
										<li class="now">${k}</li>
									</c:if>
									<c:if test="${k!=pageing.nowPage}">
										<li><a href="membership.do?cPage=${k}">${k}</a></li>
									</c:if>
								</c:forEach>
								
								<c:choose>
							    	<c:when test="${pageing.endBlock >= pageing.totalPage }">
							    		<li class="disable"> 다음으로 </li>
							    	</c:when>
							    	<c:otherwise>
							    		<li><a href="membership.do?cPage=${pageing.beginBlock+pageing.pagePerBlock}"> 다음으로 </a></li>
							    	</c:otherwise>
							    </c:choose>
							</ol>
							</div>
						</tfoot>
					</table>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>
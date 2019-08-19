<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
	#view-recipe{
		width: 1200px;
		margin: 30px auto 0px;
	}
	#view-recipe-head{
		width: 750px;
		margin: auto;
		text-align: center;
	}
	#main-image{
		width: 720px;
		margin: auto;
	}
	#main-image img{
		width: 720px;
		height: 480px;
		margin: auto;
	}
	#writer{
		display: inline-block;
		margin: 20px auto;
		color: #777;
	}
	#title{
		font-size: 25pt;
		line-height: 0pt;
		color: #555;
	}
	#introduce{
		width: 500px;
		font-size: 12pt;
		line-height: 20pt;
		text-align: left;
		margin: 50px auto;
		color: #888;
	}
	#information{
		margin: 20px auto;
		width: 600px;
		display: grid;
		grid-template-columns: 200px 200px 200px;
	}
	#information i{
		font-size: 25pt;
		color: #ccc;
	}
	#information p{
		line-height: 0pt;
		color: #ccc;
	}
	#material{
		width: 850px;
		margin: auto;
		line-height: 6pt;
		color: #555;
		font-size: 13pt;
	}
	#video{
		width: 900px;
		margin: 30px auto;
	}
	#video-label{
		font-size: 16pt;
		color: #555;
		margin-top: 80px;
	}
	#play-video {
		width: 700px;
		margin: auto;
	}
	#order{
		width: 900px;
		margin: 80px auto 0px auto;
		color: #333;
	}
	.order-content{
		width: 900px;
		display: grid;
		grid-template-columns: 100px 465px 335px;
		margin-bottom: 50px;
	}
	.order-number{
		text-align: right;
	}
	.order-number p{
		width: 30px;
		padding: 10px;
		border-radius: 30px;
		background: #fa8;
		color: #eee;
		text-align: center;
		font-size: 16pt;
		margin: 0px 0px 0px 30px;
	}
	.order-text{
		font-size: 16pt;
		color: #555;
		line-height: 10pt;
	}
	.order-text pre{
		margin-top: 10px;
	}
	.order-img{
		height: 220px;
	}
	.order-img img{
		width: 335px;
		height: 220px;
		border-radius: 15px;
	}
	#comp{
		width: 720px;
		display: grid;
		grid-template-columns: 90px 540px 90px;
		margin: auto;
	}
	#comp-image-wrap{
		overflow: hidden;
		position: relative;
		width: 720px;
		margin: auto;
		left: -90px;
		z-index: -1;
	}
	#comp-image-pack{
		width: 1000%;
	}
	.comp-image{
		display: inline-block;
		width: 720px;
		height: 480px;
		margin: 0px;
		padding: 0px;
	}
	.comp-image img{
		width: 720px;
		height: 480px;
		margin: 0px;
	}
	#comp-left, #comp-right{
		padding-top: 210px;
		text-align: center;
		font-size: 30pt;
		color: #aaa;
		opacity: 0.5;
		cursor: pointer;
	}
	#comp-left:hover, #comp-right:hover{
		opacity: 0.7;
	}
	#tip{
		width: 800px;
		margin: auto;
	}
	#tip-label{
		background: #f53;
		color: #eee;
		font-style: italic;
		font-size: 20pt;
		padding: 10px;
		display: inline-block;
		width: 220px;
	}
	#tip pre{
		width: 750px;
		margin: 20px auto;
		font-size: 16pt;
	}
	#tag{
		width: 720px;
		margin: 50px auto 10px auto;
	}
	#tag-label{
		background: #f85;
		color: #eee;
		font-size: 12pt;
		border-radius: 15px;
		padding: 5px;
		display: inline-block;
	}
	.tag{
		font-size: 12pt;
		margin-left: 15px;
		cursor: pointer;
		color: #f85;
	}
	#dateinfo{
		width: 720px;
		margin: 30px auto;
		border: 1px dashed #ccc;
		padding: 15px;
		color: #aaa;
		font-size: 9pt;
	}
	#datebar{
		margin-left: 10px;
		margin-right: 20px;
	}
	#warning{
		margin-left: 40px;
	}
	.fa-ban{
		font-size: 13pt;
	}
	#comment{
		width: 900px;
		margin: auto;
	}
	#com-label{
		margin-top: 40px;
	}
	#com-count{
		margin-left: 10px;
		color: #fa8;
	}
	#comlist{
		display: grid;
		grid-template-columns: 80px 820px;
	}
	#comform{
		display: flex;
	}
	#comtext{
		resize: none;
		width: 90%;
		height: 120px;
		font-size: 13pt;
		padding: 5px;
		border: 1px #ccc;
		border-style: solid none solid solid;
		border-radius: 5px 0px 0px 5px;
		display: inline-block;
		z-index: 0;
	}
	#comtext:focus{
		box-shadow: 0px 0px 4px 1px #7af;
		z-index:1;
	}
	#combutton{
		width: 10%;
		height: 20px;
		text-align: center;
		padding: 55px 20px;
		font-size: 13pt;
		color: #555;
		margin: auto;
		cursor: pointer;
		border: 1px solid #ccc;
		border-radius: 0px 5px 5px 0px;
		z-index:0;
	}
	#combutton:active{
		box-shadow: 0px 0px 4px 2px #7af;
		z-index:1;
	}
	.com-pro{
		height: 80px;
	}
	.com-content{
		margin-left: 10px;
	}
	.com-writer{
		font-size: 16pt;
		color: #c97;
	}
	.com-date, .com-del{
		margin-left: 10px;
		color: #aaa;
	}
	.com-del{
		cursor: pointer;
	}
	.com-text{
		font-size: 12pt;
		color: #555;
	}
	.infobar{
		margin-left: 10px;
		color: #ccc;
	}
}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
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
	padding-top: 30px;
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
	line-height: 25px;
}

table{
	position: relative;
	width: 1000px;
	margin-left: 1.0em;
	margin-right: 1.0em;
	margin-bottom: 1.0em;
}

th{
	text-align: center;
	background-color: #cccccc;
}

td{
	font-size: 1.0em;
}

#body td{
	text-align: center;
}

textarea{
    margin: 0px;
    width: 993px;
    height: 400px;
    resize: none;
}

input{
	width: 100%;
	border: 0
}

.td input:focus, .td textarea:focus{
	outline: none;
}

#back-button{
	width: 300px;
	margin: 5px auto;
	display: grid;
	grid-template-columns: 150px 150px;
}

#back-button div{
	cursor: pointer;
}

#back{
	border: 2px solid #660033;
	margin: 5px 20px;
	text-align: center;
	padding: 5px;
	border-radius: 5px;
}

</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#back").on("click", function(){
			history.go(-1);
		});
	});
		
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
		<main id="main">
		<div id="action-container">
			<div id="user-action">
				<div class="title">
					회원 관리
					<div id="body">
						<table>
							<thead>
								<tr>
									<th>회원번호</th>
									<td>${mvo.m_idx}</td>
								</tr>
								<tr>
									<th>회원이름</th>
										<td>${mvo.name}</td>
								</tr>
								<tr>		
									<th>이메일</th>
										<td>${mvo.email}</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td><input type="text"></td>
								</tr>
								
								<tr>
									<th>성별</th>
										<td>${mvo.gender}</td>
								</tr>
								<tr>	
									<th>가입일시</th>
										<td>${mvo.regdate}</td>
								</tr>
							</thead>
						</table>
						<div id="back-button">
							<div id="back">뒤로가기</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	
	
</body>
</html>
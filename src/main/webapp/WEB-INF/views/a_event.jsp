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
	border: solid #999;
	border-width: 1px 0px 0px 0px;
	display: grid;
	grid-template-columns: 70px 100px 460px 140px 140px 92px;
	text-align: center;
}

.each-line:last-child{
	border: solid #999;
	border-width: 1px 0px 1px 0px;
}

.each-line:hover{
	background: #ddd;
	cursor: pointer;
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
	border-width: 0px 0px 0px 1px;
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
	border: solid #999;
	border-width: 0px 1px 0px 1px;
}
.body-content{
	padding: 5px;
	border: solid #bbb;
	border-width: 0px 0px 0px 1px;
	overflow: hidden;
}

.body-content:last-child{
	border: solid #bbb;
	border-width: 0px 1px 0px 1px;
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

.now{
	margin-right: 8px;
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}

.page{
	padding: 3px 7px;
	color: #2f313e;
	font-weight: bold;
}

.page:hover{
	background: #00B3DC;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

.disable {
	padding: 3px 7px;
	color: silver;
}

</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var evo = {};
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

		$("input[name=eventst]").on("change", function(){
			evo.open = $(this).val();
			evo.cPage = '1';
			load_list();
		});

		$("input[name=eventty]").on("change", function(){
			evo.e_type = $(this).val();
			evo.cPage = '1';
			load_list();
		});
		
		load_list();
	});

	function load_list() {
		$.ajax({
			url : "load_event_list",
			data : evo,
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#body-content").empty();
				$("#body-content").append(data);
			},
			error : function(){
				alert("읽기 실패");
			}
		});
		load_page();
	}

	function load_page() {
		$.ajax({
			url : "load_event_page",
			data : evo,
			dataType : "text",
			type : "post",
			success : function(data) {
				$(".paging").empty();
				$(".paging").append(data);
			},
			error : function(){
				alert("읽기 실패");
			}
		});
		$(".page").on("click", function(){
			evo.cPage=$(this).text();
			load_list();
		});
	};
	
	function view(e) {
		
	}

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
						<input type="radio" name="eventst" value="" checked> 전체
						<input type="radio" name="eventst" value="1"> 진행중인 이벤트
						<input type="radio" name="eventst" value="0"> 종료된 이벤트
					</div>
					<div class="label">구분</div>
					<div class="content">
						<input type="radio" name="eventty" value="" checked> 전체
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
				<div id="body-content">
				
				</div>
				<div id="foot">
					<div id="regbutton" onclick="reg_event()">신규 이벤트 등록</div>
				</div>
			</div>
			<div class="paging">
				
			</div>
		</div>
	</div>
</body>
</html>
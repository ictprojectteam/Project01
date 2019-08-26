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

.detail-box span{
	display: inline-block;
	width: 130px;
	padding: 5px;
	border: 1px solid #999;
	border-radius: 5px;
	margin: 5px;
	text-align: center;
	background: #ccc;
	cursor: pointer;
}

.detail-box span:hover{
	background: #fff;
	color: #fa8;
}

textarea[name=e_content]{
	resize: none;
	margin: 10px auto;
	width: 98%;
	height: 200px;
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

#main_file{
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #777;
	border-radius: 5px 10px;
	cursor: pointer;
	background: #ccc;
}

#file_name{
	padding: 5px 10px;
	display: inline-block;
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

#regbutton{
	background: #af8;
}

#cancel{
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

		$("#main_file").on("click", function(){
			$("#e_file").click();
		});

		$("#e_file").on("change", function(){
			$("#file_name").empty();
			var tg = $("#e_file");
			var name = tg.val();
			if(name != ""){
				var index = name.lastIndexOf("\\");
				name = name.substring(index + 1, name.length);
				$("#file_name").text(name);
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function(e){
					var readFile = e.target.result;
					var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
					readFile = readFile.substring(0, readFile.indexOf('/'));
					if(readFile === "data:image" && chkcor != "77u/"){
						$("input[name=e_banner]").val(e.target.result);
					} else {
						$("input[name=e_banner]").val("");
					}
				}
			} else {
				$("#file_name").text("선택된 파일이 없습니다.");
				$("input[name=e_banner]").val("");
			}
		});
		
		$(".detail-box span:nth-child(1)").on("click", function(){
			$(".detail-content").empty();
			$(".detail-content").append("<textarea name='e_content'></textarea>");
			$("textarea[name=e_content]").focus();
		});
		
		$(".detail-box span:nth-child(2)").on("click", function(){
			$("#e_image").click();
		});

		$("#e_image").on("change", function(){
			if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function(e){
					var readFile = e.target.result;
					var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
					readFile = readFile.substring(0, readFile.indexOf('/'));
					if(readFile === "data:image" && chkcor != "77u/"){
						$(".detail-content").empty();
						$(".detail-content").append("<img src=" + e.target.result + ">");
						$(".detail-content").append("<input type='text' hidden='' name='e_image' value=" + e.target.result + ">");
					}
				}
			}
		});

		$("#cancel").on("click", function(){
			history.go(-1);
		});
	});

	function reg_event() {
		$("#e_form").attr("action", "a_reg_event").submit();
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
			<form method="post" id="e_form">
				<fieldset>
					<legend>이벤트관리</legend>
					<div id="event-div">
						<div class="regular">
							<div class="label">이벤트 제목</div>
							<div class="content"><input type="text" name="e_title"></div>
						</div>
						<div class="double">
							<div class="label">시작일</div>
							<div class="content"><input type="datetime-local" name="e_start"></div>
							<div class="label">종료일</div>
							<div class="content"><input type="datetime-local" name="e_end"></div>
						</div>
						<div class="regular">
							<div class="label">구분</div>
							<div class="content">
								<input type="radio" name="e_type" value="1"> 이벤트 공지
								<input type="radio" name="e_type" value="2"> 당첨자 발표
							</div>
						</div>
						<div class="regular">
							<div class="label">공개</div>
							<div class="content">
								<input type="radio" name="e_public" value="1"> 공개
								<input type="radio" name="e_public" value="0"> 비공개
							</div>
						</div>
						<div class="regular">
							<div class="label">메인 배너 이미지</div>
							<div class="content">
								<span id="main_file">파일 선택</span><span id="file_name">선택된 파일이 없습니다.</span>
								<input type="file" id="e_file" hidden="" accept="image/*">
								<input type="text" name="e_banner" hidden="">
							</div>
						</div>
						<div class="label center">상세내용</div>
						<div class="detail">
							<div class="detail-title">이벤트 상세보기</div>
							<div class="detail-box">
								<span>텍스트</span><span>이미지 삽입</span>
								<div class="detail-content"></div>
							</div>
							<input type="file" hidden="" id="e_image" accept="image/*">
						</div>
					</div>
				</fieldset>
				<div id="body">
				<div id="foot">
					<span id="regbutton" onclick="reg_event()">이벤트 등록</span><span id="cancel">취소</span>
				</div>
			</div>
			</form>
			
		</div>
	</div>
</body>
</html>
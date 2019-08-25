<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Head - Logo, Search, Navigation</title>
<style type="text/css">
	#head{
		width: 100vw;
		height: 150px;
		margin: -8px;
		overflow: visible;
		position: static;
	}
	#logo-image{
		width: 100%;
		height: 100px;
	}
	#top-logo-bar{
		width: 1000px;
		height: 100px;
		display: grid;
		grid-template-columns: 300px 500px 300px;
		grid-gap: 10px;
		margin: auto;
	}
	#recipe-search{
		display: grid;
		grid-template-columns: 400px 40px;
		align-content: center;
	}
	#search-bar{
		font-size: 15pt;
		width: 99%;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		text-indent: 8pt;
	}
	#top-icon{
		display: grid;
		grid-template-columns: 60px 60px;
		align-content: center;
	}
	#search-button{
		display: inline-block;
		padding: 4px 7px;
		border-radius: 0px 5px 5px 0px;
		background: #fa8;
		cursor: pointer;
		border: 1px solid #fa8;
		font-size: 15pt;
		color: #55c;
	}
	#search-button:hover{
		box-shadow: 0px 0px 3px 0.5px #fb9;
	}
	#search-button:active{
		background: #f98;
		color: #44b;
	}
	.fa-user-circle{
		font-size: 35pt;
		color: #bbb;
	}
	#top-pencil-icon{
		background: #fa8;
		border-radius: 30px;
		width: 30px;
		padding: 10px;
		cursor: pointer;
		box-sizing: content-box;
	}
	.fa-pencil-alt{
		font-size: 20pt;
		color: #eee;
		border-radius: 15px;
	}
	#profile-dropdown{
		z-index: 1;
		width: 120px;
		position: absolute;
		margin-top: 80px;
		margin-left: -50px;
		line-height: 40pt;
		border: 2px solid #fa8;
		box-shadow: 0px 0px 3px 1px #e97;
		background: #eee;
		text-align: center;
		padding: 0px 10px;
		visibility: hidden;
	}
	.profile-dropdown-menu:link, .profile-dropdown-menu:visited{
		display: block;
		text-decoration: none;
		color: #333;
	}
	#top-nav{
		background: #fa8;
		width: 100vw;
		min-width: 1320px;
		height: 50px;
		position: relative;
	}
	#top-nav-menu-bar{
		margin: auto;
		width: 1200px;
		display: grid;
		grid-template-columns: auto auto auto auto auto auto auto;
	}
	.top-nav-menu{
		padding-top: 10px;
		height: 40px;
		text-align: center;
		color: #eee;
		text-decoration: none;
	}
	.top-nav-menu:hover{
		background:#fda;
		color: #777;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript">
	$(function(){
		$("#profile-dropdown").fadeOut();
		$(".fa-user-circle").click(function(){
			if($("#loginchk").val() == null || $("#loginchk").val() == ""){
				var k = confirm("로그인이 필요한 페이지입니다.\n\n로그인 하시겠습니까?\n");
				if(k) location.href='login';
			} else {
				$("#profile-dropdown").css("visibility", "visible");
				$("#profile-dropdown").fadeToggle("fast");
			}
		});
		$(window).click(function(e){
			if(e.target.getAttribute("class") != "fas fa-user-circle"){
				$("#profile-dropdown").fadeOut("fast");
			}
		});
		$("#top-pencil-icon").on("click",function(){
			if($("#loginchk").val() == null || $("#loginchk").val() == ""){
				var k = confirm("로그인이 필요한 페이지입니다.\n\n로그인 하시겠습니까?\n");
				if(k) location.href='login';
			} else {
				location.href="write_recipe";
			}
		});
		$("#search-button").on("click", function(){
			if($("#search-bar").val() == "") {
				location.href="recipe"
			} else {
				location.href="recipe?k=" + $("#search-bar").val();
			}
		});
		$("#top-myhome").on("click", function(){
			if($("#loginchk").val() == null || $("#loginchk").val() == ""){
				var k = confirm("로그인이 필요한 페이지입니다.\n\n로그인 하시겠습니까?\n");
				if(k) location.href='login';
			}else {
				location.href="myRecipe";
			}
		});
	});
</script>
</head>
<body>
	<input type="hidden" id="loginchk" value="${mvo.id}">
	<div id="head">
		<div id="top-logo-bar">
			<div id="top-logo">
				<!-- 로고 이미지 -->
				<a href="/"><img src="resources/images/coffee.png" id="logo-image"></a>
			</div>
			<form id="recipe-search" action="recipe">
				<div><input type="text" name="k" id="search-bar"></div>
				<!-- <a id="search-button"><i class="fas fa-search"></i></a> -->
				<i id="search-button" class="fas fa-search"></i>
			</form>
			<div id="top-icon">
				<a id="user-circle" href="#"><i class="fas fa-user-circle"></i></a>
				<a id="top-pencil-icon"><i class="fas fa-pencil-alt"></i></a>
				<div id="profile-dropdown">
					<a class="profile-dropdown-menu" href="myRecipe">MY홈</a>
					<a class="profile-dropdown-menu" href="myRecipe">레시피 노트</a>
					<a class="profile-dropdown-menu" href="myReport">문의내역</a>
					<a class="profile-dropdown-menu" href="check_login">회원정보수정</a>
					<a class="profile-dropdown-menu" href="logout">로그아웃</a>
				</div>
			</div>
		</div>
		<div id="top-nav">
			<div id="top-nav-menu-bar">
				<a class="top-nav-menu" href="/">홈</a>
				<a class="top-nav-menu" href="recipe">레시피</a>
				<a class="top-nav-menu" href="video">조리영상</a>
				<a class="top-nav-menu" href="/talk">토크</a>
				<a class="top-nav-menu" href="ranking">랭킹</a>
				<a class="top-nav-menu" href="/event">이벤트</a>
				<a class="top-nav-menu" id="top-myhome">MY홈</a>
			</div>
		</div>
	</div>
</body>
</html>
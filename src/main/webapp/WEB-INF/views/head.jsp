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
	/* 검색 텍스트 */
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
	/* 검색 버튼 */
	#search-button{
		display: inline-block;
		padding: 5px 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		background: #fa8;
	}
	/* 검색 버튼 이미지 색 */
	.fa-search{
		font-size: 15pt;
		color: #55c;
	}
	/* 프로필 아이콘 */
	.fa-user-circle{
		font-size: 35pt;
		color: #bbb;
	}
	/* 글쓰기 버튼 */
	#top-pencil-icon{
		background: #fa8;
		border-radius: 30px;
		width: 30px;
		padding: 10px;
		cursor: pointer;
	}
	/* 글쓰기 아이콘 */
	.fa-pencil-alt{
		font-size: 20pt;
		color: #eee;
		border-radius: 15px;
	}
	#profile-dropdown{
		z-index: 1;
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
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#profile-dropdown").fadeOut();
		$(".fa-user-circle").click(function(){
			if($("#loginchk").val() == null || $("#loginchk").val() == ""){
				location.href="login";
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
			<form id="recipe-search">
				<div><input type="text" name="search" id="search-bar"></div>
				<a href="javascript:recipe_search(this.form)" id="search-button"><i class="fas fa-search"></i></a>
			</form>
			<div id="top-icon">
				<a id="user-circle" href="#"><i class="fas fa-user-circle"></i></a>
				<a id="top-pencil-icon"><i class="fas fa-pencil-alt"></i></a>
				<div id="profile-dropdown">
					<a class="profile-dropdown-menu" href="myhome">MY홈</a>
					<a class="profile-dropdown-menu" href="myscrap">스크랩한 레시피</a>
					<a class="profile-dropdown-menu" href="myrecipe">레시피 노트</a>
					<a class="profile-dropdown-menu" href="myreport">문의내역</a>
					<a class="profile-dropdown-menu" href="editprofile">회원정보수정</a>
					<a class="profile-dropdown-menu" href="logout">로그아웃</a>
				</div>
			</div>
		</div>
		<div id="top-nav">
			<div id="top-nav-menu-bar">
				<a class="top-nav-menu" href="/">홈</a>
				<a class="top-nav-menu" href="recipe">레시피</a>
				<a class="top-nav-menu" href="video">조리영상</a>
				<a class="top-nav-menu" href="talk">토크</a>
				<a class="top-nav-menu" href="ranking">랭킹</a>
				<a class="top-nav-menu" href="event">이벤트</a>
				<a class="top-nav-menu" href="myhome">MY홈</a>
			</div>
		</div>
	</div>
</body>
</html>
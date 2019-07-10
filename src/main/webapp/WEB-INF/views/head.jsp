<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Head - Logo, Search, Navigation</title>

</head>
<body>
	<div id="head">
		<div id="top-logo-bar">
			<div id="top-logo">
				<!-- 로고 이미지 -->
				<a href="javascript:location.href='/'"><img src="resources/images/coffee.png" id="logo-image"></a>
			</div>
			<form id="recipe-search">
				<div><input type="text" name="search" id="search-bar"></div>
				<a href="javascript:recipe_search(this.form)" id="search-button"><i class="fas fa-search"></i></a>
			</form>
			<div id="top-icon">
				<a href="#"><i class="fas fa-user-circle"></i></a>
				<a href="javascript:void(0)" onclick="write_popup()" id="top-pencil-icon"><i class="fas fa-pencil-alt"></i></a>
				<div id="profile-dropdown">
					<a class="profile-dropdown-menu" href="#">MY홈</a>
					<a class="profile-dropdown-menu" href="#">스크랩한 레시피</a>
					<a class="profile-dropdown-menu" href="#">레시피 노트</a>
					<a class="profile-dropdown-menu" href="#">문의내역</a>
					<a class="profile-dropdown-menu" href="#">회원정보수정</a>
					<a class="profile-dropdown-menu" href="#">로그아웃</a>
				</div>
			</div>
		</div>
		<div id="top-nav">
			<div id="top-nav-menu-bar">
				<a class="top-nav-menu" href="javascript:location.href='/'">홈</a>
				<a class="top-nav-menu" href="javascript:location.href='/'">레시피</a>
				<a class="top-nav-menu" href="javascript:location.href='/'">토크</a>
				<a class="top-nav-menu" href="javascript:location.href='/'">랭킹</a>
				<a class="top-nav-menu" href="javascript:location.href='/'">이벤트</a>
				<a class="top-nav-menu" href="javascript:location.href='/'">MY홈</a>
			</div>
		</div>
	</div>
</body>
</html>
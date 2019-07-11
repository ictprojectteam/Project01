<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Head - Logo, Search, Navigation</title>

</head>
<body>
	<input type="hidden" id="loginchk" value="${mvo.id}">
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
				<a id="user-circle" href="#"><i class="fas fa-user-circle"></i></a>
				<a href="chk_write" onclick="write_popup()" id="top-pencil-icon"><i class="fas fa-pencil-alt"></i></a>
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
				<a class="top-nav-menu" href="javascript:location.href='/'">홈</a>
				<a class="top-nav-menu" href="javascript:location.href='recipe'">레시피</a>
				<a class="top-nav-menu" href="javascript:location.href='video'">조리영상</a>
				<a class="top-nav-menu" href="javascript:location.href='talk'">토크</a>
				<a class="top-nav-menu" href="javascript:location.href='ranking'">랭킹</a>
				<a class="top-nav-menu" href="javascript:location.href='event'">이벤트</a>
				<a class="top-nav-menu" href="javascript:location.href='myhome'">MY홈</a>
			</div>
		</div>
	</div>
</body>
</html>
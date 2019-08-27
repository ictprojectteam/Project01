<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<jsp:include page="head.jsp" />
<style type="text/css">
	#menu{
		width: 1000px;
		margin: 20px auto;
	}
	.menu_bt{
		border: 1px solid #808080;
		width: 151px;
		height: 45px;
		font-size: 12pt;
		background-color: #D9D9D9;
		margin: 0px 5px;
		cursor: pointer;
	}
	.menu_bt:hover{
		background-color: #eeeeee;
	}
	.body {
	text-align: center;
	}
	#bar {
		margin-bottom: 10pt;
		width: 350pt;
		height: 30pt;
	}
	#notice{
		margin-top: 0px;
		margin-right: 135px;
		font-size: 10pt;
		color: #888;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".menu_bt").on("click", function(){
			$(".menu_bt:button").css("background-color", "#D9D9D9");
			$(this).css("background-color", "#92895A");
		});
	});
	function go(e) {
		location.href = e;
	}
	function goCheck(f){
		f.action = "updateprofile";
		f.submit();
	}
</script>
</head>
<body>
	<div id="menu">
		<input class="menu_bt" type="button" value="레시피" onclick="go('myRecipe')">
		<input class="menu_bt" type="button" value="요리후기" onclick="go('myReview')">
		<input class="menu_bt" type="button" value="댓글" onclick="go('myComent')">
		<input class="menu_bt" type="button" value="토크" onclick="go('myTalk')">
		<input class="menu_bt" type="button" value="문의" onclick="go('myReport')">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="go('myPrf_update')" style="background-color: #92895A;">
	</div>
	<div class="body">
		<form method="post">
			<h2>비밀번호 확인</h2>
			<p id="inpo">
				<input type="text" placeholder="아이디" name="id" value="${mvo.id}" readonly style="width: 460px; height: 30px;">
			</p>
			<p id="inpo">
				<input type="password" placeholder="패스워드" name="pw" style="width: 460px; height: 30px;">
			</p>
			<button id=bar style="background-color: #997000; color: white; font-size: 15pt;" onclick="goCheck(this.form)">확 인</button>
		</form>
		<br>
		<p id="notice">안전한 사용을 위해 비밀번호를 한 번 더 입력해 주세요.</p>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
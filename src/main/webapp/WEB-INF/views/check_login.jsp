<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checklogin</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
.top {
	background-color: #fa8;
	text-align: center;
	color: white;
	cursor: pointer;
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
		$(".top").on("click", function(){
			location.href="/";
		});
	});
	function goCheck(f){
		f.action = "updateprofile";
		f.submit();
	}
</script>
</head>
<body>
	<div class="top">
		<h1>ICT 레시피</h1>
		<h2>ICT RECIPE</h2>
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
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
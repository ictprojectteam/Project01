<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
.top {
	background-color: #fa8;
	text-align: center;
	color: white;
	cursor: pointer;
}

.body{
	width: 500px;
	margin: auto;
}
.body>p:first-child{
	text-align: center;
}
#updEmail{
	border-radius: 5px;
	border: 1px solid #888;
	background: #eee;
	width: 120px;
	height: 30px;
	float: right;
}
#email-input{
	display: none;
	clear: both;
	margin-top: 20px;
}
#email{
	margin: auto;
	display: block;
	width: 300px;
	height: 30px;
	font-size: 12pt;
}
#subEmail{
	text-align: center;
	margin: 10px auto;
	border: 1px solid #e97;
	background: #fa8;
	width: 80px;
	height: 35px;
	border-radius: 5px;
	color: #eee;
	display: block;
	font-size: 12pt;
}
#subEmail:hover{
	background: #e97;
}
#subEmail:active{
	box-shadow: 0px 0px 0px 1px #c75;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".top").on("click", function(){
			location.href="/";
		});
		$("#updEmail").on("click",function(){
			$("#email-input").css("display", "block");
		});
	});
</script>
</head>
<body>
	<div class="top">
		<h1>ICT 레시피</h1>
		<h2>ICT RECIPE</h2>
	</div>
	<div class="body">
		<p style="font-size: 35px;">회원정보 수정</p>
		<div>
			<span draggable="false">${mvo.email}</span>
			<button id="updEmail">이메일 수정</button>
			<div id="email-input">
				<input type="text" id="email" placeholder="이메일">
				<button id="subEmail">변경</button>
			</div>
		</div>
		<p>
			<input id=pw2 type="password" placeholder="비밀번호 확인" name="pw_ok">
		</p>
		<p>
			<input class=inpo_box type="text" placeholder="닉네임" name="name" id="name">
		</p>
	</div>
</body>
</html>

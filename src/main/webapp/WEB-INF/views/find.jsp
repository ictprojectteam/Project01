<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pw찾기</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
	.top {
	background-color: #fa8;
	width: 100vw;
	height: 100px;
	color: white;
	cursor: pointer;
	border: solid;
	margin-top: -12px;
	margin-left: -12px;
	}
	#top_title{
		width: 100%;
		margin: 10px auto;
		text-align: center;
	}
	.b1 input{
		width: 20%;
		display: block;
		margin: 0 auto;
	}
	.b3{
		font-size: 10pt;
		text-align: center;
		color: #fa8;
	}
	
</style>
</head>
<body>
	<script type="text/javascript">
		$(function(){
			$(".top").on("click", function(){
				location.href="/";
			});
		});
		function send_go(f){
			f.action = "send_mail";
			f.submit();
		}
	</script>
	<div class="top">
		<h1 id="top_title"> ICT 레시피 </h1>
		<h2 id="top_title"> ICT RECIPE </h2>
	</div>
	
	<div id="body">
		<form>
			<h1 style="text-align: center;">비밀번호 찾기</h1>
			<div class="b1">
				<input type="text" placeholder="이메일" name="email"><br>
				<input type="button" value="안내 메일 발송" onclick="send_go(this.form)">
			</div>
			<p class="b3">*비밀번호 재설정 안내를 회원 가입시 입력했던 메일로 발송합니다.</p>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">
	.top{
		background-color: #FFC19E;
		text-align: center;
		color: white;
	}
	.body{
		text-align: center;
	}
	.login{
		width: 350pt;
	}
	#bar{
	margin-bottom: 10pt;
	width: 350pt;
	height: 30pt;
	}
	

</style>
	<a href="/" style="text-decoration: none"><div class="top">
		<h1> ICT 레시피 </h1>
		<h2> ICT RECIPE </h2>
	</div></a>
</head>
<body>
	<div class="body">
		<h2> 로그인 </h2>
		<p id="inpo"><input type="text" placeholder="아이디" style="width: 460px; height: 30px;"></p>
		<p id="inpo"><input type="text" placeholder="패스워드" style="width: 460px; height: 30px;"></p>
		<button id=bar style="background-color: #997000; color: white; font-size: 15pt;"> 로그인 </button>
		<br>
		<p style="font-size: 10pt;"><a href="test.do">아이디/비밀번호 찾기</a> | <a href="test.do">회원가입</a></p>
		<br>
		<button id=bar style="background-color: blue; color: white; font-size: 15pt;"> Facebook 간편로그인 </button><br>
		<button id=bar style="background-color: yellow; color: black; font-size: 15pt;"> 카카오 간편로그인 </button><br>
		<button id=bar style="background-color: #1DDB16; color: white; font-size: 15pt;"> 네이버 간편로그인 </button><br>
		<button id=bar style="background-color: red; color: white; font-size: 15pt;"> 구글 간편로그인 </button>
	</div>
</body>
</html>

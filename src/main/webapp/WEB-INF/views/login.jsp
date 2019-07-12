<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
	.top{
		background-color: #FFC19E;
		text-align: center;
		color: white;
	}
	.body{
		text-align: center;
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
<script type="text/javascript">
	function goLogin(f){
		f.action = "goLogin";
		f.submit();
	}
</script>
	<div class="body">
		<form method="post">
		<h2> 로그인 </h2>
		<p id="inpo"><input type="text" placeholder="아이디" name="id" style="width: 460px; height: 30px;"></p>
		<p id="inpo"><input type="password" placeholder="패스워드" name="pw" style="width: 460px; height: 30px;"></p>
		<button id=bar style="background-color: #997000; color: white; font-size: 15pt;" onclick="goLogin(this.form)"> 로그인 </button>
		</form>
		<br>
		<p style="font-size: 10pt;"><a href="test.do">아이디/비밀번호 찾기</a> | <a href="test.do">회원가입</a></p>
		<br>
		<button id=bar style="background-color: blue; color: white; font-size: 15pt;"> Facebook 간편로그인 </button><br>
		<!-- <button id=bar style="background-color: yellow; color: black; font-size: 15pt;"> 카카오 간편로그인 </button><br> -->
		<a id="kakao-login-btn"></a>
    	<a href="http://developers.kakao.com/logout"></a><br>
    	<script type='text/javascript'>
      	//<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('5e564d89ee303d1a1c3ae2451b04cd4e');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
        	container: '#kakao-login-btn',
        	success: function(authObj) {
            alert(Kakao.Auth.getAccessToken());
        	},
          	fail: function(err) {
          		alert(JSON.stringify(err));
          	}
       	});
      	//]]>
    	</script>
		<button id=bar style="background-color: #1DDB16; color: white; font-size: 15pt;"> 네이버 간편로그인 </button><br>
		<button id=bar style="background-color: red; color: white; font-size: 15pt;"> 구글 간편로그인 </button>
	</div>
</body>
</html>

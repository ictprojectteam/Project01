<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="383758306779-1jiumsras5rv9m91p26mbp1vc9lt2cpb.apps.googleusercontent.com">

<title>login</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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

#my-signin2 {
	display: inline-block;
}
/* footer */
#footer {
	width: 101%;
	margin: 100px auto 0px;
}

#first-footer {
	width: 1300px;
	margin: auto;
	display: grid;
	grid-template-columns: 400px 550px 350px;
}

#footer-company {
	font-size: 9pt;
	color: #888;
	line-height: 5pt;
}

#footer-link a:link, #footer-link a:visited {
	color: #888;
}

#footer-sns img {
	margin-top: 50px;
	width: 70px;
	height: 70px;
}

#report-content {
	margin-left: 50px;
}

#send-report {
	display: block;
	text-decoration: none;
	font-size: 9pt;
	color: black;
	margin: auto;
	text-align: center;
}

#second-footer {
	background: #fa8;
	width: 100vw;
	min-width: 1320px;
	margin: -8px;
	margin-top: 20px;
}

#second-footer-content {
	width: 1300px;
	display: grid;
	grid-template-columns: 250px 800px 250px;
	height: 170px;
	margin: auto;
}

#footer-logo {
	padding: 40px;
}

#footer-counting {
	display: grid;
	grid-template-columns: auto auto auto;
	grid-template-rows: 100px 70px;
	text-align: center;
	color: #e86;
	font-size: 35pt;
}

#footer-counting i {
	margin-top: 25px;
}

#footer-counting a:link, #footer-counting a:visited {
	color: #e86;
}

#footer-mailto-round {
	padding: 40px;
}

#footer-mailto {
	margin: auto;
	height: 80px;
	width: 80px;
	border-radius: 80px;
	background: #fff;
	color: #d75;
	font-size: 30pt;
	text-align: center;
}

#footer-mailto i {
	margin-top: 20px;
}

.footer-counting-label {
	margin-top: -10px;
	font-size: 9pt;
	color: #eee;
}

.footer-counting-number {
	margin-top: -10px;
	font-size: 16pt;
	color: #dd3;
}
</style>

</head>
<body onload="renderButton()">
	<div class="top">
		<h1>ICT 레시피</h1>
		<h2>ICT RECIPE</h2>
	</div>
	<script type="text/javascript">
	$(function(){
		$(".top").on("click", function(){
			location.href="/";
		});
	});
	function goLogin(f){
		f.action = "goLogin";
		f.submit();
	}
	function onSuccess(googleUser) {
	console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
	}
	function onFailure(error) {
		console.log(error);
	}
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope': 'profile email',
			'width': 240,
			'height': 50,
			'longtitle': true,
			'theme': 'light',
			'onsuccess': onSuccess,
			'onfailure': onFailure
		});
	}
	
</script>
	<div class="body">
		<form method="post">
			<h2>로그인</h2>
			<p id="inpo">
				<input type="text" placeholder="아이디" name="id"
					style="width: 460px; height: 30px;">
			</p>
			<p id="inpo">
				<input type="password" placeholder="패스워드" name="pw"
					style="width: 460px; height: 30px;">
			</p>
			<button id=bar
				style="background-color: #997000; color: white; font-size: 15pt;"
				onclick="goLogin(this.form)">로그인</button>
		</form>
		<br>
		<p style="font-size: 10pt;">
			<a href="find">아이디/비밀번호 찾기</a> | <a href="join">회원가입</a>
		</p>
		<br>
		<!-- Facebook -->
		<!-- <button id=bar style="background-color: blue; color: white; font-size: 15pt;"> Facebook 간편로그인 </button><br> -->
		<div id="fb-root"></div>
		<script async defer crossorigin="anonymous"
			src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.3&appId=343449269655895&autoLogAppEvents=1"></script>
		<div class="fb-login-button" data-width="" data-size="large"
			data-button-type="login_with" data-auto-logout-link="false"
			data-use-continue-as="false"></div>
		<script>
		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '343449269655895',
		      cookie     : true,
		      xfbml      : true,
		      version    : 'v3.3'
		    });
		    FB.AppEvents.logPageView();   
		  };
		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "https://connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
		</script>
		<br>
		<br>

		<!-- Kakao -->
		<!-- <button id=bar style="background-color: yellow; color: black; font-size: 15pt;"> 카카오 간편로그인 </button><br> -->
		<a id="kakao-login-btn"></a> <a
			href="http://developers.kakao.com/logout"></a>
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
		<br>
		<br>

		<!-- naver -->
		<!-- <button id=bar style="background-color: #1DDB16; color: white; font-size: 15pt;"> 네이버 간편로그인 </button><br> -->
		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naver_id_login"></div>
		<!-- //네이버아이디로로그인 버튼 노출 영역 -->
		<script type="text/javascript">
		  	var naver_id_login = new naver_id_login("c7XkD73CSDSwyqxmd05i", "DNPQ61HzvC");
		  	var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("green", 8,48);
		  	naver_id_login.setDomain("http://localhost:8090/login");
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login();
		  </script>
		<br>

		<!-- google -->
		<!-- <button id=bar style="background-color: red; color: white; font-size: 15pt;"> 구글 간편로그인 </button> -->
		<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
		<div id="my-signin2"></div>
		<script type="text/javascript">
		function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
		</script>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>

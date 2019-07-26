<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function goLogin(f){
		f.action = "goLogin";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">
		<fieldset>
			<legend>로그인</legend>
			아이디 : <input type="text" name="id"> 패스워드 : <input
				type="password" name="pw"> <input type="button"
				onclick="goLogin(this.form)" value="로그인">
		</fieldset>
	</form>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
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
</body>
</html>
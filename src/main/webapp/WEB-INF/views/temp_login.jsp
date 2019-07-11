<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			아이디 : <input type="text" name="id">
			패스워드 : <input type="password" name="pw">
			<input type="button" onclick="goLogin(this.form)">
		</fieldset>
	</form>
</body>
</html>
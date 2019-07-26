<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function login_fail(){
		alert("아이디 또는 암호가 올바르지 않습니다.");
		location.href='login';
	}
</script>
</head>
<body onload="login_fail()">

</body>
</html>
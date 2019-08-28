<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:choose>
		<c:when test="${empty mvo}">
			<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href = "login";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("올바르지 않은 접근입니다.");
				location.href = "/";
			</script>
		</c:otherwise>
	</c:choose>
</head>
<body>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="head.jsp" />
<style type="text/css">
	#head{
		list-style: none;
	}
	#head li{
		margin-top: 50px;
		float: left;
		
	}
</style>
</head>
<body>
	<div>
		<ul id="head">
			<li>레시피</li>
			<li>요리후기</li>
			<li>댓글</li>
			<li>토크</li>
			<li>문의</li>
			<li>회원정보수정</li>
		</ul>	
	</div>
</body>
<jsp:include page="foot.jsp" />
</html>
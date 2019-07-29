<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view recipe</title>
<style type="text/css">
	#view-recipe-body{
		border: 1px solid red;
		width: 1200px;
		margin: 30px auto 0px;
	}
	#view-recipe-head{
		border: 1px solid blue;
		width: 750px;
		margin: auto;
	}
	#main-image img{
		width: 720px;
		height: 480px;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div id="view-recipe-body">
		<div id="view-recipe-head">
			<div id="main-image"><img src="${rvo.main_image}"></div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
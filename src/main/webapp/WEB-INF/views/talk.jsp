<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
	table {
		margin: 0 auto;
		display: block;
	}
	.fs1{
		width: 600px;
		background-color: white;
		margin-top: 50px;
		margin-left: 250px;
	}
	.bt{
		margin-left: 350px;
		font-size: 1em;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".bt").on("click",function(){
			location.href = "talk_write";
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div>
		<table>
			<fieldset class = fs1>
			ICT레시피 쉐프들의 자유토크
			<input class="bt" type="button" value="등록">
			</fieldset>
		</table>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ranking</title>
<style type="text/css">
	#ranking{
		width: 1200px;
		margin: auto;
	}
	#ranking-top{
		width: 900px;
		height: 180px;
		margin: 50px auto;
	}
	#ranking-top img{
		width: 900px;
		height: 180px;
		margin: 0px;
		border-radius: 5px;
	}
	#ranking-content{
		width: 840px;
		display: grid;
		grid-template-columns: 420px 420px;
		grid-gap-column: 20px;
	}
	.each-block{
		margin: 5px 10px;
		padding: 5px;
		border: 1px solid #aaa;
		border-radius: 15px;
		display: grid;
		grid-template-columns: 100px 320px;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	
</script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div id="ranking">
		<div id="ranking-top">
			<img src="resources/images/ranking.png">
		</div>
		<div id="ranking-content">
			<div id="today-recipe" class="each-block">
				<div class="block-image"></div>
				<div class="block-text">
					<div class="block-title">오늘의 레시피<span class="anno">오늘 가장 인기가 많은 레시피</span></div>
					<div class="content">
						<ul>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
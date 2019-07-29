<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view recipe</title>
<style type="text/css">
	#view-recipe{
		border: 1px solid red;
		width: 1200px;
		margin: 30px auto 0px;
	}
	#view-recipe-head{
		border: 1px solid blue;
		width: 750px;
		margin: auto;
		text-align: center;
	}
	#main-image{
		width: 720px;
		margin: auto;
	}
	#main-image img{
		width: 720px;
		height: 480px;
		margin: auto;
	}
	#writer{
		display: inline-block;
		margin: 20px auto;
		color: #777;
	}
	#title{
		font-size: 25pt;
		line-height: 0pt;
		color: #555;
	}
	#introduce{
		width: 500px;
		font-size: 12pt;
		line-height: 20pt;
		text-align: left;
		margin: auto;
		color: #888;
	}
	#information{
		margin: 30px auto;
		width: 600px;
		display: grid;
		grid-template-columns: 200px 200px 200px;
	}
	#information div{
		border: 1px solid black;
	}
	#information i{
		font-size: 25pt;
		color: #ccc;
	}
	#information p{
		line-height: 0pt;
		color: #ccc;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div id="view-recipe">
		<div id="view-recipe-head">
			<div id="main-image"><img src="${rvo.main_image}"></div>
			<span id="writer">${rvo.writer}</span>
			<p id="title">${rvo.recipe_title}</p>
			<pre id="introduce">${rvo.recipe_introduce}</pre>
			<div id="information">
				<div id="quant">
					<i class="fas fa-user-friends"></i>
					<p>${rvo.recipe_quant}</p>
				</div>
				<div id="time">
					<i class="fas fa-stopwatch"></i>
					<p>${rvo.recipe_time}</p>
				</div>
				<div id="difficulty">
					<i class="fas fa-medal"></i>
					<p>${rvo.recipe_difficulty}</p>
				</div>
			</div>
			<hr width="720px">
		</div>
		<div id="view-recipe-body">
			<div id="material">
				<c:forEach var="k" items="${rvo.pack.replace('[', '').replace(']', '')}">
				${k}<br>
					<c:forEach var="l" items="${rvo.material.replace('[[', '').replace(']]', '')}">
					${l}
					</c:forEach>
				
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
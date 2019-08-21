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
		width: 1100px;
		height: 180px;
		margin: 50px auto;
	}
	#ranking-top img{
		width: 1100px;
		height: 180px;
		margin: auto;
		border-radius: 5px;
	}
	#ranking-content{
		width: 1040px;
		display: grid;
		grid-template-columns: 520px 520px;
		grid-gap-column: 20px;
		margin: auto;
	}
	.block-image img{
		width: 110px;
		height: 170px;
		padding: 10px 5px;
		border-radius: 55px;
	}
	.each-block{
		margin: 5px 10px;
		padding: 5px;
		border: 1px solid #aaa;
		border-radius: 15px;
		display: grid;
		grid-template-columns: 120px 380px;
	}
	.anno{
		font-size: 9pt;
		margin-left: 30px;
	}
	[class*=-content]{
		width: 360px;
		display: grid;
		grid-template-columns: 20px 100px 200px 40px;
		cursor: pointer;
	}
	[class*=-content]:hover{
		background: #8fa;
		color: #fff;
	}
	
	[class*=-content] div{
		padding: 5px;
	}
	.title-bar{
		margin: 0px 15px 0px 0px;
	}
	.count{
		color: #fa8;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("[class*=-content]").on("click", function(){
			var num = $(this).attr("class").replace("today-content", "");
			alert(num);
			/* location.href = "view_recipe?rno=" + num; */
		});f
	});
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
				<div class="block-image">
					<img src="resources/images/grilledfish.jpg">
				</div>
				<div class="block-text">
					<div class="block-title">오늘의 레시피<span class="anno">오늘 가장 인기가 많은 레시피</span></div>
					<c:choose>
						<c:when test="${empty rr}">
							표시할 내용이 없습니다.
						</c:when>
						<c:otherwise>
							<c:set var="i" value="1"></c:set>
							<c:forEach var="k" items="${rr}">
								<div class="today-content${k.r_idx}">
									<div class="rank">${i}</div>
									<div class="name">${k.name} </div>
									<div class="title"><span class="title-bar">|</span>${k.recipe_title}</div>
									<div class="count">${k.r_count}</div>
								</div>
								<c:set var="i" value="${i+1}"></c:set>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div id="monthly-recipe" class="each-block">
				<div class="block-image">
					<img src="resources/images/vegetable.png">
				</div>
				<div class="block-text">
					<div class="block-title">이달의 레시피<span class="anno">이달의 가장 Hot한 레시피</span></div>
					<c:choose>
						<c:when test="${empty mrr}">
							표시할 내용이 없습니다.
						</c:when>
						<c:otherwise>
							<c:set var="i" value="1"></c:set>
							<c:forEach var="k" items="${mrr}">
								<div class="monthly-content${k.r_idx}">
									<div class="rank">${i}</div>
									<div class="name">${k.name} </div>
									<div class="title"><span class="title-bar">|</span>${k.recipe_title}</div>
									<div class="count">${k.r_count}</div>
								</div>
								<c:set var="i" value="${i+1}"></c:set>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
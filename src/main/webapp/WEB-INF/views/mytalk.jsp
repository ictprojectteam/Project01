<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<jsp:include page="head.jsp" />
<style type="text/css">
	#menu{
		width: 1000px;
		margin: 20px auto;
	}
	.menu_bt{
		border: 1px solid #808080;
		width: 151px;
		height: 45px;
		font-size: 12pt;
		background-color: #D9D9D9;
		margin: 0px 5px;
		cursor: pointer;
	}
	.menu_bt:hover{
		background-color: #eeeeee;
	}
	.talk{
		width: 900px;
		margin: 10px auto;
	}
	.each-talk{
		display: grid;
		grid-template-columns: 130px 770px;
	}
	.image{
		padding: 5px;
		width: 120px;
		height: 120px;
		cursor: pointer;
		border-radius: 60px;
	}
	.talk-box{
		margin-left: 20px;
		padding-top: 10px;
	}
	.talk-head{
		display: grid;
		grid-template-columns: 620px 150px;
	}
	.talk-writer{
		font-size: 20pt;
		color: #8af;
		font-weight: bolder;
	}
	.talk-date{
		color: #aaa;
	}
	.talk-content{
		font-size: 16pt;
		margin-top: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".menu_bt").on("click", function(){
			$(".menu_bt:button").css("background-color", "#D9D9D9");
			$(this).css("background-color", "#92895A");
		});
	});
	function recipe(){
		location.href = "myRecipe";
	}
	function review(){
		location.href = "myReview";
	}
	function coment(){
		location.href = "myComent";
	}
	function talk(){
		location.href = "myTalk";
	}
	function inquires(){
		location.href = "myReport";
	}
	function prf_update(){
		location.href = "myPrf_update";
	}
</script>
</head>
<body>
	<div id="menu">
		<input class="menu_bt" type="button" value="레시피" onclick="recipe()">
		<input class="menu_bt" type="button" value="요리후기" onclick="review()">
		<input class="menu_bt" type="button" value="댓글" onclick="coment()">
		<input class="menu_bt" type="button" value="토크" onclick="talk()" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="문의" onclick="inquires()">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="prf_update()">
	</div>
	<div class="talk">
		<c:forEach var="k" items="${tlist}">
			<div class="each-talk">
				<c:choose>
					<c:when test="${empty k.prf_img}">
						<img src="resources/images/no_image.png" class="image">
					</c:when>
					<c:otherwise>
						<img src="${k.prf_img}" class="image">
					</c:otherwise>
				</c:choose>
				<div class="talk-box">
					<div class="talk-head">
						<div class="talk-writer">${k.name}</div>
						<div class="talk-info">
							<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart}
							<img src="resources/images/talk.png" style="width:30px; height: 30px;"> ${k.co_count}
						</div>
					</div>
					<div class="talk-date">${k.regdate.substring(0, 16)}</div>
					<div class="talk-content">${k.content}</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
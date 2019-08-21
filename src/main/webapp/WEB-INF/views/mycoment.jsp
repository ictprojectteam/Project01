<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<jsp:include page="head.jsp" />
<style type="text/css">
	#menu{
		width: 60%;
		margin: 20px auto;
	}
	.menu_bt{
		border: 1px solid #808080;
		width: 80pt;
		height: 30pt;
		font-size: 12pt;
		background-color: #D9D9D9;
		margin-right: 10px;
	}
	.menu_bt:hover{
		background-color: #eeeeee;
	}
	#coment_tab{
		width: 60%;
		margin: 20px auto;
		border-bottom: 1px solid;
	}
	.coment_bt{
		border: 1px solid #808080;
		width: 80pt;
		height: 20pt;
		font-size: 12pt;
		background-color: #DFEEF3;
		border-radius: 6px;
		margin-bottom: 10px;
	}
	.coment_bt:hover {
		background-color: #488399;
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
		location.href = "myInquires";
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
		<input class="menu_bt" type="button" value="댓글" onclick="coment()" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="토크" onclick="talk()">
		<input class="menu_bt" type="button" value="문의" onclick="inquires()">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="prf_update()">
	</div>
	<div id="coment_tab">
		<input class="coment_bt" type="button" value="내가 쓴 댓글" style="background-color: #488399;">
		<input class="coment_bt" type="button" value="받은 댓글">
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
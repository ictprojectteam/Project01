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
	#review_tab{
		width: 900px;
		margin: 20px auto;
		border-bottom: 1px solid;
	}
	.review_bt{
		width: 150px;
		border: 1px solid #808080;
		font-size: 12pt;
		background: #dee;
		border-radius: 6px;
		margin-bottom: 10px;
		padding: 3px 6px;
		display: inline-block;
		text-align: center;
		box-sizing: border-box;
		cursor: pointer;
	}
	.selected{
		background: #489!important;
		cursor: default!important;
	}
	.review_bt:hover {
		background-color: #8cd;
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
		<input class="menu_bt" type="button" value="요리후기" onclick="review()" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="댓글" onclick="coment()">
		<input class="menu_bt" type="button" value="토크" onclick="talk()">
		<input class="menu_bt" type="button" value="문의" onclick="inquires()">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="prf_update()">
	</div>
	<div id="review_tab">
		<span class="review_bt selected">받은 요리 후기</span>
		<span class="review_bt">내가 쓴 요리 후기</span>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
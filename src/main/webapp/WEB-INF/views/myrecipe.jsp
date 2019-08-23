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
	}
	.menu_bt:hover{
		background-color: #eeeeee;
	}
	#recipe_tab{
		width: 900px;
		margin: 20px auto;
		border-bottom: 1px solid;
	}
	.recipe_bt{
		width: 100px;
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
	.recipe_bt:hover {
		background-color: #8cd;
	}
	.recipe-box{
		width: 900px;
		margin: 10px auto;
	}
	.each-recipe{
		display: grid;
		grid-template-columns: 170px 730px;
	}
	.image{
		padding: 5px;
		width: 160px;
		height: 160px;
		cursor: pointer;
	}
	.recipe-content{
		margin-left: 20px;
		padding-top: 20px;
	}
	.recipe-title{
		height: 60px;
		font-size: 16pt;
		font-weight: bolder;
		cursor: pointer;
	}
	.recipe-info{
		color: #bbb;
		font-size: 13pt;
	}
	.recipe-info span{
		margin: 10px 10px;
		display: inline-block;
	}
	.edit{
		float: right;
		margin-right: 20px;
		display: inline-block;
		padding: 10px 30px;
		border: 1px solid #ccc;
		cursor: pointer;
		color: #333;
	}
	.edit i{
		color: #fa8;
	}
</style>
<script type="text/javascript">
	var rvo = {};
	$(function(){
		$(".menu_bt").on("click", function(){
			$(".menu_bt:button").css("background-color", "#D9D9D9");
			$(this).css("background-color", "#92895A");
		});

		$(".recipe_bt").each(function(){
			$(this).on("click", function(){
				if(!$(this).hasClass("selected")){
					$(".recipe_bt").removeClass("selected");
					$(this).addClass("selected");
					var t = $(this).text();
					if(t === '공개중') {
						rvo.savepublic = '1';
					} else {
						rvo.savepublic = '0';
					}
					getList();
				}
			});
		});
		rvo.savepublic = '1';
		getList();
	});

	function getList() {
		$.ajax({
			url : "myRecipeList",
			data : rvo,
			dataType : "text",
			type : "post",
			success : function(data) {
				$(".recipe-box").empty();
				$(".recipe-box").append(data);
			},
			error : function() {
				alert("쓰기 실패2");
			}
		});
	}

	function view(e) {
		location.href = "view_recipe?rno=" + e;
	}
	
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
		<input class="menu_bt" type="button" value="레시피" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="요리후기" onclick="review()">
		<input class="menu_bt" type="button" value="댓글" onclick="coment()">
		<input class="menu_bt" type="button" value="토크" onclick="talk()">
		<input class="menu_bt" type="button" value="문의" onclick="inquires()">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="prf_update()">
	</div>
	
	<div id="recipe_tab">
		<span class="recipe_bt selected">공개중</span>
		<span class="recipe_bt">작성중</span>
	</div>
	<div class="recipe-box">
		<div class="each-recipe">
			<img src="" class="image">
			<div class="recipe-content">
				<div class="recipe-title">1</div>
				<div class="recipe-info">
					<span class="recipe-regdate"><i class="far fa-calendar-alt"></i></span>
					<span class="recipe-view"><i class="fas fa-eye"></i></span>
					<span class="recipe-com"><i class="fas fa-comment-alt"></i></span>
				</div>
				<div class="recipe-button">
					<span class="edit"><i class="fas fa-edit"></i>수정</span>
				</div>
			</div>
		</div>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
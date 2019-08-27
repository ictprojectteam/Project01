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

	function edit(e) {
		location.href = "edit_recipe?r_idx=" + e;
	}
	
	function go(e) {
		location.href = e;
	}
</script>
</head>
<body>
	<div id="menu">
		<input class="menu_bt" type="button" value="레시피" onclick="go('myRecipe')" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="요리후기" onclick="go('myReview')">
		<input class="menu_bt" type="button" value="댓글" onclick="go('myComent')">
		<input class="menu_bt" type="button" value="토크" onclick="go('myTalk')">
		<input class="menu_bt" type="button" value="문의" onclick="go('myReport')">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="go('myPrf_update')">
	</div>
	
	<div id="recipe_tab">
		<span class="recipe_bt selected">공개중</span>
		<span class="recipe_bt">작성중</span>
	</div>
	<div class="recipe-box">
	
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#mainbody {
	margin: auto;
}

#talk-recent-label, #recipe-recent-label, #event-recent-label {
	font-size: 25pt;
	color: #fa8;
	margin: 10px;
}

#recipe-recent-label {
	margin-top: 80px;
}

#talk-recent-label a:visited, #talk-recent-label a:link,
	#recipe-recent-label a:visited, #recipe-recent-label a:link,
	#event-recent-label a:visited, #event-recent-label a:link {
	text-decoration: none;
	color: #fa8;
}

#talk-recent, #recipe-recent {
	display: grid;
	width: 1200px;
	height: 300px;
	grid-template-columns: 50px 1100px 50px;
}

#talk-recent-preview-wrap, #recipe-recent-preview-wrap {
	overflow: hidden;
	position: relative;
}

#talk-recent-preview, #recipe-recent-preview {
	width: 300%;
}

.talk-preview, .recipe-preview {
	height: 280px;
	display: inline-block;
	width: 250px;
	margin: 10px 10px;
	cursor: pointer;
}

.talk-preview img, .recipe-preview img {
	width: 250px;
	height: 180px;
}

.talk-preview-content, .recipe-preview-content {
	width: 250px;
	height: 90px;
	line-height: 15px;
	color: #333;
	text-indent: 10px;
	font-size: 9pt;
}

.talk-left-arrow, .talk-right-arrow, .recipe-left-arrow,
	.recipe-right-arrow {
	padding-top: 110px;
	font-size: 35pt;
	text-align: center;
	text-decoration: none;
	color: #fa8;
}

#talk-recent a, #recipe-recent a {
	color: #fa8;
}

.arrow-disabled {
	color: #555;
	!
	important;
}

.talk-left, .recipe-left {
	visibility: hidden;
}

.talk-preview:hover .talk-preview-content, .recipe-preview:hover .recipe-preview-content
	{
	background: #fb9;
	color: #ddd;
	opacity: 0.5;
}

.talk-preview:hover img, .recipe-preview:hover img {
	opacity: 0.5;
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		var talklist = $("#talk-recent-preview");
		var talk_show_num = 4;
		var talk_num = 0;
		var total = $(".talk-preview").length;
		var talk_width = 273;
		if(talk_num == 0){
			$(".talk-right").css("cursor", "pointer");
		}
		$(".talk-right-arrow").on("click", function(){
			if(talk_num < (total - talk_show_num)) {
				talk_num++;
				talklist.stop().animate({marginLeft:-talk_width*talk_num+"px"},400);
				$(".talk-left").css("visibility", "visible");
				$(".talk-left").css("cursor", "pointer");
				$(".talk-left").fadeIn("fast");
			}
			if(talk_num == (total - talk_show_num)){
				 $(".talk-right").fadeOut("fast");
				 $(".talk-right").css("cursor", "default");
			}
		});
		$(".talk-left-arrow").on("click", function(){
			if(talk_num > 0) {
				talk_num--;
				talklist.stop().animate({marginLeft:-talk_width*talk_num+"px"},400);
				$(".talk-right").fadeIn("fast");
				$(".talk-right").css("cursor", "pointer");
			}
			if(talk_num == 0) {
				$(".talk-left").fadeOut("fast");
				$(".talk-left").css("cursor", "default");
			}
		});
		var recipelist = $("#recipe-recent-preview");
		var recipe_show_num = 4;
		var recipe_num = 0;
		var total = $(".recipe-preview").length;
		var recipe_width = 273;
		if(recipe_num == 0){
			$(".recipe-right").css("cursor", "pointer");
		}
		$(".recipe-right-arrow").on("click", function(){
			if(recipe_num < (total - recipe_show_num)) {
				recipe_num++;
				recipelist.stop().animate({marginLeft:-recipe_width*recipe_num+"px"},400);
				$(".recipe-left").css("visibility", "visible");
				$(".recipe-left").fadeIn("fast");
			}
			if(recipe_num == (total - recipe_show_num)){
				 $(".recipe-right").fadeOut("fast");
			}
		});
		$(".recipe-left-arrow").on("click", function(){
			if(recipe_num > 0) {
				recipe_num--;
				recipelist.stop().animate({marginLeft:-recipe_width*recipe_num+"px"},400);
				$(".recipe-right").fadeIn("fast");
			}
			if(recipe_num == 0) {
				$(".recipe-left").fadeOut("fast");
			}
		});
		$(".talk-preview").on("click", function(p){
			var attrib = $(this).attr("id");
			alert(attrib);
		});
		$(".recipe-preview").on("click", function(p){
			var attrib = $(this).attr("id");
			alert(attrib);
		});
	});
</script>
</head>
<body>
	<div id="mainbody">
		<p id="talk-recent-label">
			<a href="talk">토크!!</a>
		<p>
		<div id="talk-recent">
			<div class="talk-left-arrow">
				<i class="fas fa-angle-left talk-left"></i>
			</div>
			<div id="talk-recent-preview-wrap">
				<div id="talk-recent-preview">
					<c:forEach var="k" begin="1" end="8">
						<div class="talk-preview" id="talk${k}">
							<img src="../resources/images/dessert.jpg">
							<div class="talk-preview-content">
								<p>제목 : ${k}</p>
								<p>작성자 :</p>
								<p>작성시간 :</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="talk-right-arrow">
				<i class="fas fa-angle-right talk-right"></i>
			</div>
		</div>

		<p id="recipe-recent-label">
			<a href="recipe">레시피!!</a>
		</p>
		<div id="recipe-recent">
			<div class="recipe-left-arrow">
				<a href="javascript:void(0)"><i
					class="fas fa-angle-left recipe-left"></i></a>
			</div>
			<div id="recipe-recent-preview-wrap">
				<div id="recipe-recent-preview">
					<c:forEach var="k" begin="1" end="8">
						<div class="recipe-preview" id="recipe${k}">
							<img src="../resources/images/dessert.jpg">
							<div class="recipe-preview-content">
								<p>제목 : ${k}</p>
								<p>작성자 :</p>
								<p>작성시간 :</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="recipe-right-arrow">
				<i class="fas fa-angle-right recipe-right"></i>
			</div>
		</div>

		<p id="event-recent-label">
			<a href="event">이벤트!!</a>
		</p>
		<div id="event-recent"></div>
	</div>
</body>
</html>
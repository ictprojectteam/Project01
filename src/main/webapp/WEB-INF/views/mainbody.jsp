<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#mainbody{
		margin: auto;
		border: 1px solid red;
	}
	#talk-recent-label{
		font-size: 25pt;
		color: #fa8;
		margin: 10px;
	}
	#talk-recent{
		display: grid;
		width: 1200px;
		height: 300px;
		grid-template-columns: 50px 1100px 50px;
	}
	#talk-recent-preview-wrap{
		overflow: hidden;
		position: relative;
	}
	#talk-recent-preview{
		width: 300%;
	}
	.talk-preview{
		height: 280px;
		display: inline-block;
		width: 250px;
		margin: 10px 10px;
	}
	.talk-preview img{
		width: 250px;
		height: 180px;
	}
	.talk-preview-content{
		width: 250px;
		height: 90px;
		border: 1px solid blue;
		line-height: 15px;
		color: #333;
		text-indent: 10px;
		font-size: 9pt;
	}
	.talk-left-arrow, .talk-right-arrow{
		padding-top: 110px;
		font-size: 35pt;
		text-align: center;
		text-decoration: none;
	}
	#talk-recent a{
		color: #fa8;
	}
	.arrow-disabled{
		color: #555;!important;
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
		$(".talk-right-arrow").on("click", function(){
			if(talk_num < (total - talk_show_num)) {
				talk_num++;
				talklist.stop().animate({marginLeft:-talk_width*talk_num+"px"},400);
				$(".talk-left-arrow").removeClass("arrow-disabled");
			}
			if(talk_num == (total - talk_show_num)){
				 $(".talk-right-arrow").addClass("arrow-disabled");
			}
		});
		$(".talk-left-arrow").on("click", function(){
			if(talk_num > 0) {
				talk_num--;
				talklist.stop().animate({marginLeft:-talk_width*talk_num+"px"},400);
				$(".talk-right-arrow").removeClass("arrow-disabled");
			}
			if(talk_num == 0) {
				$(".talk-left-arrow").addClass("arrow-disabled");
			}
		});
	});
</script>
</head>
<body>
	<div id="mainbody" style="margin-top: 100px;">
		<p id="talk-recent-label">토크!!<p>
		<div id="talk-recent">
			<div class="talk-left-arrow">
				<a href="javascript:void(0)"><i class="fas fa-angle-left"></i></a>
			</div>
			<div id="talk-recent-preview-wrap">
				<div id="talk-recent-preview">
					<c:forEach var="k" begin="1" end="8">
						<div class="talk-preview">
							<img src="../resources/images/dessert.jpg">
							<div class="talk-preview-content">
								<p>제목 : ${k}</p>
								<p>작성자 : </p>
								<p>작성시간 : </p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="talk-right-arrow">
				<a href="javascript:void(0)"><i class="fas fa-angle-right"></i></a>
			</div>
		</div>
		<div id="recipe-recent">
			
		</div>
		<div id="event-recent">
		
		</div>
	</div>
</body>
</html>
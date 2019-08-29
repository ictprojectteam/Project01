<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ICT PROJECT TEAM</title>
<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon" />
<style type="text/css">
	body{
		margin: auto;
	}
	#body-content{
		width: 1200px;
		margin: 30px auto 0px;
	}
	#mainbody{
		margin: auto;
	}
	#talk-recent-label, #recipe-recent-label, #event-recent-label{
		font-size: 25pt;
		color: #F78181;
		margin: 10px;
		font-family: "궁서";
	}
	#event-recent-label{
		margin-top: 50px;
		color: #fa8;
		margin: 30px;
	}
	#recipe-recent-label{
		margin-top: 50px;
	}
	#talk-recent-label a:visited, #talk-recent-label a:link, #recipe-recent-label a:visited,
	#recipe-recent-label a:link, #event-recent-label a:visited, #event-recent-label a:link{
		text-decoration: none;
		color: #fa8;
	}
	#event-recent{
		border: 1px solid #F79F81;
		display: grid;
		grid-template-columns: 599px 599px;
		background: #F6D8CE;
		border-radius: 7px;
	}
	.event-title{
		text-align: center;
		font-size: 11pt;
		font-weight: bolder;
		border-style: solid;
		border-color: #f00 #fff #f00 #fff;
		border-width: 0px 0px 1px 0px;
		padding: 5px;
	}
	.open-event-box{
		border-right: 1px solid #777;
	}
	.event-title:nth-child(odd){
		border-right: 1px solid #777;
	}
	.each-event{
		padding: 8px;
		font-size: 10pt;
		cursor: pointer;
	}
	.each-event:hover{
		background: #fa8;
	}
	.empty{
		padding: 5px 10px;
		font-size: 12pt;
		font-weight: bolder;
	}
	#recipe-recent{
		display: grid;
		width: 1201px;
		height: 300px;
		grid-template-columns: 50px 1101px 50px;
	}
	#recipe-recent-preview-wrap{
		overflow: hidden;
		position: relative;
	}
	#recipe-recent-preview{
		width: 500%;
	}
	.recipe-preview{
		height: 280px;
		display: inline-block;
		width: 251px;
		margin: 10px 10px;
		cursor: pointer;
		box-sizing: content-box;
		border: 1px solid #F79F81;
		border-radius:7px;
	}
	.recipe-preview img{
		width: 250px;
		height: 180px;
		border-radius:7px 7px 0px 0px;
	}
	.recipe-preview-content{
		width: 250px;
		height: 90px;
		line-height: 15px;
		color: #333;
		text-indent: 10px;
		font-size: 9pt;
		overflow: hidden;
	}
	.recipe-left-arrow, .recipe-right-arrow{
		padding-top: 110px;
		font-size: 35pt;
		text-align: center;
		text-decoration: none;
		color: #fa8;
		cursor: pointer;
	}
	#recipe-recent a{
		color: #fa8;
	}
	.arrow-disabled{
		color: #555;!important;
	}
	.recipe-preview:hover .recipe-preview-content{
		background: #fb9;
		color: #ddd;
		opacity: 0.5;
	}
	.recipe-preview:hover img{
		opacity: 0.5;
	}
	.recipe-preview-content p:first-child{
		display:-webkit-box;
	  -webkit-line-clamp:1;
	  -webkit-box-orient:vertical;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	#talk-recent{
		border: 1px solid #F79F81;
		padding: 10px 15px;
		background-color: #F6D8CE;
	background: #F6D8CE;
		border: 1px solid  #777;
		padding: 10px 15px;
		border-radius: 7px;
	}
	.talk-preview{
		cursor: pointer;
		display: grid;
		grid-template-columns: 180px 850px 170px;
		font-size: 10pt;
		height: 30px;
		line-height: 10pt;
	}
	.talk-preview:hover{
		background: #fa8;
	}
	.talk-preview div{
		padding-top: 5px;
	}
	.talk-content{
		white-space: nowrap;
	 	overflow: hidden;
		text-overflow: ellipsis;
		padding-right: 20px;
		line-height: 10pt;
		background: 
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		var recipelist = $("#recipe-recent-preview");
		var recipe_show_num = 4;
		recipelist.append($(".recipe-preview:lt(" + recipe_show_num + ")").clone());
		var recipe_num = 0;
		var r_total = $(".recipe-preview").length;
		var recipe_width = 278;
		var m = false;
		
		var p = function() {
			slide = setInterval(function() {
				$(".recipe-right-arrow").click();
			}, 3000);
		}
		var s = function(){
			clearInterval(slide);
		};
		if(recipe_num == 0){
			$(".recipe-right").css("cursor", "pointer");
		}
		$(".recipe-right-arrow").on("click", function(){
			if(!m){
				m = true;
				s();
				if(recipe_num == (r_total - recipe_show_num)){
					recipe_num = 0;
					recipelist.css("margin-left", 0);
				}
				if(recipe_num < (r_total - recipe_show_num)) {
					recipe_num++;
					recipelist.stop().animate({marginLeft:-recipe_width*recipe_num+"px"},400);
				}
				p();
				setTimeout(function(){
					m = false;
				}, 500);
			}
		});
		$(".recipe-left-arrow").on("click", function(){
			if(!m){
				m = true;
				s();
				if(recipe_num == 0) {
					recipe_num = r_total - recipe_show_num;
					recipelist.css("margin-left", -recipe_width*recipe_num+"px");
				}
				if(recipe_num > 0) {
					recipe_num--;
					recipelist.stop().animate({marginLeft:-recipe_width*recipe_num+"px"},400);
				}
				p();
				setTimeout(function(){
					m = false;
				}, 500);
			}
		});
		$(".talk-preview").on("click", function(p){
			var tno = $(this).attr("id").replace("talk", "");
			location.href = "talk_view?t_idx=" + tno;
		});
		$(".recipe-preview").on("click", function(p){
			var rno = $(this).attr("id").replace("recipe", "");
			location.href = "view_recipe?rno=" + rno;
		});
		p();
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="body-content">
		<div id="mainbody">
		<p id="talk-recent-label"><a href="talk">토크</a><p>
		<div id="talk-recent">
			<c:forEach items="${t_list}" var="k">
				<div class="talk-preview" id="talk${k.t_idx}">
					<div>${k.regdate.substring(0,16)}</div>
					<div class="talk-content">${k.content}</div>
					<div>By ${k.name}</div>
				</div>
			</c:forEach>
		</div>
		
		<p id="event-recent-label"><a href="event">이벤트</a></p>
		<div id="event-recent">
			<div class="event-title">진행중인 이벤트</div>
			<div class="event-title">이벤트 당첨자 확인</div>
			<div class="open-event-box">
				<c:choose>
					<c:when test="${empty e_list}">
						<div class="empty">진행중인 이벤트가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${e_list}">
							<div class="each-event" onclick="view_event(${k.e_idx})">${k.e_title}</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="prize-box">
				<c:choose>
					<c:when test="${empty p_list}">
						<div class="empty">당첨자 발표가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${p_list}">
							<div class="each-event" onclick="view_event(${k.e_idx})">${k.e_title}</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<p id="recipe-recent-label"><a href="recipe">레시피</a></p>
		<div id="recipe-recent">
			<div class="recipe-left-arrow">
				<i class="fas fa-angle-left recipe-left"></i>
			</div>
			<div id="recipe-recent-preview-wrap">
				<div id="recipe-recent-preview">
					<c:forEach items="${r_list}" var="k">
						<div class="recipe-preview" id="recipe${k.r_idx}">
							<img src="${k.main_image}">
							<div class="recipe-preview-content">
								<p>제목 : ${k.recipe_title}</p>
								<p>작성자 : ${k.writer}</p>
								<p>작성시간 : ${k.regdate.substring(0,10)}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="recipe-right-arrow">
				<i class="fas fa-angle-right recipe-right"></i>
			</div>
		</div>
		
		
	</div>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
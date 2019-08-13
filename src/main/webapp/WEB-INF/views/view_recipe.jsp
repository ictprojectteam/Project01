<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view recipe</title>
<style type="text/css">
	#view-recipe{
		width: 1200px;
		margin: 30px auto 0px;
	}
	#view-recipe-head{
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
		margin: 50px auto;
		color: #888;
	}
	#information{
		margin: 20px auto;
		width: 600px;
		display: grid;
		grid-template-columns: 200px 200px 200px;
	}
	#information i{
		font-size: 25pt;
		color: #ccc;
	}
	#information p{
		line-height: 0pt;
		color: #ccc;
	}
	#material{
		width: 850px;
		margin: auto;
		line-height: 6pt;
		color: #555;
		font-size: 13pt;
	}
	#video{
		width: 900px;
		margin: 30px auto;
	}
	#video-label{
		font-size: 16pt;
		color: #555;
		margin-top: 80px;
	}
	#play-video {
		width: 700px;
		margin: auto;
	}
	#order{
		width: 900px;
		margin: 80px auto 0px auto;
		color: #333;
	}
	.order-content{
		width: 900px;
		display: grid;
		grid-template-columns: 100px 465px 335px;
		margin-bottom: 50px;
	}
	.order-number{
		text-align: right;
	}
	.order-number p{
		width: 30px;
		padding: 10px;
		border-radius: 30px;
		background: #fa8;
		color: #eee;
		text-align: center;
		font-size: 16pt;
		margin: 0px 0px 0px 30px;
	}
	.order-text{
		font-size: 16pt;
		color: #555;
		line-height: 10pt;
	}
	.order-text pre{
		margin-top: 10px;
	}
	.order-img{
		height: 220px;
	}
	.order-img img{
		width: 335px;
		height: 220px;
		border-radius: 15px;
	}
	#comp{
		width: 720px;
		display: grid;
		grid-template-columns: 90px 540px 90px;
		margin: auto;
	}
	#comp-image-wrap{
		overflow: hidden;
		position: relative;
		width: 720px;
		margin: auto;
		left: -90px;
		z-index: -1;
	}
	#comp-image-pack{
		width: 1000%;
	}
	.comp-image{
		display: inline-block;
		width: 720px;
		height: 480px;
		margin: 0px;
		padding: 0px;
	}
	.comp-image img{
		width: 720px;
		height: 480px;
		margin: 0px;
	}
	#comp-left, #comp-right{
		padding-top: 210px;
		text-align: center;
		font-size: 30pt;
		color: #aaa;
		opacity: 0.5;
		cursor: pointer;
	}
	#comp-left:hover, #comp-right:hover{
		opacity: 0.7;
	}
	#tip{
		width: 800px;
		margin: auto;
	}
	#tip-label{
		background: #f53;
		color: #eee;
		font-style: italic;
		font-size: 20pt;
		padding: 10px;
		display: inline-block;
		width: 220px;
	}
	#tip pre{
		width: 750px;
		margin: 20px auto;
		font-size: 16pt;
	}
	#tag{
		width: 720px;
		margin: 50px auto 10px auto;
	}
	#tag-label{
		background: #f85;
		color: #eee;
		font-size: 12pt;
		border-radius: 15px;
		padding: 5px;
		display: inline-block;
	}
	.tag{
		font-size: 12pt;
		margin-left: 15px;
		cursor: pointer;
		color: #f85;
	}
	#dateinfo{
		width: 720px;
		margin: 30px auto;
		border: 1px dashed #ccc;
		padding: 15px;
		color: #aaa;
		font-size: 9pt;
	}
	#datebar{
		margin-left: 10px;
		margin-right: 20px;
	}
	#warning{
		margin-left: 40px;
	}
	.fa-ban{
		font-size: 13pt;
	}
	#comment{
		width: 900px;
		margin: auto;
	}
	#com-label{
		margin-top: 40px;
	}
	#com-count{
		margin-left: 10px;
		color: #fa8;
	}
	#comlist{
		display: grid;
		grid-template-columns: 80px 820px;
	}
	#comform{
		display: flex;
	}
	#comtext{
		resize: none;
		width: 90%;
		height: 120px;
		font-size: 13pt;
		padding: 5px;
		border: 1px #ccc;
		border-style: solid none solid solid;
		border-radius: 5px 0px 0px 5px;
		display: inline-block;
		z-index: 0;
	}
	#comtext:focus{
		box-shadow: 0px 0px 4px 1px #7af;
		z-index:1;
	}
	#combutton{
		width: 10%;
		height: 20px;
		text-align: center;
		padding: 55px 20px;
		font-size: 13pt;
		color: #555;
		margin: auto;
		cursor: pointer;
		border: 1px solid #ccc;
		border-radius: 0px 5px 5px 0px;
		z-index:0;
	}
	#combutton:active{
		box-shadow: 0px 0px 4px 2px #7af;
		z-index:1;
	}
	.com-pro{
		height: 80px;
	}
	.com-content{
		margin-left: 10px;
	}
	.com-writer{
		font-size: 16pt;
		color: #c97;
	}
	.com-date, .com-del, .com-rep{
		margin-left: 10px;
		color: #aaa;
	}
	.com-del, .com-rep{
		cursor: pointer;
	}
	.com-text{
		font-size: 12pt;
		color: #555;
	}
	.infobar{
		margin-left: 10px;
		color: #ccc;
	}
	#rep-modal{
		z-index:3;
		display:none;
		padding-top:100px;
		position:fixed;
		left:0;
		top:0;
		width:100%;
		height:100%;
		overflow:auto;
		background-color: #0000;
	}
	
	#rep-modal-content{
		margin:auto;
		background-color:#fff;
		position:relative;
		padding:0;
		outline:0;
		width:350px;
		border: 1px solid #aaa;
		animation: animatetop 0.4s;
		border-radius: 15px;
	}
	
	@keyframes animatetop{
		from{top:-300px;opacity:0}
		to{top:0;opacity:1}
	}
	
	#rep-noti{
		display: grid;
		grid-template-columns: 300px 50px;
		padding: 13px;
		border-bottom: 0.5px solid #888;
	}
	
	#rep-text{
		font-size: 12pt;
		font-weight: bolder;
	}
	
	#rep-noti .fa-times{
		font-size: 22pt;
		cursor: pointer;
		color: #bbb;
	}
	
	#rep-form{
		list-style: none;
		padding: 0 0 10px 0;
	}
	
	#rep-form li{
		padding: 6px 12px;
		font-size: 9pt;
	}
	
	#rep-hid{
		display: none;
	}
	
	input[name=rep-etc]{
		width: 95%;
		padding: 5px;
		border: 1px solid #aaa;
		border-radius: 5px;
	}
	
	#rep-button{
		text-align: center;
		margin: 30px 0px;
	}
	
	#rep-button span{
		cursor: pointer;
		font-size: 12pt;
		margin-top: 15pt;
		padding: 10px 30px;
		border-radius: 5px;
		margin: 5px;
		font-weight: bolder;
	}
	
	#rep-submit{
		border: 1px solid #d86;
		background: #fa8;
		color: #eee;
	}
	
	#rep-submit:hover{
		background: #e97;
	}
	
	#rep-cancel{
		border: 1px solid #999;
		color: #222;
	}
}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		var imagelist = $("#comp-image-pack");
		var moving = false;
		var i_count = $(".comp-image").length;
		var imagenum = 0;
		$("#comp-image-pack").append($(".comp-image:first-child").clone());
		$("#comtext").on("focus", function(){
			var mid = "${mvo.id}";
			if(mid == ""){
				var lchk = confirm("로그인이 필요합니다. 로그인 하시겠습니까?");
				if(lchk) {
					$("#comtext").blur();
					location.href = "login";
				} else {
					$("#comtext").blur();
				}
			}
		});
		$("#comp-left").on("click", function(){
			if(moving == false) {
				moving = true;
				if(imagenum == 0){
					imagenum = i_count;
					imagelist.css("margin-left", -725*imagenum+"px");
				}
				if(imagenum > 0) {
					imagenum--;
					imagelist.stop().animate({marginLeft:-725*imagenum+"px"}, 400);
				}
				setTimeout(function(){
					moving = false;
				}, 500);
			}
		});
		$("#comp-right").on("click", function(){
			if(moving == false) {
				moving = true;
				if (imagenum == i_count) {
					imagenum = 0;
					imagelist.css("margin-left", 0);
				}
				if (imagenum < i_count) {
					imagenum++;
					imagelist.stop().animate({marginLeft:-725*imagenum+"px"}, 400);
				}
				setTimeout(function(){
					moving = false;
				}, 500);
			}
		});

		$("#combutton").on("click", function(){
			if ($("#comtext").val() == "") {
				alert("내용을 입력해주세요.");
			} else {
				
				$.ajax({
					url : "recipe_comwrite",
					data : $("#comform").serialize(),
					dataType : "text",
					type : "post",
					success : function(data) {
						if (data != 0) {
							getComList();
						} else {
							alert("쓰기 실패1");
						}
					},
					error : function() {
						alert("쓰기 실패2");
					}
				});
			}
		});

		$("input[name=rep-rea]").on("change", function(){
			if($(this).val() == 9){
				$("#rep-hid").css("display", "block");
			} else {
				$("#rep-hid").css("display", "none");
			}
		});

		$("#rep-noti .fa-times").on("click", function(){
			$("#rep-modal").css({"display":"none"});
		});

		$("#rep-cancel").on("click", function(){
			$("#rep-modal").css({"display":"none"});
		});

		$("#rep-submit").on("click", function(){
			var rea = $("input[name=rep-rea]:checked").val();
			var etc = $("input[name=rep-etc]").val();
			var tg = $("input[name=rep-tg]").val();
			if (rea == undefined) {
				alert("신고사유를 선택해주세요.");
			} else if(rea == 9 && etc == "") {
				alert("기타사유를 입력해주세요.");
			} else {
				$.ajax({
					url : "rep_com_recipe",
					data : {"rea" : rea, "etc" : etc, "tg" : tg},
					dataType : "text",
					type : "post",
					success : function(data) {
						if (data != 0) {
							alert("신고가 접수되었습니다.");
						} else {
							alert("쓰기 실패1");
						}
					},
					error : function() {
						alert("쓰기 실패2");
					}
				});
			}
		});

		$(this).on("click", function(){
			if(event.target == document.getElementById("rep-modal")) $("#rep-modal").css({"display":"none"});
		});
		
		getComList();
		$("iframe").attr({"frameborder" : "0", "allow" : "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", "allowfullscreen" : ""})
	});

	function countCom() {
		$("#com-count").empty();
		$.ajax({
			url : "count_com",
			data : "r_idx=${rvo.r_idx}",
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#com-count").append(data);
			},
			error : function() {
				alert("읽기 실패");
			}
		});
	}
	
	function getComList() {
		$("#comlist").empty();
		var clist = "";
		$.ajax({
			url : "recipe_comlist",
			data : "r_idx=${rvo.r_idx}",
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#comlist").append(data);
			},
			error : function(){
				alert("읽기 실패2");
			}
		});
		countCom();
	}

	function com_del(n) {
		var chk = confirm("정말 삭제할까요?");
		if (chk) {
			$.ajax({
				url : "recipe_comdelete",
				data : "r_c_idx=" + n,
				dataType : "text",
				type : "post",
				success : function(data) {
					getComList();
				},
				error : function() {
					alert("삭제 실패");
				}
			});
		}
	}

	function com_rep(n) {
		$("#rep-modal").css("display", "block");
		$("#rep-form input[name=rep-tg]").val("${rvo.r_idx}" + ", " + n);
	}
</script>
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
				<c:set var="pack" value="${rvo.pack.replace('[','').replace(']','').split(', ')}"></c:set>
				<c:set var="rege" value="\|\], \[\|"></c:set>
				<c:set var="materials" value="${rvo.material.replace('[[|', '').replace('|]]', '').split(rege)}"></c:set>
				<c:forEach var="i" begin="0" end="${fn:length(pack) - 1}">
					<h3>[${pack[i]}]</h3>
					<c:set var="rege2" value="\|, \|"></c:set>
					<c:set var="material" value="${materials[i].split(rege2)}"></c:set>
					<p><c:forEach var="j" begin="0" end="${fn:length(material) - 1}">
						${material[j].replace(', ', ' ')}
						<c:if test="${j < (fn:length(material)-1)}">,</c:if> 
					</c:forEach></p>
					<br>
				</c:forEach>
			</div>
			<c:if test="${!empty rvo.recipe_video}">
				<div id="video">
					<p id="video-label">동영상</p>
					<c:set var="videourl" value="${rvo.recipe_video}"></c:set>
					<c:set var="vidindex" value="${videourl.lastIndexOf('/')}"></c:set>
					<c:set var="vidleng" value="${fn:length(videourl)}"></c:set>
					<c:set var="videoval" value="${fn:substring(videourl,vidindex + 1,vidleng)}"></c:set>
					<div id="play-video">
						<iframe width="700" height="395" src="https://www.youtube.com/embed/${videoval}"></iframe>
					</div>
				</div>
			</c:if>
			<div id="order">
				<h2>조리순서</h2>
				<c:set var="orders" value="${rvo.orderContent.replace('[|', '').replace('|]', '').split(rege2)}"></c:set>
				<c:forEach var="i" begin="0" end="${fn:length(orders) - 1}">
					<c:set var="order" value="${orders[i].split(', ')}"></c:set>
					<div class="order-content">
						<div class="order-number"><p>${i + 1}</p></div>
						<div class="order-text"><pre>${order[0]}</pre></div>
						<div class="order-img">
							<c:if test="${!empty order[1]}">
								<img src="${order[1]}">
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="view-recipe-foot">
			<c:if test="${!empty rvo.finImage}">
				<c:set var="finImage" value="${rvo.finImage.replace('[', '').replace(']', '').split(', ')}"></c:set>
				<div id="comp">
					<div id="comp-left">
						<i class="fas fa-angle-left"></i>
					</div>
					<div id="comp-image-wrap">
						<div id="comp-image-pack">
							<c:forEach var="k" items="${finImage}">
								<div class="comp-image"><img src="${k}"></div>
							</c:forEach>
						</div>
					</div>
					<div id="comp-right">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>	
			</c:if>
			<c:if test="${!empty rvo.recipe_tip}">
				<div id="tip">
					<span id="tip-label"># 팁 / 주의사항</span>
					<pre>${rvo.recipe_tip}</pre>
				</div>
			</c:if>
			<c:if test="${!empty rvo.recipe_tag}">
				<c:set var="tags" value="${rvo.recipe_tag.split(', ')}"></c:set>
				<div id="tag">
					<span id="tag-label">태그 <i class="far fa-hand-point-right"></i></span>
					<c:forEach var="k" items="${tags}">
						<span class="tag">#${k}</span>
					</c:forEach>
				</div>
			</c:if>
			<div id="dateinfo">
				<span id="regdate">등록일 : ${rvo.regdate.substring(0,10)}</span>
				<span id="datebar">|</span>
				<span id="lastedit">수정일 : ${rvo.lastedit.substring(0,10)}</span>
				<span id="warning"><i class="fas fa-ban"></i>저작자의 사전 동의 없이 이미지 및 문구의 무단 도용 및 복제를 금합니다.</span>
			</div>
		</div>
	</div>
	<div id="comment">
		<div id="com-label"><h2>댓글<span id="com-count"></span></h2></div>
		<div id="rep-modal">
			<div id="rep-modal-content">
				<div id="rep-noti"><span id="rep-text">신고사유를 선택해주세요.</span><i class="fas fa-times"></i></div>
				<div id="rep-sel">
					<ul id="rep-form">
						<li><input type="radio" name="rep-rea" value="1">광고/홍보
						<li><input type="radio" name="rep-rea" value="2">음란/선정성
						<li><input type="radio" name="rep-rea" value="3">욕설/비방
						<li><input type="radio" name="rep-rea" value="4">안 맞는 글
						<li><input type="radio" name="rep-rea" value="5">도배글
						<li><input type="radio" name="rep-rea" value="6">중복글
						<li><input type="radio" name="rep-rea" value="7">저작권 위배
						<li><input type="radio" name="rep-rea" value="8">개인정보 노출
						<li><input type="radio" name="rep-rea" value="9">기타
						<li id="rep-hid"><input type="text" name="rep-etc">
						<input type="hidden" name="rep-tg">
					</ul>
				</div>
				<div id="rep-button">
					<span id="rep-submit">확인</span><span id="rep-cancel">취소</span>
				</div>
			</div>
		</div>
		<div id="comlist">
			
		</div>
		<div id="comwrite">
			<form id="comform">
				<textarea id="comtext" name="content_" placeholder="무엇이 궁금하신가요? 댓글을 남겨주세요."></textarea><span id="combutton">등록</span>
				<input type="hidden" name="r_idx" value="${rvo.r_idx}">
			</form>
		</div>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
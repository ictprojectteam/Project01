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
	body, html{
	width: 100%;
	height: 100%;
	overflow: hidden;
	}
	
	*{
		margin: 0;
		padding: 0;
		font-family: monospace;
		box-sizing: border-box;
		transition: all ease-in-out .2s;
	}
	
	#container{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #f7f7f7;
	overflow: auto;
	}
	
	#main{
		margin-left: 16em;
		margin-top: 5em;
	}
	
	#title{
		font-size: 1.7em;
		margin-left: 1em;
	}
	
	#table{
		margin-top: 1em;
		border: 1px solid #999;
		width: 1200px; 
	}
	
	.regular{
		display: grid;
		grid-template-columns: 150px 450px 150px 450px;
	}
	
	.one{
		display: grid;
		grid-template-columns: 150px 1050px;
	}
	.quad{
		display: grid;
		grid-template-columns: 150px 150px 150px 150px 150px 150px 150px 150px;
	}
	.tri{
		display: grid;
		grid-template-columns: 150px 250px 150px 250px 150px 250px;
	}
	
	.label{
		background: #bbb;
		padding: 5px;
		border: 1px solid #999;
	}
	
	.content{
		border: 1px solid #999;
		padding: 5px;
		font-weight: bold;
		color: #999999;
	}
	
	.content-detail{
		width: 1100px;
		margin: 10px auto;
	}
	
	#inf-box{
		border: 0.5px solid #999;
	}
	
	#inf-title{
		border: 0.5px solid #999;
		border-radius: 8px;
		background: #bbb;
		margin: 5px;
		padding: 5px; 
	}
	
	#inf-content{
		margin: 5px;
		padding: 0px 10px;
	}
	
	#div-box{
		display: grid;
		grid-template-columns: 500px 500px;
		grid-column-gap: 40px;
		border: 0.5px solid #999;
		margin-top: 5px;
	}
	
	.ing{
		margin: 5px 10px;
	}
	
	.ing-title{
		border: 1px solid #999;
		background: #bbb;
		display: inline-block;
		width: 120px;
		border-radius: 5px;
		padding: 5px;
		text-align: center;
	}
	.ing p{
		border-bottom: 0.5px solid #999;
		text-align: center;
		margin-top: 3px;
	}
	
	#step{
		margin-top: 5px;
		border: 0.5px solid #999;
	}
	
	.step-each{
		display: grid;
		grid-template-columns: 100px 850px;
		margin-top: 5px;
		margin-left: 10px;
		margin-right: 15px;
		border: 0.5px solid #999;
		border-radius: 8px;
	}
	
	.step-title{
		border: 0.5px solid #999;
		background: #bbb;
		border-radius: 8px;
		padding: 25px;
		text-align: center;
	}
	
	.step-content{
		padding-left: 20px;
		padding-top: 5px;
	}
	
	#tag{
		margin-top: 5px;
		border: 0.5px solid #999;
	}
	
	#tag-title{
		border: 0.5px solid #999;
		border-radius: 8px;
		background: #bbb;
		margin: 5px;
		padding: 5px; 
	}
	
	#tag-content{
		margin: 5px;
		padding: 0px 10px;
	}
	
	#ad-memo{
		width: 1150px;
		margin: 5px auto;
	}
	
	.each-memo{
		margin-top: 5px;
		border-bottom: 0.5px solid #999;
	}
	
	.memo-name{
		font-size: 13pt;
		font-weight: bolder;
	}
	
	.memo-date{
		font-size: 8pt;
		margin-left: 10px;
	}
	
	.memo-content{
		margin-top: 5px;
	}
	
	#memo-write{
		width: 1150px;
		margin: 5px auto;
		display: grid;
		grid-template-columns: 1050px 100px;
	}
	
	#memo-write input{
		width: 100%;
		border-radius: 5px 0px 0px 5px;
		border: 1px solid #999;
		padding: 3px;
	}
	
	#ad-memo-write{
		padding: 5px;
		text-align: center;
		background: #bbb;
		border: 0.5px solid #999;
		border-radius: 0px 5px 5px 0px;
	}
	
	#button-bar{
		width: 300px;
		margin: 5px auto;
		display: grid;
		grid-template-columns: 150px 150px 150px;
	}
	#button-bar div{
		cursor: pointer;
	}
	#accept{
		border: 2px solid #44f;
		margin: 5px 20px;
		text-align: center;
		padding: 5px;
		border-radius: 5px;
	}
	
	#deny{
		border: 2px solid #f94;
		margin: 5px 20px;
		text-align: center;
		padding: 5px;
		border-radius: 5px;
	}
	
	#view-recipe{
		border: 2px solid #aaa;
		margin: 5px 20px;
		text-align: center;
		padding: 5px;
		border-radius: 5px;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#accept").on("click", function(){
			location.href = "admin_accept?r_idx=${rvo.r_idx}";
		});
		
		$("#deny").on("click", function(){
			alert("승인 거절 사유 작성 페이지 노출 및 상태 : 승인거절_로 변경")
		});

		$("#ad-memo-write").on("click", function(){
			var r_m_content = $("input[name=ad-note]").val();
			$.ajax({
				url : "ad_memo_write",
				data : {"r_m_content" : r_m_content, "r_idx" : "${rvo.r_idx}"},
				dataType : "text",
				type : "post",
				success : function(data) {
					$("input[name=ad-note]").val("");
					loadMemo();
				},
				error : function(){
					alert("쓰기 실패");
				}
			});
		});
		
		$("#view-recipe").on("click", function(){
			location.href = "view_recipe?rno=${rvo.r_idx}";
		});
		loadMemo();
	});
	
	function loadMemo() {
		$.ajax({
			url : "load_ad_memo",
			data : {"r_idx" : "${rvo.r_idx}"},
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#ad-memo").empty();
				$("#ad-memo").append(data);
			},
			error : function(){
				alert("읽기 실패");
			}
		});
	}
</script>
	
</head>
<body>
	<div id="container">
		<jsp:include page="admin_menu.jsp" />
		<div id="main">
			<p id="title">레시피 관리</p>
			<div id="table">
				<div class="regular">
					<div class="label">회원이름</div>
					<div class="content">${rvo.name}</div>
					<div class="label">이메일</div>
					<div class="content">${rvo.email}</div>
				</div>
				<div class="one">
					<div class="label">레시피 제목</div>
					<div class="content">${rvo.recipe_title}</div>
				</div>
				<div class="regular">
					<div class="label">종류</div>
					<div class="content"></div>
					<div class="label">상태</div>
					<div class="content">
						<c:if test="${rvo.a_permission == 0}">승인대기</c:if>
						<c:if test="${rvo.a_permission == 1}">승인완료</c:if>
					</div>
				</div>
				<div class="regular">
					<div class="label">고유ID</div>
					<div class="content">${rvo.r_idx}</div>
					<div class="label">등록일시</div>
					<div class="content">${rvo.regdate}</div>
				</div>
				<div class="quad">
					<div class="label">종류</div>
					<div class="content">${rvo.ca1}</div>
					<div class="label">상황</div>
					<div class="content">${rvo.ca2}</div>
					<div class="label">방법</div>
					<div class="content">${rvo.ca3}</div>
					<div class="label">재료</div>
					<div class="content">${rvo.ca4}</div>
				</div>
				<div class="tri">
					<div class="label">인원</div>
					<div class="content">${rvo.recipe_quant}</div>
					<div class="label">시간</div>
					<div class="content">${rvo.recipe_time}</div>
					<div class="label">난이도</div>
					<div class="content">${rvo.recipe_difficulty}</div>
				</div>
				<div class="one">
					<div class="label">동영상</div>
					<div class="content">${rvo.recipe_video}</div>
				</div>
				<div class="one">
					<div class="label">사진</div>
					<div class="content"></div>
				</div>
				<div class="label">상세내용</div>
				<div class="content-detail">
					<div id="inf-box">
						<div id="inf-title">요리소개</div>
						<div id="inf-content">
							<pre>${rvo.recipe_introduce}</pre>
						</div>
					</div>
					<div id="div-box">
						<c:set var="pack" value="${rvo.pack.replace('[','').replace(']','').split(', ')}"></c:set>
						<c:set var="rege" value="\|\], \[\|"></c:set>
						<c:set var="materials" value="${rvo.material.replace('[[|', '').replace('|]]', '').split(rege)}"></c:set>
						<c:forEach var="i" begin="0" end="${fn:length(pack) -1}">
							<div class="ing">
								<div class="ing-title">${pack[i]}</div>
								<c:set var="rege2" value="\|, \|"></c:set>
								<c:set var="material" value="${materials[i].split(rege2)}"></c:set>
								<c:choose>
									<c:when test="${fn:length(material) > 1}">
										<c:forEach var="j" begin="0" end="${fn:length(material) - 1}">
											<p>${material[j].replace(', ','')}</p>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>${material[0].replace(', ','')}</p>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
					<div id="step">
						<c:set var="orders" value="${rvo.orderContent.replace('[|', '').replace('|]', '').split(rege2)}"></c:set>
						<c:forEach var="i" begin="0" end="${fn:length(orders) - 1}">
							<c:set var="order" value="${orders[i].split(', ')}"></c:set>
							<div class="step-each">
								<div class="step-title">Step${i+1}</div>
								<div class="step-content"><pre>${order[0]}</pre></div>
							</div>
						</c:forEach>
					</div>
					<div id="tag">
						<div id="tag-title">태그</div>
						<div id="tag-content">#일태그#이태그#삼태그</div>
					</div>
				</div>
				<div class="label">관리자 메모</div>
				<div id="ad-memo">
					<div class="each-memo">
						<div class="memo-title"><span class="memo-name">홍길동</span><span class="memo-date">2019.08.13 15:32</span></div>
						<div class="memo-content">간단한 기록</div>
					</div>
				</div>
				<div id="memo-write">
					<input type="text" name="ad-note">
					<div id="ad-memo-write">입력</div>
				</div>
				
				<div id="button-bar">
					<c:choose>
						<c:when test="${rvo.a_permission != 1}">
							<div id="accept">승인</div>
							<div id="deny">승인거절</div>
						</c:when>
					</c:choose>
					<div id="view-recipe">게시물 보기</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
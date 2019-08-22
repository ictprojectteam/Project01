<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foot - Recently, Company, SNS, Report, Counting</title>
<style type="text/css">
a{
	cursor: pointer;
}
#footer {
	margin: 100px auto 0px;
}
#first-footer {
	width: 1300px;
	margin: auto;
	display: grid;
	grid-template-columns: 400px 550px 350px;
}
#footer-company {
	font-size: 9pt;
	color: #888;
	line-height: 5pt;
}
#footer-link a:link, #footer-link a:visited {
	color: #888;
}
#footer-sns img {
	margin-top: 50px;
	width: 70px;
	height: 70px;
}
#report-content {
	margin-left: 50px;
}
#send-report {
	display: block;
	text-decoration: none;
	font-size: 9pt;
	color: black;
	margin: auto;
	text-align: center;
}
#second-footer {
	background: #fa8;
	width: 100vw;
	min-width: 1320px;
	margin: -8px;
	margin-top: 20px;
}
#second-footer-content {
	width: 1300px;
	display: grid;
	grid-template-columns: 250px 800px 250px;
	height: 170px;
	margin: auto;
}
#footer-logo {
	padding: 40px;
}
#footer-counting {
	display: grid;
	grid-template-columns: auto auto auto;
	grid-template-rows: 100px 70px;
	text-align: center;
	color: #e86;
	font-size: 35pt;
}
#footer-counting i {
	margin-top: 25px;
}
#footer-counting a:link, #footer-counting a:visited {
	color: #e86;
}
#footer-mailto-round {
	padding: 40px;
}
#footer-mailto {
	margin: auto;
	height: 80px;
	width: 80px;
	border-radius: 80px;
	background: #fff;
	color: #d75;
	font-size: 30pt;
	text-align: center;
}
#footer-mailto i {
	margin-top: 20px;
}
.footer-counting-label {
	margin-top: -10px;
	font-size: 9pt;
	color: #eee;
}
.footer-counting-number {
	margin-top: -10px;
	font-size: 16pt;
	color: #dd3;
}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script>
	$(function(){
		$("#send-report").on("click", function(){
			if($("#loginchk").val() != "" && $("#loginchk").val() != null){
				if($("#report-content").val() == ""){
					alert("의견을 입력해주세요.");
				} else {
					$.ajax({
						url : "report",
						data : $("#report-form").serialize(),
						dataType : "text",
						type : "post",
						success : function(data) {
							if (data != 0) {
								alert("의견이 접수되었습니다. 감사합니다.");
								$("#report-content").val("");
							} else {
								alert("쓰기 실패1");
							}
						},
						error : function() {
							alert("쓰기 실패2");
						}
					});
				}
			} else {
				var k = confirm("로그인 후에 이용할 수 있는 기능입니다.\n\n로그인 하시겠습니까?\n");
				if(k) location.href='login';
			}
		});

		$.ajax({
			url : "count_recipe",
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#count").append(data);
			},
			error : function() {
				alert("조회 실패");
			}
		});


		$.ajax({
			url : "month_visitor",
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#visitor").append(data);
			},
			error : function() {
				alert("조회 실패");
			}
		});

		$.ajax({
			url : "sum_hit",
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#hit").append(data);
			},
			error : function() {
				alert("조회 실패");
			}
		});
	});
</script>
</head>
<body>
	<div id="footer">
		<c:choose>
			<c:when test="${!empty recently_list}">
				<div id="recently-recipe">
					<div id="recently-title">최근 본 레시피</div>
					<div id="recently-list">
						<c:forEach var="k" items="${recently_list}">

						</c:forEach>
					</div>
				</div>
			</c:when>
		</c:choose>
		<div id="first-footer">
			<div id="footer-company">
				<p id="footer-link">
					<a href="#" target="_blank">회사소개</a> <span>|</span> <a href="#"
						target="_blank">광고문의</a> <span>|</span> <a href="#"
						target="_blank">개인정보처리방침</a> <span>|</span> <a href="#"
						target="_blank">이용약관</a> <span>|</span> <a href="#"
						target="_blank">고객센터</a>
				<p>
					<br>
				<p>대표 : 강명준 / E: audwns@naver.com / F: 02)114</p>
				<p>서울 마포구 양화로 127 첨단빌딩 7층 ICT 인재개발원</p>
				<p>문의 : 010-1234-4321 (운영시간-오전9:30~오후6:30)</p>
				<br>
				<p>(주)ICT인재개발원 / 사업자등록번호 112-02-12321 / 통신판매업신고</p>
				<p>제 2019-서울마포-0119호 / 벤처기업확인 / 사업자정보확인</p>
				<p>서울지방중소기업청 제 191234321-9-01190호</p>
			</div>
			<div id="footer-sns">
				<a href="https://www.facebook.com/"><img
					src="resources/images/facebook_logo.png"></a> <a
					href="https://www.instagram.com/"><img
					src="resources/images/instagram_logo.jpg"></a> <a
					href="https://www.youtube.com/"><img
					src="resources/images/youtube_logo.png"></a>
			</div>
			<div id="footer-report">
				<form method="post" id="report-form">
					<div>
						<textarea rows="8" cols="35" id="report-content" name="content" placeholder="전하고 싶은 의견을 남겨주세요. 회원님의 의견에 항상 귀 기울이겠습니다."></textarea>
					</div>
					<a id="send-report">의견 제출</a>
				</form>
			</div>
		</div>
		<div id="second-footer">
			<div id="second-footer-content">
				<div id="footer-logo">
					<a href="/"><img src="resources/images/footlogo.png"></a>
				</div>
				<div id="footer-counting">
					<a href="recipe"><i class="fas fa-carrot"></i></a> <i class="fas fa-users"></i> <i class="fas fa-book-reader"></i>
					<div>
						<p class="footer-counting-label">총 레시피수</p>
						<p class="footer-counting-number" id="count"></p>
					</div>
					<div>
						<p class="footer-counting-label">월 방문자수</p>
						<p class="footer-counting-number" id="visitor"></p>
					</div>
					<div>
						<p class="footer-counting-label">총 레시피 조회수</p>
						<p class="footer-counting-number" id="hit"></p>
					</div>
				</div>
				<div id="footer-mailto-round">
					<div id="footer-mailto">
						<i class="fas fa-envelope"></i>
					</div>
				</div>
			</div>
		</div>
		<div id="last-footer"></div>
	</div>
</body>
</html>
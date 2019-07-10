<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foot - Recently, Company, SNS, Report, Counting</title>
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
					<a href="#" target="_blank">회사소개</a>
					<span>|</span>
					<a href="#" target="_blank">광고문의</a>
					<span>|</span>
					<a href="#" target="_blank">개인정보처리방침</a>
					<span>|</span>
					<a href="#" target="_blank">이용약관</a>
					<span>|</span>
					<a href="#" target="_blank">고객센터</a>
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
				<a href="#"><img src="resources/images/facebook_logo.png"></a>
				<a href="#"><img src="resources/images/instagram_logo.jpg"></a>
				<a href="#"><img src="resources/images/youtube_logo.png"></a>
			</div>
			<div id="footer-report">
				<form method="post">
					<div>
						<textarea rows="8" cols="35" id="report-content" placeholder="전하고 싶은 의견을 남겨주세요. 회원님의 의견에 항상 귀 기울이겠습니다."></textarea>
					</div>
					<a href="javascript:send_report(this.form)" id="send-report">의견 제출</a>
				</form>
			</div>
		</div>
		<div id="second-footer">
			<div id="second-footer-content">
				<div id="footer-logo"><a href="javascript:location.href='/'"><img src="resources/images/footlogo.png"></a></div>
				<div id="footer-counting">
					<a href="#"><i class="fas fa-carrot"></i></a>
					<i class="fas fa-users"></i>
					<i class="fas fa-book-reader"></i>
					<div>
						<p class="footer-counting-label">총 레시피수</p>
						<p class="footer-counting-number">2,019</p>
					</div>
					<div>
						<p class="footer-counting-label">월 방문자수</p>
						<p class="footer-counting-number">258,741</p>
					</div>
					<div>
						<p class="footer-counting-label">총 레시피 조회수</p>
						<p class="footer-counting-number">9,842,358</p>
					</div>
				</div>
				<div id="footer-mailto-round">
					<div id="footer-mailto">
						<i class="fas fa-envelope"></i>
					</div>
				</div>
				</div>
		</div>
		<div id="last-footer">
			
		</div>
	</div>
</body>
</html>
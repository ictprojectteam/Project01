<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#inquires_tab{
		width: 900px;
		margin: 20px auto;
		border-bottom: 1px solid;
		min-height: 50px;
		text-align: center;
	}
	.inquires_bt{
		width: 100px;
		border: 1px solid #808080;
		font-size: 12pt;
		background: #dee;
		border-radius: 6px;
		margin: 10px auto;
		padding: 3px 6px;
		display: inline-block;
		text-align: center;
		box-sizing: border-box;
		cursor: pointer;
		float: left;
	}
	.inquires_bt:after{
		clear: both;
	}
	.selected{
		background: #489!important;
		cursor: default!important;
	}
	.inquires_bt:hover {
		background-color: #8cd;
	}
	.write{
		float: right;
		padding: 10px;
		border: 1px solid #aaa;
		border-radius: 5px;
		cursor: pointer;
		background: #fa8;
		display: none;
	}
	.write:after{
		clear: both;
	}
	.notice{
		display: inline-block;
		line-height: 12pt;
		font-size: 9pt;
		color: #aaa;
		text-align: center;
		margin-top: 10px;
	}
	#box{
		text-align: center;
	}
	.title{
		width:900px;
		display: grid;
		grid-template-columns: 120px 500px 160px 120px;
		border: solid #ccc;
		border-width: 1px 0px 0px 1px;
		background: #aaa;
		margin: auto;
	}
	.title div{
		border: solid #ccc;
		border-width: 0px 1px 0px 0px;
		padding: 5px;
	}
	.each-content{
		width: 900px;
		display: grid;
		grid-template-columns: 120px 500px 160px 120px;
		border: solid #ccc;
		border-width: 1px 0px 1px 1px;
		margin: auto;
	}
	.text{
		border: solid #ccc;
		border-width: 0px 1px 0px 0px;
		padding: 5px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".menu_bt").on("click", function(){
			$(".menu_bt:button").css("background-color", "#D9D9D9");
			$(this).css("background-color", "#92895A");
		});
	});

	function go(e) {
		location.href = e;
	}
</script>
</head>
<body>
	<div id="menu">
		<input class="menu_bt" type="button" value="레시피" onclick="go('myRecipe')">
		<input class="menu_bt" type="button" value="요리후기" onclick="go('myReview')">
		<input class="menu_bt" type="button" value="댓글" onclick="go('myComent')">
		<input class="menu_bt" type="button" value="토크" onclick="go('myTalk')">
		<input class="menu_bt" type="button" value="문의" onclick="go('myReport')" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="go('myPrf_update')">
	</div>
	<div id="inquires_tab">
		<span class="inquires_bt selected">문의 내역</span>
		<div class="notice">문의 답변은 이메일로 발송되며 <br> 답변 완료 후 문의사항은 처리 완료로 이동됩니다.</div>
		<span class="write">문의하기</span>
	</div>
	<div id="box">
		<c:choose>
			<c:when test="${empty qlist}">
				표시할 내역이 없습니다.
			</c:when>
			<c:otherwise>
				<div class="title">
					<div>문의 구분</div>
					<div>문의 내용</div>
					<div>등록 일시</div>
					<div>상태</div>
				</div>
				<c:forEach var="k" items="${qlist}">
					<div class="each-content">
						<div class="text">${k.q_def}</div>
						<div class="text">${k.content}</div>
						<div class="text">${k.regdate.substring(0, 16)}</div>
						<c:choose><c:when test="${k.status eq '0'}"><div class="text">처리중</div></c:when><c:otherwise><div class="text">처리완료</div></c:otherwise></c:choose>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
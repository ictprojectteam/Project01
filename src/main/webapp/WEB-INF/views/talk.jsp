<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
table {
	margin: 0 auto;
	display: block;
}

.fs1 {
	width: 700px;
	background-color: #FFA873;
	margin: 0 auto;
}

.bt {
	color: white;
	background-color: #BC602B;
	margin-left: 450px;
	font-size: 1em;
}

#body {
	width: 700px;
	margin: 0 auto;
}

#body h2 {
	text-align: center;
	border: 1px solid #000;
	padding: 0px 10px;
}

#body table {
	margin-top: 5px;
	border: 1px solid #000;
}

#body table .prf_img {
	float: left;
	padding: 30px 20px 30px 20px;
	max-width: 100px;
	max-height: 100px;
	margin: 3px 10px 100px 3px;
	border:  2px solid;
	border-radius: 70px;
	-moz-border-radius: 70px;
	-khtml-border-radius: 70px;
	-webkit-border-radius: 70px;
	text-align: center;
}

#body table .haco {
	float: right;
	width: 100px;
	height: 100px;
	margin: 3px 3px 80px 30px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".bt").on("click", function() {
			location.href = "talk_write";
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<br>
	<br>
	<div>
		<table>
			<fieldset class="fs1">
				ICT레시피 쉐프들의 자유토크 <input class="bt" type="button" value="등록">
			</fieldset>
		</table>
	</div>
	<div id="body">
		<c:if test="${!empty list}">
			<c:forEach var="k" items="${list}">
				<c:choose>
					<c:when test="${k.file_name != null}">
						<table class="content">
							<tr>
								<td class="prf_img">이미지</td>
								<td><header
										style="margin-top: -20px;">
										<h5>${k.name}</h5>
										<h6 style="margin-top: -20px;">${k.regdate}</h6>
									</header>
									<a href="talk_view?t_idx=${k.t_idx}">
									<p style="width: 430px; height: 60px;">${k.content}</p>
									<footer>
									<c:forEach var="i" items="${k.f_arr}">
									<img src="<c:url value='/resources/upload/${i}'/>" style="width:100px; height: 100px;">
									</c:forEach>
									</footer>
									</a>
									</td>
								<td class="haco">
								<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart} 
								<img src="resources/images/talk.png" style="width:30px; height: 30px;"> 0
								</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="content">
							<tr>
								<td class="prf_img">이미지</td>
								<td><header
										style="margin-top: -20px;">
										<h5>${k.name}</h5>
										<h6 style="margin-top: -20px;">${k.regdate}</h6>
									</header>
									<a href="talk_view?t_idx=${k.t_idx}""><p style="width: 430px; height: 100px;">${k.content}</p></a>
									</td>
								<td class="haco">
								<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart} 
								<img src="resources/images/talk.png" style="width:30px; height: 30px;"> 0
								</td>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>































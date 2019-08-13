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
	text-align: center;
}

#body table .haco {
	float: right;
	width: 100px;
	height: 100px;
	margin: 3px 3px 80px 30px;
}
.p{
	width: 100%;
	margin: 0 auto;
}
.paging{
	width: 1200px;
	margin: 10 auto;
	text-align: center;
}
.paging li{
	display: inline-block;
	text-align: center;
}
.now{
	color: red;
	
}
</style>
<script type="text/javascript">
	$(function() {
		$(".bt").on("click", function() {
			if(loginchk()){
				location.href = "talk_write";
			}
		});
	});

	function loginchk(){
		if($("#loginchk").val() == null || $("#loginchk").val() == ""){
			var k = confirm("로그인이 필요한 페이지입니다.\n\n로그인 하시겠습니까?\n");
			if(k) location.href='login';
		} else {
			return true;
		}
	}
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
								<c:if test="${k.prf_img == null}">
									<td class="prf_img">
										<img src="resources/images/no_image.png" style="width:30px; height:30px">
									</td>
								</c:if>
								<td><header
										style="margin-top: -20px;">
										<h5>${k.name}</h5>
										<h6 style="margin-top: -20px;">${k.regdate}</h6>
									</header>
									<footer>
									<a href="talk_view?t_idx=${k.t_idx}&cPage=${pvo.nowPage}">
									<span style="width: 430px; height: 60px;">${k.content}</span>
										<c:forEach var="i" items="${k.f_arr}">
											<img src="<c:url value='/resources/upload/${i}'/>" style="width:100px; height: 100px;">	
										</c:forEach>	
									</a>
									</footer>
									</td>
								<td class="haco">
									<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart} 
									<img src="resources/images/talk.png" style="width:30px; height: 30px;"> ${k.co_count}
								</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="content">
							<tr>
								<c:if test="${k.prf_img == null}">
									<td class="prf_img">
										<img src="resources/images/no_image.png" style="width:30px; height:30px; border: solid;">
									</td>
								</c:if>
									<header style="margin-top: -20px;">
										<h5>${k.name}</h5>
										<h6 style="margin-top: -20px;">${k.regdate}</h6>
									</header>
									<a href="talk_view?t_idx=${k.t_idx}"><span style="display:block; width: 430px; height: 100px;">${k.content}</span></a>
									</td>
								<td class="haco">
									<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart} 
									<img src="resources/images/talk.png" style="width:30px; height: 30px;"> ${k.co_count}
								</td>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</div>
	<div class="p">
		<table>
			<tr>
				<td>
					<ul class="paging">
						<c:choose>
							<c:when test="${pvo.beginBlock <= pvo.pagePerBlock}">
								<li class="disable"style="display: none;"> << </li>
							</c:when>
							<c:otherwise>
								<li><a href="talk?cPage=${pvo.beginBlock - pvo.pagePerBlock}"> << </a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${pvo.beginBlock}" end="${pvo.endBlock}" step="1" var="k">
							<c:if test="${pvo.endBlock > 1}">
							<c:if test="${k==pvo.nowPage}">
								<li class="now">${k}</li>
							</c:if>
							<c:if test="${k != pvo.nowPage}">
								<li class="now"><a href="talk?cPage=${k}">${k}</a></li>
							</c:if>
							</c:if>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pvo.endBlock >= pvo.totalPage}">
								<li class="disable" style="display: none;"> >> </li>
							</c:when>
							<c:otherwise>
								<li><a href="talk?cPage=${pvo.beginBlock + pvo.pagePerBlock}"> >> </a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>































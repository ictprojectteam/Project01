<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
#body {
	width: 700px;
	margin: 30px auto;
}
#body table {
	width: 100%;
	margin-top: 5px;
	border: 1px solid #000;
}
#body table .prf_img {
	float: left;
	padding: 30px 20px 30px 20px;
	max-width: 100px;
	max-height: 100px;
	margin: 3px 10px 100px 3px;
	border:  1px solid;
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
#edit{
	width: 700px;
	height: 100px;
	margin: -30px auto 0px auto;
	border:  1px solid;
}
.edit_b{
	font-size: 10pt;
	border: 1px solid;
	border-radius: 7px;
	padding: 5px;
}
#comment{
	width: 700px;
	height: 100px;
	margin: 0px auto 0px auto;
	border:  1px solid;
}
.co_heart {
	float: left;
	padding: 10px 10px 3px 10px;
	max-width: 100px;
	max-height: 100px;
	margin: 20px 10px 0px 50px;;
	border:  1px solid;
	border-radius: 70px;
}
#co_write{
	margin-top: 15px;
	width: 430px;
	height: 60px;
	border: 1px solid;
	resize: none;
}
#co_ok{
	width: 80px;
	height: 64px;
	margin-top: 15px;
	margin-left: -5px;
	border: 1px solid;
	text-align: center;
}
#co_content{
	width: 700px;
	height: 100px;
	margin: 0px auto 0px auto;
	border:  1px solid;
}
#co_content table .prf_img {
	float: left;
	padding: 20px 10px 20px 10px;
	max-width: 100px;
	max-height: 100px;
	margin: 15px 10px 100px 40px;
	border:  1px solid;
	border-radius: 70px;
	-moz-border-radius: 70px;
	-khtml-border-radius: 70px;
	-webkit-border-radius: 70px;
	text-align: center;
}
#co_content table .co_content{
	resize: none;
	border: none;
	margin-top: 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#co_ok").on("click", function(){
			$("#co_form").attr("action","t_co_write").submit();
		});
	});
	function update_go(){
		location.href = "#";
	};
	function delete_go(){
		location.href = "#";
	};
</script>
	<jsp:include page="head.jsp" />
</head>
<body>
<div id="body">
	<table class="content">
		<tr>
			<td class="prf_img">이미지</td>
			<td>
				<header style="margin-top: -20px;">
					<h5>${tvo.name}</h5>
					<h6 style="margin-top: -20px;">${tvo.regdate}</h6>
				</header>
				<p style="width: 430px; height: 60px;">${tvo.content}</p>
				<c:if test="${tvo.file_name != null}">
					<footer>
						<c:forEach var="i" items="${tvo.f_arr}">
							<img src="<c:url value='/resources/upload/${i}'/>" style="width:100px; height: 100px;">
						</c:forEach>
					</footer>
				</c:if>
			</td>
			<td class="haco">
				<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${tvo.heart} 
				<img src="resources/images/talk.png" style="width:30px; height: 30px;"> 0
			</td>
		</tr>
	</table>
</div>
<div id="edit">
	<table>
		<tr>
			<th></th>
			<th class="edit_b" onclick="update_go()"> 수정 </th>
			<th></th>
			<th class="edit_b" onclick="delete_go()"> 삭제 </th>
			<th style="position: relative; bottom: -70px; left: -70px;">댓글 0</th>
		</tr>
	</table>
</div>
<c:choose>
	<c:when test="${!empty c_list}">
		<div>
			<table>
				<tr>
				</tr>
			</table>
		</div>
	</c:when>
	<c:otherwise>
		<div id="co_content">
			<table>
				<tr>
					<td class="prf_img">이미지</td>
					<td>
						<header style="margin-top:-80px;">
							<p style="margin-top: -20px; font-size: 14pt;">${tvo.name}</p>
							<p style="margin: -37px 0px 0px 60px; font-size: 10pt; color: #747474;">${tvo.regdate}</p>
							<a href="#" style="text-decoration: none;"><p style="margin: -20px 0px 0px 190px; font-size: 12pt; color: #747474;"> | 신고</p></a>
							<textarea rows="3" cols="50" class="co_content" readonly>${tvo.content}</textarea>
						</header>
					</td>
				</tr>
			</table>
		</div>
	</c:otherwise>
</c:choose>
<div id="comment">
	<form method="post" id="co_form">
		<table>
			<tr>
				<td class="co_heart"><img src="resources/images/heart_RED.png" style="width:30px; height:30px;"></td>
				<td>
					<textarea rows="2" cols="30" id="co_write" name="content"></textarea>
					<img src="resources/images/write_bt.png" id="co_ok">
					<input type="hidden" name="t_idx" value="${tvo.t_idx}">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
	<jsp:include page="foot.jsp"></jsp:include>
</html>
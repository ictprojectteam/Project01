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
	table {
		margin: 0 auto;
		display: block;
	}
	.fs1{
		width: 700px;
		background-color: white;
		margin: 0 auto;
	}
	.bt{
		margin-left: 450px;
		font-size: 1em;
	}
	#body {
		width: 700px;
		margin: 0 auto;
	}
	#body h2{
		text-align: center;
		border: 1px solid #000;
		padding: 0px 10px;
	}
	#body table {
	border: 1px solid #000;
	
	}
	#body table #r_list{
	width: 60px;
	height: 60px;
	padding-right: 50px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".bt").on("click",function(){
			location.href = "talk_write";
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<br><br>
	<div>
		<table>
			<fieldset class = fs1>
			ICT레시피 쉐프들의 자유토크
			<input class="bt" type="button" value="등록">
			</fieldset>
		</table>
	</div>
	<div id="body">
		<table>
			<c:choose>
				<c:when test="${false}">
					<tr><td><h2>토크가 존재하지 않습니다 ㅜㅜ</h2></td></tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td id="r_list"><h5>이미지</h5></td>
						<td>이름아아라</td>
					</tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;시간</td></tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>































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
#talk_head{
	margin-top: 30px;
	margin-bottom: 10px;
}
#write_form{
	border: 1px solid #D87A38;
	background-color: #F2C297;
	width: 60%;
	height: 50px;
	margin: 0 auto;
}
#write_text{
	display: inline-block;
	font-size: 18pt;
	font: bold;
	color: #D87A38;
	width: 400px;
	margin: 10px 0px 0px 5px;
}
#write_bt{
	float:right;
	width: 60pt;
	height: 30pt;
	font-size: 1.2em;
	margin: 5px 20px 0px 0px;
	color: white;
	background-color: #6B3915;
	border-radius: 5px;
}
#write_bt:hover{
	background-color: #7F4D29;
}
#talk_body{
	border: 1px solid #FBE0A1;
	width: 60%;
	margin: 0 auto;
}
#user_img{
	float: left;
	border: 1px solid;
	border-radius: 70px;
	width: 60px;
	height: 60px;
	margin: 10px 40px 10px 20px;
}
#talk_content{
	display: block;
	width: 500px;
	height: 60px;
	margin-left: 80px;
	overflow: hidden;
	overflow: auto;
	-ms-overflow-style: none;
}
::-webkit-scrollbar{
	display: none;
}
::-webkit-scrollbar{
	display: none;
}
ul{
	margin-top: 5px;
}
ul li{
	list-style: none;
}
.haco{
	position: relative;
	margin: 5px 5px 0px 0px;
	float: right;
}
.p{
	width: 60%;
	margin: 0 auto;
}
.paging{
	width: 650px;
	margin-top: 20px;
	margin: 20 auto;
	text-align: center;
}
.paging li{
	display: inline-block;
	text-align: center;
}
.now{
	color: red;
}
#talk_body a:link{
	text-decoration: none;
	color: #000000;
}
#talk_body a:visited{
	text-decoration: none;
	color: #000000;
}
#talk_body a:active{
	text-decoration: none;
	color: #000000;
}
#talk_body a:hover{
	text-decoration: none;
	color: #000000;
}
.paging a:link{
	text-decoration: none;
	color: #000000;
}
.paging a:visited{
	text-decoration: none;
	color: #000000;
}
.paging a:active{
	text-decoration: none;
	color: #000000;
}
.paging a:hover{
	text-decoration: none;
	color: #000000;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#write_bt").on("click", function() {
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
	<div id="talk_head">
		<header id="write_form">
		<span id="write_text">ICT레시피 쉐프들의 자유 토크</span>
		<input id="write_bt" type="button" value="등록">
		</header>
	</div>
	<c:if test="${!empty list}">
		<c:forEach var="k" items="${list}">
			<div id="talk_body">
				<img id="user_img" src="resources/images/no_image.png">
				<div class="haco">
					<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart} 
					<img src="resources/images/talk.png" style="width:30px; height: 30px;"> ${k.co_count}
				</div>
				<ul>
					<li>${k.name}</li>
					<li style="font-size: 12pt; color: #BEBEBE">${k.regdate}</li>
					<li style="margin-top: 10px;">
						<span id="talk_content">
							<a href="talk_view?t_idx=${k.t_idx}&cPage=${pvo.nowPage}">${k.content}</a>
						</span>
					</li>
				</ul>
				<c:if test="${k.file_name == null}">
				</c:if>
				<c:if test="${k.file_name != null}">
					<div style="margin-left: 100px;">
						<c:forEach var="i" items="${k.f_arr}">
							<a href="talk_view?t_idx=${k.t_idx}&cPage=${pvo.nowPage}">
							<img src="<c:url value='/resources/upload/${i}'/>" style="width:100px; height: 100px;">
							</a>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</c:if>
	<div class="p">
		<table>
			<tr>
				<td>
					<ul class="paging">
						<c:choose>
							<c:when test="${pvo.beginBlock <= pvo.pagePerBlock}">
								<li class="disable"style="display: none;"></li>
							</c:when>
							<c:otherwise>
								<li><a href="talk?cPage=${pvo.beginBlock - pvo.pagePerBlock}"></a></li>
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
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
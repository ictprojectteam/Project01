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
	height: 60px;
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
#co_heart{
	float: left;
	padding: 10px 10px 3px 10px;
	max-width: 100px;
	max-height: 100px;
	margin: 20px 10px 0px 50px;;
	border:  1px solid;
	border-radius: 70px;
}
#co_heart img{
	width: 30px;
	height: 30px;
	cursor: pointer;
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
	var c_like = new Object();
	c_like.t_idx = "${tvo.t_idx}";
	c_like.id = "${mvo.id}";
	
	$(function(){
		$("#co_ok").on("click", function(){
			$("#co_form").attr("action","t_co_write").submit();
		});

		getLike();
	});

	function getLike() {
		if($("#loginchk").val() == null || $("#loginchk").val() == ""){
			$("#co_heart").html("<img src='resources/images/heart_RED.png' id='like'>");
			$("#like").on("click", t_like);
		} else {
			$.ajax({
				url : "t_com_chklike",
				data : c_like,
				dataType : "text",
				type : "post",
				success : function(data) {
					if (data != 1) {
						$("#co_heart").html("<img src='resources/images/heart_RED.png' id='like'>");
						$("#like").on("click", t_like);
					} else {
						$("#co_heart").html("<img src='resources/images/heart_pull.png' id='unlike'>");
						$("#unlike").on("click", t_unlike);
					}
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		}
		$.ajax({
			url : "t_com_countlike",
			data : c_like,
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#haco").text(data);
			},
			error : function() {
				alert("읽기 실패");
			}
		});
	}
	
	function t_like() {
		if(loginchk()) {
			$.ajax({
				url : "t_com_like",
				data : c_like,
				dataType : "text",
				type : "post",
				success : function(data) {
					getLike();
				},
				error : function() {
					alert("실패2");
				}
			});
		}
	}

	function t_unlike() {
		if(loginchk()){
			$.ajax({
				url : "t_com_unlike",
				data : c_like,
				dataType : "text",
				type : "post",
				success : function(data) {
					getLike();
				},
				error : function() {
					alert("실패");
				}
			});
		}
	}

	function loginchk(){
		if($("#loginchk").val() == null || $("#loginchk").val() == ""){
			var k = confirm("로그인이 필요한 페이지입니다.\n\n로그인 하시겠습니까?\n");
			if(k) location.href='login';
		} else {
			return true;
		}
	}
	
	function update_go() {
		location.href = "#";
	};
	function delete_go() {
		if (confirm("정말 삭제하시겠습니까??") == true){ 
			location.href = "talk_del";
		}else{  
		    return;
		}
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
				<img src="resources/images/heart.png" style="width:30px; height: 30px;"><span id="haco">${tvo.heart}</span>  
				<img src="resources/images/talk.png" style="width:30px; height: 30px;"><span>${tvo.co_count}</span>
			</td>
		</tr>
	</table>
</div>
<div id="edit">
	<table>
		<tr>
			<c:if test="${mvo.m_idx == tvo.m_idx}">
			<th></th>
			<th class="edit_b" onclick="update_go()"> 수정 </th>
			<th></th>
			<th class="edit_b" onclick="delete_go()"> 삭제 </th>
			</c:if>
			<c:if test="${mvo.m_idx != tvo.m_idx}">
			<th></th>
			<th class="edit_b" onclick="delete_go()"> 신고 </th>
			</c:if>
		</tr>
	</table>
</div>
<c:choose>
	<c:when test="${empty c_list}">
	</c:when>
	<c:when test="${!empty c_list}">
	<c:forEach var="k" items="${c_list}">
		<div id="co_content">
			<table>
				<tr>
					<td class="prf_img">이미지</td>
					<td>
						<header style="margin-top:-80px;">
							<p style="margin-top: -20px; font-size: 14pt;">${k.name}</p>
							<p style="margin: -37px 0px 0px 60px; font-size: 10pt; color: #747474;">${k.regdate}</p>
							<c:if test="${k.m_idx != mvo.m_idx}">
							<a href="#" style="text-decoration: none;"><p style="margin: -20px 0px 0px 190px; font-size: 12pt; color: #747474;"> | 신고</p></a>
							</c:if>
							<c:if test="${k.m_idx == mvo.m_idx}">
							<a href="#" style="text-decoration: none;"><p style="margin: -20px 0px 0px 190px; font-size: 12pt; color: #747474;"> | 수정 </p></a>
							<a href="#" style="text-decoration: none;"><p style="margin: -19px 0px 0px 230px; font-size: 12pt; color: #747474;"> | 삭제 </p></a>
							</c:if>
							<textarea rows="3" cols="50" class="co_content" readonly>${k.content}</textarea>
						</header>
					</td>
				</tr>
			</table>
		</div>
		</c:forEach>
	</c:when>
</c:choose>
<div id="comment">
	<form method="post" id="co_form">
		<table>
			<tr>
				<td id="co_heart">
					
				</td>
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
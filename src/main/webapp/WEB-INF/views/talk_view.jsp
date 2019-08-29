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
	margin: 3px 10px 100px 3px;
}
.user-img{
	border-radius: 70px;
	border: 1px solid #333;
	width: 60px;
	height: 60px;
}
.t_content{
	white-space: pre-wrap;
	word-wrap: break-word;
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
#edit li{
	margin-top: 10px;
}
#edit_bt{
	list-style: none;
	display: inline-block;
	margin: 0px 0px 0px -30px;
}
#edit_bt li{
	float: left;
	
}
.edit_b{
	font-size: 10pt;
	border: 1px solid;
	border-radius: 7px;
	padding: 5px;
	cursor: pointer;
	margin-right: 3px;
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
	margin: 15px 10px 100px 40px;
}
#co_content table .co_content{
	resize: none;
	border: none;
	margin-top: 10px;
	white-space: pre-wrap;
	word-wrap: break-word;
	display: -webkit-box;
}
#shares{
	list-style: none;
	display: inline;
}
#shares li{
	float: right;
}
.share_img{
	border-radius: 70px;
	margin-right: 3px;
}
.preview{
	display: block;
	margin-bottom: 10px;
}
#rep-modal{
		z-index:3;
		display:none;
		padding-top:100px;
		position:fixed;
		left:0;
		top:0;
		width:100%;
		height:100%;
		overflow:auto;
		background-color: #0000;
	}
	
	#rep-modal-content{
		margin:auto;
		background-color:#fff;
		position:relative;
		padding:0;
		outline:0;
		width:350px;
		border: 1px solid #aaa;
		animation: animatetop 0.4s;
		border-radius: 15px;
	}
	@keyframes animatetop{
		from{top:-300px;opacity:0}
		to{top:0;opacity:1}
	}
#rep-noti{
		display: grid;
		grid-template-columns: 300px 50px;
		padding: 13px;
		border-bottom: 0.5px solid #888;
	}
#rep-text{
		font-size: 12pt;
		font-weight: bolder;
	}
	
	#rep-noti .fa-times{
		font-size: 22pt;
		cursor: pointer;
		color: #bbb;
	}
	
	#rep-form{
		list-style: none;
		padding: 0 0 10px 0;
	}
	
	#rep-form li{
		padding: 6px 12px;
		font-size: 9pt;
	}
	
	#rep-hid{
		display: none;
	}
	
	input[name=rep-etc]{
		width: 95%;
		padding: 5px;
		border: 1px solid #aaa;
		border-radius: 5px;
	}
	
	#rep-button{
		text-align: center;
		margin: 30px 0px;
	}
	
	#rep-button span{
		cursor: pointer;
		font-size: 12pt;
		margin-top: 15pt;
		padding: 10px 30px;
		border-radius: 5px;
		margin: 5px;
		font-weight: bolder;
	}
	
	#rep-submit{
		border: 1px solid #d86;
		background: #fa8;
		color: #eee;
	}
	
	#rep-submit:hover{
		background: #e97;
	}
	
	#rep-cancel{
		border: 1px solid #999;
		color: #222;
	}
</style>
<script type="text/javascript">
	var c_like = new Object();
	var cPage = "${cPage}";
	c_like.t_idx = "${tvo.t_idx}";
	c_like.id = "${mvo.id}";
	
	$(function(){
		$("#co_ok").on("click", function(){
			if(loginchk()){
				if($("#co_write").val() != ""){
					$("#co_form").attr("action","t_co_write").submit();
				}else{
					alert("내용이 없습니다");
				}
			}
		});
		getLike();

		$("input[name=rep-rea]").on("change", function(){
			if($(this).val() == 9){
				$("#rep-hid").css("display", "block");
			} else {
				$("#rep-hid").css("display", "none");
			}
		});

		$("#rep-noti .fa-times").on("click", function(){
			$("#rep-modal").css({"display":"none"});
			$("#rep-hid").css("display", "none").find("input").val("");
			$("input[name=rep-rea]").attr("checked", "false").removeAttr("checked");
		});

		$("#rep-cancel").on("click", function(){
			$("#rep-modal").css({"display":"none"});
			$("#rep-hid").css("display", "none").find("input").val("");
			$("input[name=rep-rea]").attr("checked", "false").removeAttr("checked");
		});

		$("#rep-submit").on("click", function(){
			var rea = $("input[name=rep-rea]:checked").val();
			var etc = $("input[name=rep-etc]").val();
			var tg = $("input[name=rep-tg]").val();
			if (rea == undefined) {
				alert("신고사유를 선택해주세요.");
			} else if(rea == 9 && etc == "") {
				alert("기타사유를 입력해주세요.");
			} else {
				$.ajax({
					url : "rep_com_recipe",
					data : {"rea" : rea, "etc" : etc, "tg" : tg},
					dataType : "text",
					type : "post",
					success : function(data) {
						if (data != 0) {
							alert("신고가 접수되었습니다.");
							$("#rep-modal").css({"display":"none"});
							$("#rep-hid").css("display", "none").find("input").val("");
							$("input[name=rep-rea]").attr("checked", "false").removeAttr("checked");
						} else {
							alert("쓰기 실패1");
						}
					},
					error : function() {
						alert("쓰기 실패2");
					}
				});
			}
		});

		$(".tag").on("click", function(){
			var text = $(this).text().replace("#", "");
			location.href = "recipe?k=" + text;
		});

		$(this).on("click", function(){
			if(event.target == document.getElementById("rep-modal")) $("#rep-modal").css({"display":"none"});
		});
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
	function talk_go() {
		location.href = "talk?cPage="+cPage;
	};
	function update_go() {
		location.href = "talk_update";
	};
	function delete_go() {
		if (confirm("정말 삭제하시겠습니까??") == true){ 
			location.href = "talk_del";
		}else{  
		    return;
		}
	};
	function report(){
		$("#rep-modal").css("display", "block");
	}
	function com_rep(n) {
		$("#rep-modal").css("display", "block");
		$("#rep-form input[name=rep-tg]").val("${tvo.t_idx}" + ", " + n);
	}
</script>
	<jsp:include page="head.jsp" />
</head>
<body>
<div id="body">
	<table class="content">
		<tr>
			<td class="prf_img">
				<c:choose>
					<c:when test="${empty tvo.prf_img}"><img class="user-img" src="resources/images/no_image.png"></c:when>
					<c:otherwise><img class="user-img" src="${tvo.prf_img}"></c:otherwise>
				</c:choose>
			</td>
			<td>
				<header style="margin-top: -20px;">
					<h5>${tvo.name}</h5>
					<h6 style="margin-top: -20px;">${tvo.regdate}</h6>
				</header>
				<pre class="t_content" style="width: 450px;">${tvo.content}</pre>
				<c:if test="${tvo.file_name != null}">
					<footer>
						<c:forEach var="i" items="${tvo.f_arr}">
							<img class="preview" src="<c:url value='/resources/upload/${i}'/>" style="width:450px; height: 450px;">
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
	<ul id="edit_bt">
		<c:if test="${mvo.m_idx == tvo.m_idx}">
			<li class="edit_b" onclick="talk_go()"> 목록 </li>
			<li class="edit_b" onclick="update_go()"> 수정 </li>
			<li class="edit_b" onclick="delete_go()"> 삭제 </li>
		</c:if>
		<c:if test="${mvo.m_idx != tvo.m_idx}">
			<li class="edit_b" onclick="talk_go()"> 목록 </li>
			<li class="edit_b" onclick="report()"> 신고 </li>
		</c:if>
	</ul>
	<ul id="shares">
		<li>
			<a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;" target="_blank" >
			<img src="resources/images/sns_kakao.png" width="30" class="share_img" alt="카스 공유하기"></a>
		</li>
		<li>
			<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" >
			<img src="resources/images/sns_face.png" width="30" class="share_img" alt="페이스북 공유하기"></a>
		</li>
		<li>
			<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank">
			<img src="resources/images/sns_tw.png" width="30" class="share_img" alt="트위터 공유하기"></a>
		</li>
	</ul>
</div>
<c:choose>
	<c:when test="${empty c_list}">
	</c:when>
	<c:when test="${!empty c_list}">
	<c:forEach var="k" items="${c_list}">
		<div id="co_content">
			<table>
				<tr>
					<td class="prf_img">
						<c:choose>
							<c:when test="${empty k.prf_img}"><img class="user-img" src="resources/images/no_image.png"></c:when>
							<c:otherwise><img class="user-img" src="${k.prf_img}"></c:otherwise>
						</c:choose>
					</td>
					<td>
						<header style="margin-top:-80px;">
							<p style="margin-top: -20px; font-size: 14pt;">${k.name}</p>
							<p style="margin: -37px 0px 0px 60px; font-size: 10pt; color: #747474;">${k.regdate}</p>
							<c:if test="${k.m_idx != mvo.m_idx}">
							<p style="margin: -20px 0px 0px 190px; font-size: 12pt; color: #747474;"><a onclick="report()" style="text-decoration: none;"> | 신고</a></p>
							</c:if>
							<c:if test="${k.m_idx == mvo.m_idx}">
							<a href="#" style="text-decoration: none;"><p style="margin: -20px 0px 0px 190px; font-size: 12pt; color: #747474;"> | 수정 </p></a>
							<a href="talk_c_del?t_c_idx=${k.t_c_idx}" style="text-decoration: none;"><p style="margin: -19px 0px 0px 230px; font-size: 12pt; color: #747474;"> | 삭제 </p></a>
							</c:if>
							<pre class="co_content">${k.content}</pre>
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
<div id="rep-modal">
			<div id="rep-modal-content">
				<div id="rep-noti"><span id="rep-text">신고사유를 선택해주세요.</span><i class="fas fa-times"></i></div>
				<div id="rep-sel">
					<ul id="rep-form">
						<li><input type="radio" name="rep-rea" value="1">광고/홍보
						<li><input type="radio" name="rep-rea" value="2">음란/선정성
						<li><input type="radio" name="rep-rea" value="3">욕설/비방
						<li><input type="radio" name="rep-rea" value="4">안 맞는 글
						<li><input type="radio" name="rep-rea" value="5">도배글
						<li><input type="radio" name="rep-rea" value="6">중복글
						<li><input type="radio" name="rep-rea" value="7">저작권 위배
						<li><input type="radio" name="rep-rea" value="8">개인정보 노출
						<li><input type="radio" name="rep-rea" value="9">기타
						<li id="rep-hid"><input type="text" name="rep-etc">
						<input type="hidden" name="rep-tg">
					</ul>
				</div>
				<div id="rep-button">
					<span id="rep-submit">확인</span><span id="rep-cancel">취소</span>
				</div>
			</div>
		</div>
</body>
	<jsp:include page="foot.jsp"></jsp:include>
</html>
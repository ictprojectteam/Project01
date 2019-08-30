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
	.talk{
		width: 900px;
		margin: 10px auto;
	}
	.each-talk{
		display: grid;
		grid-template-columns: 130px 770px;
		cursor: pointer;
	}
	.image{
		padding: 5px;
		width: 120px;
		height: 120px;
		border-radius: 60px;
	}
	.talk-box{
		margin-left: 20px;
		padding-top: 10px;
	}
	.talk-head{
		display: grid;
		grid-template-columns: 620px 150px;
	}
	.talk-writer{
		font-size: 20pt;
		color: #8af;
		font-weight: bolder;
	}
	.talk-date{
		color: #aaa;
	}
	.talk-content{
		font-size: 16pt;
		margin-top: 10px;
		max-height: 4.8em;
		white-space: pre-wrap;
		word-wrap: break-word;
		display: -webkit-box;
		overflow: hidden;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		padding-right: 60px;
	}
	.paging{
		width: 1000px;
		text-align: center;
		margin: 5px auto;
	}
	
	.now{
		margin-right: 8px;
		padding: 3px 7px;
		border: 1px solid #d86;
		background: #fa8;
		color: white;
		font-weight: bold;
	}
	
	.page{
		padding: 3px 7px;
		color: #2f313e;
		font-weight: bold;
	}
	
	.page:hover{
		background: #00B3DC;
		color: white;
		font-weight: bold;
		cursor: pointer;
	}
	
	.disable{
		padding: 3px 7px;
		visibility:hidden;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".menu_bt").on("click", function(){
			$(".menu_bt:button").css("background-color", "#D9D9D9");
			$(this).css("background-color", "#92895A");
		});

		$(".page").on("click", function(){
			var p = $(this).text();
			location.href = "myTalk?cPage=" + p;
		});
	});
	
	function go(e) {
		location.href = e;
	}

	function view(e) {
		location.href = 'talk_view?t_idx=' + e;
	}
</script>
</head>
<body>
	<div id="menu">
		<input class="menu_bt" type="button" value="레시피" onclick="go('myRecipe')">
		<input class="menu_bt" type="button" value="요리후기" onclick="go('myReview')">
		<input class="menu_bt" type="button" value="댓글" onclick="go('myComent')">
		<input class="menu_bt" type="button" value="토크" onclick="go('myTalk')" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="문의" onclick="go('myReport')">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="go('myPrf_update')">
	</div>
	<div class="talk">
		<c:forEach var="k" items="${tlist}">
			<div class="each-talk" onclick="view(${k.t_idx})">
				<c:choose>
					<c:when test="${empty k.prf_img}">
						<img src="resources/images/no_image.png" class="image">
					</c:when>
					<c:otherwise>
						<img src="${k.prf_img}" class="image">
					</c:otherwise>
				</c:choose>
				<div class="talk-box">
					<div class="talk-head">
						<div class="talk-writer">${k.name}</div>
						<div class="talk-info">
							<img src="resources/images/heart.png" style="width:30px; height: 30px;"> ${k.heart}
							<img src="resources/images/talk.png" style="width:30px; height: 30px;"> ${k.co_count}
						</div>
					</div>
					<div class="talk-date">${k.regdate.substring(0, 16)}</div>
					<div><pre class="talk-content">${k.content}</pre></div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="paging">
		<c:choose>
	    	<c:when test="${tp.beginBlock <= tp.pagePerBlock}">
	    		<span class="disable"> 이전으로 </span>
	    	</c:when>
	    	<c:otherwise>
	    		<span class="prev-block">이전으로</span>
	    	</c:otherwise>
	    </c:choose>
	    
		<c:forEach begin="${tp.beginBlock}" end="${tp.endBlock}" step="1" var="k">
			<c:if test="${k==tp.nowPage}">
				<span class="now">${k}</span>
			</c:if>
			<c:if test="${k!=tp.nowPage}">
				<span class="page">${k}</span>
			</c:if>
		</c:forEach>
		
		<c:choose>
	    	<c:when test="${tp.endBlock >= tp.totalPage }">
	    		<span class="disable"> 다음으로 </span>
	    	</c:when>
	    	<c:otherwise>
	    		<span class="next-block">다음으로</span>
	    	</c:otherwise>
	    </c:choose>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
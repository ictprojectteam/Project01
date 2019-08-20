<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe</title>
<style type="text/css">
#recipebody {
	width: 1200px;
	margin: 30px auto 0px;
}

/* ======================================== 카테고리 ========================================== */
#category {
	margin-top: -10px;
	display: grid;
	grid-template-columns: 100px 1000px;
}

.category-group-label {
	height: 20px;
	padding-top: 5px;
	text-align: center;
	border: 1px solid #fa8;
	margin: 15px 20px;
	border-radius: 25px;
	color: #fa8;
	font-size: 9pt;
}

#category-detail a {
	display: inline-block;
	margin: -3px;
	cursor: pointer;
	font-size: 9pt;
	border-radius: 5px;
	padding: 4px;
}

.category-detail-label {
	margin: 15px 20px;
	padding-top: 3px;
	height: 22px;
}

.category-detail-label a:link, .category-detail-label a:visited {
	text-decoration: none;
	font-size: 9pt;
	margin-left: 10px;
	color: #555;
}

.category-detail-label a:hover {
	color: #fb9;
}

#category-label {
	margin: 20px auto;
	color: #fa8;
}

.category-selected {
	background: #fa8;
	color: #eee;
}
/* ======================================== 레시피리스트 ========================================== */
#recipe-list {
	
}

#recipe-internal {
	display: grid;
	grid-template-columns: 290px 290px 290px 290px;
	grid-gap: 13px;
}

.recipe-list-preview {
	height: 400px;
	margin-top: 20px;
	cursor: pointer;
}

.recipe-preview-image img {
	width: 290px;
	height: 210px;
}

.recipe-preview-subject {
	margin: 10px 5px 0px;;
	font-size: 15pt;
	color: #444;
	height: 50px;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}

.recipe-preview-writer {
	margin: 20px 5px 0px;
	font-size: 12pt;
	color: #888;
	text-align: right;
}
/* #recipe-paging{
		width: 500px;
		margin: 20px auto;
		border: 1px solid blue;
		text-align: center;
		background: #fa8;
	} */
#recipe-paging {
	width: 1000px;
	text-align: center;
	margin: 5px;
}

#recipe-paging .now {
	margin-right: 8px;
	padding: 3px 7px;
	border: 1px solid #d86;
	background: #fa8;
	color: white;
	font-weight: bold;
}

#recipe-paging [class^=page] {
	padding: 3px 7px;
	color: #2f313e;
	font-weight: bold;
}

#recipe-paging [class^=page]:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

.disable {
	padding: 3px 7px;
	visibility:hidden;
}

.recipe-list-preview:hover img {
	opacity: 0.5;
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$(".recipe-list-preview").on("click", function(){
			var rno = $(this).find("input").val();
			location.href = 'view_recipe?rno=' + rno;
		});
		$(".category-detail-label").each(function(){
			$(this).children().each(function(){
				$(this).on("click", function(){
					var tex = $(this).text();
					var group = $(this).parent().attr("id");
					if(tex == "전체") tex = "";
					$("input[name=" + group + "]").val(tex);
					$("#list-form").attr("action", "recipe").submit();
				});
			});
		});

		$("[class^=page]").on("click", function(){
			var p = $(this).text();
			var l = window.location.href;
			if (l.match(/cPage/)) {
				l = l.substring(0, l.length - 1);
				l = l + p;
			} else if (l.match(/\?/)) {
				l = l + "&cPage=" + p;
			} else {
				l = l + "?cPage=" + p;
			}
			location.href = l;
		});

		ca_adc("ca1");
		ca_adc("ca2");
		ca_adc("ca3");
		ca_adc("ca4");
	});
	function ca_adc(e){
		var eval = $("input[name=" + e + "]").val();
		if(eval != ""){
			$("#" + e).find("a").each(function(){
				if($(this).text() == eval) $(this).addClass("category-selected");
			});
		} else {
			$("#" + e + " a:first-child").addClass("category-selected");
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="recipebody">
		<div id="category-label">
			카테고리<i class="fas fa-angle-double-down"></i>
		</div>
		<form id="list-form">
			<input type="hidden" name="ca1" value="${ca1}">
			<input type="hidden" name="ca2" value="${ca2}">
			<input type="hidden" name="ca3" value="${ca3}">
			<input type="hidden" name="ca4" value="${ca4}">
			<input type="hidden" name="order">
			<input type="hidden" name="k" value="${k}">
		</form>
		<div id="category">
			<div id="category-group">
				<div class="category-group-label">종류별</div>
				<div class="category-group-label">상황별</div>
				<div class="category-group-label">재료별</div>
				<div class="category-group-label">방법별</div>
			</div>
			<div id="category-detail">
				<div class="category-detail-label" id="ca1">
					<a class="category-detail-group1">전체</a>
					<a class="category-detail-group1">밑반찬</a>
					<a class="category-detail-group1">메인반찬</a>
					<a class="category-detail-group1">국/탕</a>
					<a class="category-detail-group1">찌개</a>
					<a class="category-detail-group1">디저트</a>
					<a class="category-detail-group1">면/만두</a>
					<a class="category-detail-group1">밥/죽/떡</a>
					<a class="category-detail-group1">퓨전</a>
					<a class="category-detail-group1">김치/젓갈/장류</a>
					<a class="category-detail-group1">양념/소스/잼</a>
					<a class="category-detail-group1">양식</a>
					<a class="category-detail-group1">샐러드</a>
					<a class="category-detail-group1">스프</a>
					<a class="category-detail-group1">빵</a>
					<a class="category-detail-group1">과자</a>
					<a class="category-detail-group1">차/음료/술</a>
					<a class="category-detail-group1">기타</a>
				</div>
				<div class="category-detail-label" id="ca2">
					<a class="category-detail-group2">전체</a>
					<a class="category-detail-group2">일상</a>
					<a class="category-detail-group2">초스피드</a>
					<a class="category-detail-group2">손님접대</a>
					<a class="category-detail-group2">술안주</a>
					<a class="category-detail-group2">다이어트</a>
					<a class="category-detail-group2">도시락</a>
					<a class="category-detail-group2">영양식</a>
					<a class="category-detail-group2">간식</a>
					<a class="category-detail-group2">야식</a>
					<a class="category-detail-group2">푸드스타일링</a>
					<a class="category-detail-group2">해장</a>
					<a class="category-detail-group2">명절</a>
					<a class="category-detail-group2">이유식</a>
					<a class="category-detail-group2">기타</a>
				</div>
				<div class="category-detail-label" id="ca4">
					<a class="category-detail-group3">전체</a>
					<a class="category-detail-group3">소고기</a>
					<a class="category-detail-group3">돼지고기</a>
					<a class="category-detail-group3">닭고기</a>
					<a class="category-detail-group3">육류</a>
					<a class="category-detail-group3">채소류</a>
					<a class="category-detail-group3">해물류</a>
					<a class="category-detail-group3">달걀/유제품</a>
					<a class="category-detail-group3">가공식품류</a>
					<a class="category-detail-group3">쌀</a>
					<a class="category-detail-group3">밀가루</a>
					<a class="category-detail-group3">건어물류</a>
					<a class="category-detail-group3">버섯류</a>
					<a class="category-detail-group3">과일류</a>
					<a class="category-detail-group3">콩/견과류</a>
					<a class="category-detail-group3">곡류</a>
					<a class="category-detail-group3">기타</a>
				</div>
				<div class="category-detail-label" id="ca3">
					<a class="category-detail-group4">전체</a>
					<a class="category-detail-group4">볶음</a>
					<a class="category-detail-group4">끓이기</a>
					<a class="category-detail-group4">부침</a>
					<a class="category-detail-group4">조림</a>
					<a class="category-detail-group4">무침</a>
					<a class="category-detail-group4">비빔</a>
					<a class="category-detail-group4">찜</a>
					<a class="category-detail-group4">절임</a>
					<a class="category-detail-group4">튀김</a>
					<a class="category-detail-group4">삶기</a>
					<a class="category-detail-group4">굽기</a>
					<a class="category-detail-group4">데치기</a>
					<a class="category-detail-group4">회</a>
					<a class="category-detail-group4">기타</a>
				</div>
			</div>
		</div>
		
		<div id="recipe-list">
			<div id="recipe-internal">
				<c:choose>
					<c:when test="${empty r_list})">
						<h2>표시할 내용이 없습니다.</h2>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${r_list}">
							<div class="recipe-list-preview">
								<input type="hidden" value="${k.r_idx}">
								<div class="recipe-preview-image"><img src="${k.main_image}"></div>
								<div class="recipe-preview-subject">${k.recipe_title}</div>
								<div class="recipe-preview-writer">by ${k.writer}</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="recipe-paging">
			    <c:choose>
			    	<c:when test="${rp.beginBlock <= rp.pagePerBlock}">
			    		<span class="disable"> 이전으로 </span>
			    	</c:when>
			    	<c:otherwise>
			    		<span class="prev-block">이전으로</span>
			    	</c:otherwise>
			    </c:choose>
			    
				<c:forEach begin="${rp.beginBlock}" end="${rp.endBlock}" step="1" var="k">
					<c:if test="${k==rp.nowPage}">
						<span class="now">${k}</span>
					</c:if>
					<c:if test="${k!=rp.nowPage}">
						<span class="page${k}">${k}</span>
					</c:if>
				</c:forEach>
				
				<c:choose>
			    	<c:when test="${rp.endBlock >= rp.totalPage }">
			    		<span class="disable"> 다음으로 </span>
			    	</c:when>
			    	<c:otherwise>
			    		<span class="next-block">다음으로</span>
			    	</c:otherwise>
			    </c:choose>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#recipebody{ 
	}
	
/* ======================================== 카테고리 ========================================== */
	#category{
		margin-top: -10px;
		display: grid;
		grid-template-columns: 100px 1000px;
	}
	.category-group-label{
		height: 20px;
		padding-top: 5px;
		text-align: center;
		border: 1px solid #fa8;
		margin: 15px 20px;
		border-radius: 25px;
		color: #fa8;
		font-size: 9pt;
	}
	.category-detail-label{
		margin: 15px 20px;
		padding-top: 3px;
		height: 22px;
	}
	.category-detail-label a:link, .category-detail-label a:visited{
		text-decoration: none;
		font-size: 9pt;
		margin-left: 10px;
		color: #555;
	}
	.category-detail-label a:hover{
		color: #fb9;
	}
	#category-label{
		margin: 20px auto;
	}
	#category-label a:link, #category-label a:visited{
		text-decoration: none;
		color: #fa8; 
	}
/* ======================================== 레시피리스트 ========================================== */
	#recipe-list{
	}
	#recipe-internal{
		display: grid;
		grid-template-columns:290px 290px 290px 290px;
		grid-gap: 13px;
	}
	.recipe-list-preview{
		height: 400px;
		margin-top: 20px;
		cursor: pointer;
	}
	.recipe-preview-image img{
		width: 290px;
		height: 290px;
	}
	.recipe-preview-subject{
		margin: 10px 5px 0px;;
		font-size: 15pt;
		color: #444;
		height: 70px;
		overflow: hidden;
	}
	.recipe-preview-writer{
		margin: -10px 5px 0px;
		font-size: 12pt;
		color: #888;
		text-align: right;
	}
	#recipe-paging{
		width: 500px;
		margin: 20px auto;
		border: 1px solid blue;
		text-align: center;
		background: #fa8;
	}
	.recipe-list-preview:hover img{
		opacity: 0.5;
	}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$(".recipe-list-preview").on("click", function(){
			var page = $(this).attr("mp");
			alert(page);
		});
	});
</script>
</head>
<body>
	<div id="recipebody">
		<div id="category-label">
			<a href="#">카테고리<i class="fas fa-angle-double-down"></i></a>
		</div>
		<div id="category">
			<div id="category-group">
				<div class="category-group-label">종류별</div>
				<div class="category-group-label">상황별</div>
				<div class="category-group-label">재료별</div>
				<div class="category-group-label">방법별</div>
			</div>
			<div id="category-detail">
				<div class="category-detail-label">
					<a href="#" class="category-detail-group1">전체</a>
					<a href="#" class="category-detail-group1">밑반찬</a>
					<a href="#" class="category-detail-group1">메인반찬</a>
					<a href="#" class="category-detail-group1">국/탕</a>
					<a href="#" class="category-detail-group1">찌개</a>
					<a href="#" class="category-detail-group1">디저트</a>
					<a href="#" class="category-detail-group1">면/만두</a>
					<a href="#" class="category-detail-group1">밥/죽/떡</a>
				</div>
				<div class="category-detail-label">
					<a href="#" class="category-detail-group2">전체</a>
					<a href="#" class="category-detail-group2">일상</a>
					<a href="#" class="category-detail-group2">초스피드</a>
					<a href="#" class="category-detail-group2">손님접대</a>
					<a href="#" class="category-detail-group2">술안주</a>
					<a href="#" class="category-detail-group2">다이어트</a>
					<a href="#" class="category-detail-group2">도시락</a>
					<a href="#" class="category-detail-group2">영양식</a>
				</div>
				<div class="category-detail-label">
					<a href="#" class="category-detail-group3">전체</a>
					<a href="#" class="category-detail-group3">소고기</a>
					<a href="#" class="category-detail-group3">돼지고기</a>
					<a href="#" class="category-detail-group3">닭고기</a>
					<a href="#" class="category-detail-group3">육류</a>
					<a href="#" class="category-detail-group3">채소류</a>
					<a href="#" class="category-detail-group3">해물류</a>
					<a href="#" class="category-detail-group3">달걀/유제품</a>
				</div>
				<div class="category-detail-label">
					<a href="#" class="category-detail-group4">전체</a>
					<a href="#" class="category-detail-group4">볶음</a>
					<a href="#" class="category-detail-group4">끓이기</a>
					<a href="#" class="category-detail-group4">부침</a>
					<a href="#" class="category-detail-group4">조림</a>
					<a href="#" class="category-detail-group4">무침</a>
					<a href="#" class="category-detail-group4">비빔</a>
					<a href="#" class="category-detail-group4">찜</a>
				</div>
			</div>
		</div>
		
		<div id="recipe-list">
			<div id="recipe-internal">
				<c:forEach var="k" begin="1" end="16">
					<div class="recipe-list-preview" mp="${k}">
						<div class="recipe-preview-image"><img src="resources/images/gimzzi.jpg"></div>
						<div class="recipe-preview-subject">김치찌개 간단 레시피!</div>
						<div class="recipe-preview-writer">by 짜파게티 요리사</div>
					</div>
				</c:forEach>
			</div>
			<div id="recipe-paging">페이징이 들어갈 자리</div>
		</div>
	</div>
</body>
</html>
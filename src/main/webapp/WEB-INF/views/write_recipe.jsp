<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write recipe</title>
<style type="text/css">
	#write-recipe-body{
		width: 1200px;
		margin: 30px auto 0px;
	}
	#write-recipe-body *{
	}
	#write-recipe-topic{
		font-size: 20pt;
		font-weight: bold;
	}
	#write-top{
		display: grid;
		grid-template-columns: 900px 300px;
		margin-top: 50px;
	}
	#write-top-left{
		display: grid;
		grid-template-columns: 150px 710px;
		grid-template-rows: 60px 100px 100px 80px 60px;
		grid-gap-rows: 20px;
		padding-left: 40px;
	}
	#write-top-right{
		cursor: pointer;
	}
	.write-label{
		border: 1px solid red;
		font-size: 15pt;
		padding-top: 10px;
	}
	.write-input{
		border: 1px solid blue;
	}
	.write-input textarea, .write-input input{
		resize: none;
		font-size: 14pt;
		margin: 5px;
		border-radius: 5px;
		padding: 10px 0px 10px 10px;
	}
	#write-video{
		display: grid;
		grid-template-columns: 450px 260px;
	}
	#write-video{
		text-align: center; 
		color: #999;
		line-height: 0px;
	}
	.fa-youtube{
		margin-top: 10px;
		font-size: 30pt;
	}
	#write-top-image{
		border: 1px solid #bbb;
		margin: auto;
		width: 250px;
		height: 250px;
		text-align: center;
	}
	.fa-camera{
		margin-top: 60px;
		font-size: 55pt;
		color: #999;
	}
	#write-top-image p{
		color: #999;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#write-top-image").on("click", function(){
			$("#insert-main-image").click();
		});
		$("#thumb").css("visibility", "hidden");
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="write-recipe-body">
		<div id="write-recipe-topic">레시피 등록</div>
		<form method="post">
			<div id="write-top">
				<div id="write-top-left">
					<div class="write-label">레시피 제목</div>
					<div class="write-input"><input type="text" name="recipe_title" placeholder="예)소고기 미역국 끓이기"></div>
					<div class="write-label">요리소개</div>
					<div class="write-input"><textarea rows="3" cols="65" name="recipe_introduce" placeholder="이 레시피의 탄생 배경을 적어주세요."></textarea> </div>
					<div class="write-label">동영상</div>
					<div class="write-input" id="write-video">
						<textarea rows="3" cols="40" id="video-url" name="recipe_video" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube만 가능) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 예)http://youtu.be/lA0Bxo3lZmM"></textarea>
						<div>
							<i class="fab fa-youtube"></i>
							<p>동영상 썸네일</p>
						</div>
					</div>
					<div class="write-label">카테고리</div>
					<div class="write-input">
						<select name="ca1">
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
						<select name="ca1">
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
						<select name="ca1">
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
						<select name="ca1">
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
					</div>
					<div class="write-label">요리정보</div>
					<div class="write-input"></div>
				</div>
				<div id="write-top-right">
					<input type="file" name="recipe_mainimage" hidden="" id="insert-main-image">
					<div id="write-top-image">
						<div id="thumb"></div>
						<div id="nothumb">
							<i class="fas fa-camera"></i>
							<p>요리 대표 사진을 등록해주세요</p>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
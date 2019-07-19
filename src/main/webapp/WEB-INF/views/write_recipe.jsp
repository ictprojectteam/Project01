<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write recipe</title>
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css">
<style type="text/css">
	#write-recipe{
		width: 1200px;
		margin: 30px auto 0px;
	}
	#write-recipe *{
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
	.write-label{
		font-size: 15pt;
		padding-top: 10px;
	}
	.write-input{
		font-size: 10pt;
	}
	.write-input textarea, .write-input input{
		resize: none;
		font-size: 14pt;
		margin: 5px;
		border-radius: 5px;
		padding: 10px 0px 10px 10px;
	}
	.write-input select{
		font-size: 12pt;
		padding: 5px 0px 10px 5px;
		margin: 5px 0px 0px 5px;
		color: #444;
	}
	#recipe-inf{
		padding-left: 10px;
	}
	#recipe-inf select{
		margin-right: 25px;
		margin-left: -3px;
	}
	#cate-com{
		margin-top: 10px;
		text-indent: 10pt;
		color: #999;
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
		cursor: pointer;
	}
	#write-top-image-com{
		height: 250px;
	}
	#write-top-image-insert img{
		width: 230px;
		height: 230px;
		margin: 10px;
	}
	#write-top-image-insert>.fa-times{
		background: #333;
		color: #ccc;
		position: relative;
		bottom: 245px;
		left: 105px;
		z-index: 1;
		font-size: 20pt;
		opacity: 0.7;
		visibility: hidden;
		cursor: pointer;
	}
	#write-top-image-insert:hover>.fa-times{
		visibility: visible;
	}
	.fa-camera{
		margin-top: 60px;
		font-size: 55pt;
		color: #999;
	}
	#write-top-image p{
		color: #999;
	}
	#write-body{
		margin-top: 70px;
		padding-left: 40px;
	}
	#write-body>p{
		font-size: 10pt;
		color: #999;
	}
	.recipe-sort{
		width: 950px;
		display: grid;
		grid-template-columns: 30px 200px 720px;
	}
	.recipe-sort-arrow, .recipe-each-arrow{
		color: #999;
		text-align: center;
		line-height: 0px;
	}
	.fa-sort-up{
		margin-top: 10px;
		margin-bottom: -6px;
	}
	.fa-sort-down{
		margin-top: -6px;
	}
	.recipe-sort-pack{
		margin-left: 5px;
	}
	.recipe-sort-pack textarea{
		background: #eec;
		resize: none;
		font-size: 14pt;
		border-radius: 5px;
		padding: 10px 0px 10px 10px;
	}
	.recipe-delete-pack{
	}
	.recipe-delete-pack p{
		text-align: center;
		border: 1px solid #999;
		font-size: 9pt;
		padding: 5px;
		margin: 0px 30px;
		color: #333;
		cursor: pointer;
		border-radius: 3px;
	}
	.recipe-delete-pack p:active{
		box-shadow: 0px 0px 2px 1px #79f;
	}
	.recipe-each-sort{
		display: grid;
		grid-template-columns: 30px 380px 280px 30px;
	}
	.recipe-each-ing textarea{
		resize: none;
		font-size: 14pt;
		padding: 10px 0px 10px 10px;
		border-radius: 5px;
		margin-bottom: 5px;
	}
	.recipe-each-delete>.fa-times{
		color: #eee;
		background: #ccc;
		border-radius: 10px;
		padding: 3px;
		margin: 10px 0px 0px 10px;
		cursor: pointer;
		visibility: hidden;
	}
	.recipe-each-sort:hover>.recipe-each-delete>.fa-times{
		visibility: visible;
	}
	.recipe-each-add{
		text-align: center;
		font-size: 10pt;
		margin: 5px auto 20px auto;
		cursor: pointer;
	}
	.recipe-each-add>.fa-plus{
		padding: 3px;
		background: #fa8;
		border-radius: 15px;
	}
	#recipe-pack-not{
		margin-top: 50px;
		text-align: center;
		font-size: 10pt;
		color: #f33;
	}
	#recipe-add-pack{
		text-align: center;
	}
	#recipe-add-pack>p{
		display: inline-block;
		border: 1px solid #aaa;
		padding: 10px 25px;
		border-radius: 5px;
		cursor: pointer;
	}
	#recipe-order-not{
		font-size: 9pt;
		color: #999;
		line-height: 5px;
	}
	#recipe-order-not > :first-child{
		font-weight: bold;
	}
	#recipe-order-not > :not(:first-child){
		text-indent: 10pt;
	}
	.recipe-order{
		width: 700px;
		margin: 20px auto 0px 30px;
		display: grid;
		grid-template-columns: 150px 350px 150px 50px;
	}
	.recipe-order-count{
		text-align: center;
		color: #fa8;
		font-size: 20pt;
	}
	.recipe-order-content>textarea{
		font-size: 12pt;
		resize: none;
		width: 340px;
		height: 160px;
		margin: 0px;
	}
	.recipe-order-addimage{
		height: 165px;
		border: 1px solid #999;
	}
	.recipe-order-addimage>div:not(.recipe-order-image){
		cursor: pointer;
	}
	.recipe-order-addimage>div>i.fa-plus{
		margin: 69px 60px;
		text-align: center;
		color: #999;
		font-size: 20pt;
	}
	.recipe-order-image>img{
		width: 150px;
		margin: 0;
		height: 160px;
		cursor: pointer;
	}
	.recipe-order-image>i.fa-times{
		color: #ccc;
		background: #333;
		opacity: 0.7;
		font-size: 20pt;
		position: relative;
		bottom: 165px;
		left: 130px;
		cursor: pointer;
		visibility: hidden;
	}
	.recipe-order-image:hover>i.fa-times{
		visibility: visible;
	}
	.recipe-order-button>i{
		display: block;
		color: #999;
		font-size: 14pt;
		margin: 17px auto;
		text-align: center;
		cursor: pointer;
	}
	#recipe-order-add{
		width: 100px;
		margin: 20px auto 0px 330px;
		text-align: center;
		cursor: pointer;
	}
	#recipe-order-add .fa-plus{
		color: #eee;
		background: #fa8;
		border-radius: 10px;
		font-size: 8pt;
		padding: 3px;
		vertical-align: 2pt;
	}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script src="../resources/js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#write-top-image-com").on("click", insert_click);
		$("#recipe-ing").sortable({
			handle: '.recipe-sort-arrow'
		});
		$(".recipe-each-ing").sortable({
			handle: '.recipe-each-arrow'
		});
		$("#recipe-order-container").sortable({
			handle: '.recipe-order-count',
		});
		$("#recipe-order-container").on("sortstop", function(){
			var i = 1;
			$(".recipe-order").each(function(){
				$(this).find(".recipe-order-count").text("Step " + i);
				i++;
			});
		});
		
		$("#insert-main-image").on("change", function(){
			if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function(e){
					$("#write-top-image-com").hide();
					$("#write-top-image-insert").empty();
					$("#write-top-image-insert").append("<img onclick='javascript:insert_click()' src=" + e.target.result + ">");
					$("#write-top-image-insert").append("<i class='fas fa-times' onclick='del_mainimage()'></i>")
					$("#write-top-image-insert").show();
				}
			} else {
				$("#write-top-image-insert").hide();
				$("#write-top-image-com").show();
			}
		});

		$("[id^=recipe-orderimage-]").on("change", change_order_image);
		
	});
	function insert_click(){
		$("#insert-main-image").click();
	}
	
	function del_mainimage(){
		$("#insert-main-image").val('');
		$("#write-top-image-insert").empty();
		$("#write-top-image-com").show();
	}

	function del_pack(pack){
		var k = $(".recipe-ing-pack");
		if(k.length < 2){
			$("#recipe-ing-pack-"+pack+" textarea").val("");
			$("#recipe-ing-pack-"+pack).attr("id","recipe-ing-pack-1");
		} else {
			$("#recipe-ing-pack-"+pack).remove();
		}
	}
	
	function each_add(pack){
		var ing = 0;
		$("#recipe-pack-"+pack+" [id^=recipe-each-"+pack+"-]").each(function(){
			var pre_ing = $(this).prop("id").replace("recipe-each-"+pack+"-", "");
			var tmp_ing = parseInt(pre_ing, 10);
			ing = Math.max(ing, tmp_ing);
		});
		ing++;
		var str = '<div class="recipe-each-sort" id="recipe-each-'+pack+'-'+ing+'">';
		str += '<div class="recipe-each-arrow"><i class="fas fa-sort-up"></i><br><i class="fas fa-sort-down"></i></div>';
		str += '<div class="recipe-each-name"><textarea rows="1" cols="39" placeholder="예) 돼지고기"></textarea></div>';
		str += '<div class="recipe-each-quant"><textarea rows="1" cols="28" placeholder="예) 300g"></textarea></div>';
		str += '<div class="recipe-each-delete" onclick="each_del('+pack+','+ing+')"><i class="fas fa-times"></i></div></div>';
		$(str).appendTo("#recipe-pack-"+pack);
		$(".recipe-each-ing").sortable({
			handle: '.recipe-each-arrow'
		});
	}	

	function each_del(pack, ing){
		$("#recipe-each-"+pack+"-"+ing).remove();
	}

	function add_pack(){
		var pack = 0;
		$(".recipe-each-ing").each(function(){
			var pre_pack = $(this).prop("id").replace("recipe-pack-","");
			var tmp_pack = parseInt(pre_pack, 10);
			pack = Math.max(pack, tmp_pack);
		});
		pack++;
		var str = '<div class="recipe-ing-pack" id="recipe-ing-pack-' + pack + '"><div class="recipe-sort">';
		str += '<div class="recipe-sort-arrow"><i class="fas fa-sort-up"></i><br><i class="fas fa-sort-down"></i></div>';
		str += '<div><div class="recipe-sort-pack"><textarea rows="1" cols="16" name="ing-pack" wrap="soft"></textarea></div>';
		str += '<div class="recipe-delete-pack"><p onclick="javascript:del_pack(' + pack + ')"><i class="fas fa-times"></i> 묶음삭제</p></div></div>';
		str += '<div class="recipe-each-ing" id="recipe-pack-' + pack + '"></div></div>';
		str += '<div class="recipe-each-add" onclick="each_add(' + pack + ')"><i class="fas fa-plus"></i> 추가</div></div>';
		$("#recipe-ing").append(str);
		each_add(pack);
		each_add(pack);
	}

	function add_order_image(num){
		$("#recipe-orderimage-" + num).click();
	}

	function change_order_image(){
		var k = $(this).attr("id").replace("recipe-orderimage-", "");
		if(this.files && this.files[0]){
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e){
				$("#recipe-order-" + k + " .recipe-order-addimage i.fa-plus").hide();
				$("#recipe-order-" + k + " .recipe-order-image").empty();
				var imgapp = "<img onclick='javascript:add_order_image(" + k + ")' src=" + e.target.result + ">";
				imgapp += "<i class='fas fa-times' onclick = 'del_order_image("+ k + ")'></i>";
				$("#recipe-order-" + k + " .recipe-order-image").append(imgapp);
			}
		} else {
			$("#recipe-order-" + k + " .recipe-order-image").empty();
			$("#recipe-order-" + k + " .recipe-order-addimage i.fa-plus").show();
		}
	}

	function del_order_image(num){
		$("#recipe-orderimage-" + num).val('');
		$("#recipe-order-" + num + " .recipe-order-image").empty();
		$("#recipe-order-" + num + " .recipe-order-addimage i.fa-plus").show();
	}
	function add_order(){
		var count = 0;
		$(".recipe-order").each(function(){
			var pre_count = $(this).prop("id").replace("recipe-order-","");
			var tmp_count = parseInt(pre_count, 10);
			count = Math.max(count, tmp_count);
		});
		count++;
		var str = '<div class="recipe-order" id="recipe-order-' + count + '"><div class="recipe-order-count">Step ' + count + '</div><div class="recipe-order-content">';
		str += '<textarea placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea></div>';
		str += '<div class="recipe-order-addimage"><div onclick="add_order_image(' + count + ')"><i class="fas fa-plus"></i></div><div class="recipe-order-image"></div></div>';
		str += '<input type="file" hidden="" name="recipe_orderimage1" accept="image/*" id="recipe-orderimage-' + count + '">';	
		str += '<div class="recipe-order-button"><i class="fas fa-angle-up"></i> <i class="fas fa-angle-down"></i>';
		str += '<i class="fas fa-plus"></i> <i class="fas fa-times"></i></div></div>';
		$("#recipe-order-container").append(str);
		$("#recipe-orderimage-" + count).bind("change", change_order_image);
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="write-recipe">
		<div id="write-recipe-topic">레시피 등록</div>
		<form method="post">
			<div id="write-top">
				<div id="write-top-left">
					<div class="write-label">레시피 제목</div>
					<div class="write-input"><textarea rows="1" cols="65" name="recipe_title" placeholder="예)소고기 미역국 끓이기"></textarea></div>
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
						<select name="ca2">
							<option>상황별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
						<select name="ca3">
							<option>방법별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
						<select name="ca4">
							<option>재료별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
							<option>종류별</option>
						</select>
						<p id="cate-com">분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</p>
					</div>
					<div class="write-label">요리정보</div>
					<div class="write-input" id="recipe-inf">
						인원
						<select name="recipe_quant">
							<option>인원</option>
							<option>1인분</option>
							<option>2인분</option>
							<option>3인분</option>
							<option>4인분</option>
							<option>5인분</option>
							<option>6인분이상</option>
						</select>
						시간
						<select name="recipe_time">
							<option>시간</option>
							<option>5분이내</option>
							<option>10분이내</option>
							<option>15분이내</option>
							<option>20분이내</option>
							<option>30분이내</option>
							<option>60분이내</option>
							<option>90분이내</option>
							<option>2시간이내</option>
							<option>2시간이상</option>
						</select>
						난이도
						<select name="recipe_difficulty">
							<option>난이도</option>
							<option>아무나</option>
							<option>초급</option>
							<option>중급</option>
							<option>고급</option>
							<option>신의경지</option>
						</select>
					</div>
				</div>
				<div id="write-top-right">
					<input type="file" name="recipe_mainimage" hidden="" id="insert-main-image" accept="image/*">
					<div id="write-top-image">
						<div id="write-top-image-com">
							<i class="fas fa-camera"></i>
							<p>요리 대표 사진을 등록해주세요</p>
						</div>
						<div id="write-top-image-insert">
						</div>
					</div>
				</div>
			</div>
			
			<!-- write body -->
			
			<div id="write-body">
				<p>재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</p>
				<div id="recipe-ing">
					<div class="recipe-ing-pack" id="recipe-ing-pack-1">
						<div class="recipe-sort">
							<div class="recipe-sort-arrow">
								<i class="fas fa-sort-up"></i><br>
								<i class="fas fa-sort-down"></i>
							</div>
							<div>
								<div class="recipe-sort-pack">
									<textarea rows="1" cols="16" name="ing-pack" wrap="soft">재료</textarea>
								</div>
								<div class="recipe-delete-pack">
									<p onclick='javascript:del_pack(1)'><i class="fas fa-times"></i> 묶음삭제</p>
								</div>
							</div>
							<div class="recipe-each-ing" id="recipe-pack-1">
								<div class="recipe-each-sort" id="recipe-each-1-1">
									<div class="recipe-each-arrow">
										<i class="fas fa-sort-up"></i><br>
										<i class="fas fa-sort-down"></i>
									</div>
									<div class="recipe-each-name">
										<textarea rows="1" cols="39" placeholder="예) 돼지고기"></textarea>
									</div>
									<div class="recipe-each-quant">
										<textarea rows="1" cols="28" placeholder="예) 300g"></textarea>
									</div>
									<div class="recipe-each-delete" onclick="each_del(1,1)">
										<i class="fas fa-times"></i>
									</div>
								</div>
								<div class="recipe-each-sort" id="recipe-each-1-2">
									<div class="recipe-each-arrow">
										<i class="fas fa-sort-up"></i><br>
										<i class="fas fa-sort-down"></i>
									</div>
									<div class="recipe-each-name">
										<textarea rows="1" cols="39" placeholder="예) 양배추"></textarea>
									</div>
									<div class="recipe-each-quant">
										<textarea rows="1" cols="28" placeholder="예) 1/2개"></textarea>
									</div>
									<div class="recipe-each-delete" onclick="each_del(1,2)">
										<i class="fas fa-times"></i>
									</div>
								</div>
								<div class="recipe-each-sort" id="recipe-each-1-3">
									<div class="recipe-each-arrow">
										<i class="fas fa-sort-up"></i><br>
										<i class="fas fa-sort-down"></i>
									</div>
									<div class="recipe-each-name">
										<textarea rows="1" cols="39" placeholder="예) 참기름"></textarea>
									</div>
									<div class="recipe-each-quant">
										<textarea rows="1" cols="28" placeholder="예) 1T"></textarea>
									</div>
									<div class="recipe-each-delete" onclick="each_del(1,3)">
										<i class="fas fa-times"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="recipe-each-add" onclick="each_add(1)"><i class="fas fa-plus"></i> 추가</div>
					</div>
				</div>
				<div id="recipe-pack-not">※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수, 밑간 등으로 구분해서 작성해주세요.</div>
				<div id="recipe-add-pack">
					<p onclick="javascript:add_pack()"><i class="fas fa-plus"></i> 재료/양념 묶음 추가</p>
				</div>
				<div id="recipe-order">
					<div class="write-label">요리순서</div>
					<div id="recipe-order-not">
						<p>요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</p>
						<p>예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.</p>
						<p>&nbsp; &nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.</p>
						<p>&nbsp; &nbsp;꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.</p>
					</div>
					<div id="recipe-order-container">
						<div class="recipe-order" id="recipe-order-1">
							<div class="recipe-order-count">Step 1</div>
							<div class="recipe-order-content"><textarea placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea></div>
							<div class="recipe-order-addimage">
								<div onclick="add_order_image(1)"><i class="fas fa-plus"></i></div>
								<div class="recipe-order-image"></div>
							</div>
							
							<input type="file" hidden="" name="recipe_orderimage1" accept="image/*" id="recipe-orderimage-1">
							<div class="recipe-order-button">
								<i class="fas fa-angle-up"></i>
								<i class="fas fa-angle-down"></i>
								<i class="fas fa-plus"></i>
								<i class="fas fa-times"></i>
							</div>
						</div>
					</div>
					<div id="recipe-order-add" onclick="add_order()">
						<i class="fas fa-plus"></i> 순서추가
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
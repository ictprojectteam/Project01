<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토크 작성</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js" charset="UTF-8"></script>
<style type="text/css">
	.fs{
		width: 600px;
		background-color: white;
		margin: 50px auto;
	}
		#write-image{
		border: 1px solid #bbb;
		width: 120px;
		height: 120px;
		text-align: center;
		margin-top:20px;
		cursor: pointer;
	}
	#write-image-com{
		height: 150px;
	}
	#write-image-insert img{
		width: 130px;
		height: 130px;
		margin: 10px;
	}
	#write-image-insert>.fa-times{
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
	#write-image-insert:hover>.fa-times{
		visibility: visible;
	}
	.fa-camera{
		margin-top: 25px;
		font-size: 55pt;
		color: #999;
	}
	#write-top-image p{
		color: #999;
	}
	.info{
		margin-top: 150px;
		color: #BDBDBD;
	}
	.btg{
		margin-left: 250px;
	}
	#write_bt{
		width:70px;
		font-size: 1em;
	}
	#reset_bt{
		width:70px;
		font-size: 1em;
	}
	.imgs_wrap{
		width: 600px;
		margin: -130px 0px 30px 180px;
		cursor: pointer;
	}
	.imgs_wrap img{
		width: 130px;
		height: 130px;
		padding:3px;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	function write_ok(f){
		f.action = "talk_write_ok";
		f.submit();
	}
	
	var sel_files = [];

	$(function () {
		$('#write-image').click(function (e) {
			e.preventDefault();
			$('#insert_image').click();
		});
	});
	$(document).ready(function(){
		$("#insert_image").on("change", handleImgsFilesSelect);
	});
	function handleImgsFilesSelect(e){
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;

		filesArr.forEach(function(f){
			sel_files.push(f);
			var reader = new FileReader();
			
			reader.onload = function(e){
				var img_html = "<a href=\"javascript:(0);\" onclick=">";
				$(".imgs_wrap").append(img_html);
			}
			
			reader.readAsDataURL(f);
		});
	}	
	
	
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div>
		<form method="post" enctype="multipart/form-data">
			<table>
				<fieldset class="fs">
				<h3>ICT레시피 쉐프들의 자유토크</h3>
				<hr>
				<textarea rows="15" cols="75" style="font-size: 16pt;" name="content" ></textarea>
				<hr>
				<input type="file" name="f_name" id="insert_image" accept="image/*" multiple hidden="">
				<div id="write-image">
					<i class="fas fa-camera"></i>
				</div>
				<div class="imgs_wrap"></div>
				<p class="info">
				** 이미지를 첨부할 수 있습니다. 
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;파일 크기 제한 : 100MB 
				</p>
				
				<hr>
				<p class="btg">
				<input id="write_bt" type="button" value="등록" onclick="write_ok(this.form)">
				<input id="reset_bt" type="reset" value="취소">
				</p>
				</fieldset>
			</table>
		</form>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
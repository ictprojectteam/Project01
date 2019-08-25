<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토크 수정</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
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
		margin-left: 300px;
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
	}
	.imgs_wrap img{
		width: 130px;
		height: 130px;
		padding:3px;
	}
	.imgs_wrap>i.fa-times{
		color: #ccc;
		background: #333;
		font-size: 20pt;
		position: relative;
		cursor: pointer;
		padding: 3px;
		bottom: 105px;
		right: 30px;
	}
</style>
<script type="text/javascript">
	var sel_files = [];
	var index = 0;
	var files;
	var deleted = [];
	function write_ok(f){
		f.action = "talk_update_ok";
		$("#deleted").val(deleted);
		f.submit();
	}
	
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
		sel_files = [];
		$(".imgs_wrap").empty();
		
		files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		

		filesArr.forEach(function(f){
			sel_files.push(f);
			var reader = new FileReader();
			
			reader.onload = function(e){
				var img_html = "<img src='"+ e.target.result + "' data-file='"+ f.name + "' class='selProductFile' id='image_id_"+index+"'>"+
								"<i onclick='del_img("+ index +")' id='img_id_"+ index +"' class='fas fa-times'></i>"
				$(".imgs_wrap").append(img_html);
				index++;
				
			}
			reader.readAsDataURL(f);
		});
	}
	function del_img(index){
		sel_files.splice(index, 1);
		deleted.splice(deleted.length, 0, files[index].name);
		var img_id = "#img_id_" + index;
		var image_id = "#image_id_" + index;
		$(img_id).remove();
		$(image_id).remove();
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
					<textarea rows="15" cols="75" style="font-size: 16pt; resize: none;" name="content"  >${tvo.content}</textarea>
					<hr>
					<input type="file" name="f_name" id="insert_image" accept="image/*" multiple hidden="">
					<div id="write-image">
						<i class="fas fa-camera"></i>
					</div>
					<div class="imgs_wrap">
						<c:if test="${tvo.file_name != null}">
							<c:forEach var="i" items="${tvo.f_arr}">
								<img src="<c:url value='/resources/upload/${i}'/>" style="width:130px; height: 130px;">
							</c:forEach>
						</c:if>
					</div>
					
					<p class="info">
					** 이미지를 첨부할 수 있습니다. 
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;파일 크기 제한 : 100MB 
					</p>
					<hr>
					<p class="btg">
						<input id="write_bt" type="button" value="수정" onclick="write_ok(this.form)">
						<input id="reset_bt" type="reset" value="취소">
						<input type="hidden" name="deleted" id="deleted">
						<input type="hidden" name="t_idx" value="${tvo.t_idx}">
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
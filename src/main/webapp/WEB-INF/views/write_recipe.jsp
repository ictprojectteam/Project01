<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 10px 0px 10px 10px;
	}
	.write-input select{
		font-size: 12pt;
		padding: 5px 0px 10px 5px;
		border: 1px solid #ccc;
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
	#video-thumbnail img{
		width: 176px;
		height: 99px;
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
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 10px 0px 10px 10px;
	}
	.recipe-delete-pack p{
		text-align: center;
		border: 1px solid #ccc;
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
		border: 1px solid #ccc;
		border-radius: 5px;
		margin-bottom: 5px;
		width: 95%;
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
		width: 70px;
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
		border: 1px solid #ccc;
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
		border: 1px solid #ccc;
		font-size: 12pt;
		resize: none;
		width: 340px;
		height: 160px;
		margin: 0px;
	}
	.recipe-order-addimage{
		height: 165px;
		border: 1px solid #ccc;
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
		width: 148px;
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
		margin: 6px auto 0px 6px;
		text-align: center;
		cursor: pointer;
		border: 1px solid #eee;
		background: #ccc;
		width: 25px;
		height: 25px;
		padding: 4px;
		line-height: 25px;
		visibility: hidden;
	}
	.recipe-order:hover .recipe-order-button>i{
		visibility: visible;
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
	#write-bottom{
		padding-left: 40px;
	}
	#write-comp-image{
		width: 800px;
		height: 150px;
		margin: 50px auto 0px 0px;
		display: grid;
		grid-template-columns: 160px 640px;
	}
	#comp-image-pack{
		display: grid;
		grid-template-columns: 153px 153px 153px 153px;
		grid-column-gap: 8px;
		height: 150px;
	}
	#comp-image-oneclick{
		width: 120px;
		height: 30px;
		font-size: 10pt;
		border: 1px solid #ccc;
		padding: 0px 7px;
		line-height: 30px;
		border-radius: 5px;
		cursor: pointer;
	}
	#comp-image-oneclick:active{
		box-shadow: 0px 0px 5px 1px #79f;
	}
	.comp-image{
		cursor: pointer;
		height: 150px;
	}
	.comp-image-empty{
		border: 1px solid #ccc;
	}
	.comp-image-empty i{
		margin: 60px 60px;
		text-align: center;
		color: #999;
		font-size: 20pt;
	}
	.comp-image-selected img{
		width: 153px;
		height: 150px;
	}
	.comp-image-selected i{
		color: #ccc;
		background: #333;
		opacity: 0.7;
		font-size: 20pt;
		position: relative;
		bottom: 155px;
		left: 133px;
		cursor: pointer;
		visibility: hidden;
	}
	.comp-image-selected:hover i{
		visibility: visible;
	}
	#write-tip{
		width: 800px;
		height: 100px;
		margin: 80px auto 0px 0px;
		display: grid;
		grid-template-columns: 160px 640px;
	}
	#write-tip-content textarea{
		resize: none;
		width: 100%;
		height: 100%;
		font-size: 12pt;
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 10px;
	}
	#write-tag{
		width: 800px;
		height: 45px;
		margin: 80px auto 0px 0px;
		display: grid;
		grid-template-columns: 160px 640px;
	}
	#write-tag-content input{
		resize: none;
		width: 100%;
		font-size: 12pt;
		border-radius: 5px;
		padding: 10px;
		border: 1px solid #ccc;
	}
	#taginf{
		margin-left: 160px;
		font-size: 11pt;
	}
	#taginf span{
		font-size: 10pt;
		color: #999;
	}
	#save-button{
		text-align: center;
		margin-top: 40px;
	}
	#save-button span{
		cursor: pointer;
	}
	#save-button span:first-child{
		display: inline-block;
		border: 1px solid #5a5;
		padding: 10px 40px;
		margin: 0px 4px;
		color: #fff;
		background: #9d5;
		border-radius: 5px;
		font-weight: bold;
	}
	#save-button span:first-child:hover{
		background: #8c5;
	}
	#save-button span:first-child:active{
		box-shadow: 0px 0px 5px 1px #79f;
	}
	#save-button span:nth-child(2){
		display: inline-block;
		border: 1px solid #d85;
		padding: 10px 40px;
		margin: 0px 4px;
		color: #fff;
		background: #fa8;
		border-radius: 5px;
		font-weight: bold;
	}
	#save-button span:nth-child(2):hover{
		background: #e98;
	}
	#save-button span:nth-child(2):active{
		box-shadow: 0px 0px 5px 1px #79f;
	}
	#save-button span:last-child{
		display: inline-block;
		border: 1px solid #ccc;
		padding: 10px 40px;
		margin: 0px 4px;
		color: #333;
		border-radius: 5px;
		font-weight: bold;
	}
	#save-button span:last-child:active{
		box-shadow: 0px 0px 5px 1px #79f;
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
		$("#recipe-order-container").on("sortstop", order_sort);
		$("#recipe-ing").on("sortstop", pack_sort);
		$(".recipe-each-ing").on("sortstop", mat_sort);
		
		$("#insert-main-image").on("change", function(){
			if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function(e){
					var readFile = e.target.result;
					var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
					readFile = readFile.substring(0, readFile.indexOf('/'));
					if(readFile === "data:image" && chkcor != "77u/"){
						$("#write-top-image-com").append("<input type='hidden' value='" + e.target.result + "' name='main_image'>")
						$("#write-top-image-com").hide();
						$("#write-top-image-insert").empty();
						$("#write-top-image-insert").append("<img onclick='insert_click()' src=" + e.target.result + ">");
						$("#write-top-image-insert").append("<i class='fas fa-times' onclick='del_mainimage()'></i>");
						$("#write-top-image-insert").show();
					} else {
						del_mainimage();
					}
				}
			} else {
				del_mainimage();
			}
		});
		$("[id^=recipe-orderimage-]").on("change", change_order_image);
		
		$("#comp-image-oneclick").on("click", function(){
			$("#comp-image-multfile").click();
		});
		$("#comp-image-multfile").on("change", function(){
			var files = this.files;
			var imgnum = 1;
			$(".comp-image-selected").empty();
			$(".comp-image-empty").show();
			$("input[name^=comp-image-val-]").val("");
			if(files){
				for (var i = 0; i < files.length; i++) {
					var reader = new FileReader();
					reader.readAsDataURL(files[i]);
					reader.onload = function(e){
						if(imgnum > 4) return;
						var cont = $("#comp-image-" + imgnum);
						var selimg = cont.find(".comp-image-selected");
						var readFile = e.target.result;
						var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
						readFile = readFile.substring(0, readFile.indexOf('/'));
						if(readFile === "data:image" && chkcor != "77u/"){
							cont.find(".comp-image-empty").hide();
							cont.find("input[type=hidden]").val(e.target.result);
							selimg.empty();
							selimg.append("<img src=" + e.target.result + " onclick='change_compimage(" + imgnum + ")'>");
							selimg.append("<i class='fas fa-times' onclick = 'del_compimage(" + imgnum + ")'></i>");
							selimg.show();
							imgnum++;
						} else {
							selimg.hide();
							cont.find(".comp-image-empty").show();
						}
					}	
				}
			}
		});
		
		$(".comp-image-empty").on("click", function(){
			var k = $(this).parent().attr("id").replace("comp-image-", "");
			$("#comp-image-file-" + k).click();
		});
		$("[id^=comp-image-file-").on("change", function(){
			var k = $(this).attr("id").replace("comp-image-file-", "");
			var cont = $("#comp-image-" + k);
			var selimg = cont.find(".comp-image-selected");
			selimg.empty();
			cont.find(".comp-image-empty").show();
			if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function(e){
					var readFile = e.target.result;
					var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
					readFile = readFile.substring(0, readFile.indexOf('/'));
					if(readFile === "data:image" && chkcor != "77u/"){
						cont.find(".comp-image-empty").hide();
						cont.find("input[type=hidden]").val(e.target.result);
						selimg.append("<img src=" + e.target.result + " onclick='change_compimage(" + k + ")'>");
						selimg.append("<i class='fas fa-times' onclick = 'del_compimage(" + k + ")'></i>");
						selimg.show();
					} else {
						$(this).val("");
						selimg.hide();
						cont.find("input[type=hidden]").val("");
						cont.find(".comp-image-empty").show();
					}
				}
			} else {
				selimg.hide();
				cont.find("input[type=hidden]").val("");
				cont.find(".comp-image-empty").show();
			}
		});
		$("#video-url").on("focusout", function(){
			var url = $("#video-url").val();
			if(/http[s]?:[/]{2}/.test(url)){
				url = url.substring(url.lastIndexOf('/') + 1, url.length);
				if(/.{11,11}/.test(url)) {
					url = "https://img.youtube.com/vi/" + url + "/maxresdefault.jpg";
					$.ajax({
						url : "thumbnail",
						type : "post",
						data : {"url":url},
						dataType : "text",
						success : function(data){
							$("#video-pre").hide();
							$("#video-thumbnail").empty();
							$("#video-thumbnail").append("<img src='" + data + "' alt='' onerror=img_error()>");
							$("#video-thumbnail").show();
							if($("input[name=main_image]").val() == undefined){
								$("#write-top-image-com").append("<input type='hidden' value='" + data + "' name='main_image'>")
								$("#write-top-image-com").hide();
								$("#write-top-image-insert").empty();
								$("#write-top-image-insert").append("<img onclick='insert_click()' src=" + data + ">");
								$("#write-top-image-insert").append("<i class='fas fa-times' onclick='del_mainimage()'></i>");
								$("#write-top-image-insert").show();
							}
						}
					});
				} else {
					alert("올바른 주소를 입력해주세요.");
					$("#video-url").val("");
				}
			}
		});
		$("#save").on("click", function(){
			var chkval = validateForm();
			if(!chkval) return;
			$("input[type=file]").attr("disabled", "disabled");
			subm = true;
			$("#recipe-form").attr("action", "save_recipe").submit();
		});
		$("#public").on("click", function(){
			var chkval = validateForm();
			if(!chkval) return;
			$("input[type=file]").attr("disabled", "disabled");
			subm = true;
			$("#savepublic").val("1");
			$("#recipe-form").attr("action", "save_recipe").submit();
		});
		$("#cancel").on("click", function(){
			history.go(-1);
		});
		var subm = false;
		$(window).on("beforeunload", function(){
			if (!subm) return "작성된 레시피를 저장하지 않고 이동하시겠습니까?";
		});
	});
	function validateForm(){
		if($("textarea[name=recipe_title]").val() == ""){
			alert("제목을 입력해주세요.");
			$("textarea[name=recipe_title]").focus();
			return false;
		}
		if($("textarea[name=recipe_introduce]").val() == ""){
			alert("요리소개를 입력해주세요.");
			$("textarea[name=recipe_title]").focus();
			return false;
		}
		if($("select[name=ca1]").val() == "종류별"){
			alert("종류별 카테고리를 선택해주세요.");
			$("select[name=ca1]").focus();
			return false;
		}
		if($("select[name=ca2]").val() == "상황별"){
			alert("상황별 카테고리를 선택해주세요.");
			$("select[name=ca2]").focus();
			return false;
		}
		if($("select[name=ca3]").val() == "방법별"){
			alert("방법별 카테고리를 선택해주세요.");
			$("select[name=ca3]").focus();
			return false;
		}
		if($("select[name=ca4]").val() == "재료별"){
			alert("재료별 카테고리를 선택해주세요.");
			$("select[name=ca4]").focus();
			return false;
		}
		if($("select[name=recipe_quant]").val() == "인원"){
			alert("인원 정보를 선택해주세요.");
			$("select[name=recipe_quant]").focus();
			return false;
		}
		if($("select[name=recipe_time]").val() == "시간"){
			alert("시간 정보를 선택해주세요.");
			$("select[name=recipe_time]").focus();
			return false;
		}
		if($("select[name=recipe_difficulty]").val() == "난이도"){
			alert("난이도 정보를 선택해주세요.");
			$("select[name=recipe_difficulty]").focus();
			return false;
		}
		if($("input[name=main_image]").val() == undefined){
			alert("대표 사진을 등록해주세요.");
			return false;
		}
		var matval = false;
		var matcount = 0;
		$(".recipe-ing-pack").each(function(){
			if($(this).find("textarea[name^=ing-pack-]").val() == ""){
				$(this).find(".recipe-each-sort").each(function(){
					if($(this).find("textarea[name^=recipe-each-name-]").val() != "") matcount++;
				});
				if(matcount == 0) $(this).remove();
				matcount = 0;
			}
			pack_sort();
		});
		$(".recipe-each-ing").each(function(){
			$(this).find(".recipe-each-sort").each(function(){
				if($(this).find("textarea[name^=recipe-each-name-]").val() != ""){
					matcount++;
				} else {
					$(this).remove();
				}
			});
			mat_sort_input($(this).attr("id").replace("recipe-pack-",""));
		});
		$(".recipe-each-ing").sortable("refresh");
		
		if(matcount > 0) matval = true;
		if(!matval){
			alert("재료는 최소 1개 이상이어야 합니다.");
			$("textarea[name=recipe-each-name-1-1]").focus();
			return false;
		}
		var ordval = false;
		var ordcount = 0;
		$(".recipe-order").each(function(){
			if($(this).find("textarea").val() != "") {
				ordcount++;
			} else {
				$(this).remove();
			}
			order_sort();
		});
		if(ordcount > 2) ordval = true;
		if(!ordval){
			alert("순서는 최소 3개 이상이어야 합니다.");
			$("textarea[name=order-text-1]").focus();
			
			return false;
		}
		
		return true;
	}
	function insert_click(){
		$("#insert-main-image").click();
	}
	function img_error(){
		$("#video-thumbnail").empty();
		$("#video-thumbnail").hide();
		$("#video-pre").show();
		alert("올바른 주소를 입력해주세요");
		$("#video-url").val("");
	}
	
	function del_mainimage(){
		$("#insert-main-image").val('');
		$("#write-top-image-insert").empty();
		$("#write-top-image-com").find("input[name=main_image]").remove();
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
		str += '<div class="recipe-each-name"><textarea rows="1" placeholder="예) 돼지고기" name="recipe-each-name-'+pack+'-'+ing+'"></textarea></div>';
		str += '<div class="recipe-each-quant"><textarea rows="1" placeholder="예) 300g" name="recipe-each-quant-'+pack+'-'+ing+'"></textarea></div>';
		str += '<div class="recipe-each-delete" onclick="each_del('+pack+','+ing+')"><i class="fas fa-times"></i></div></div>';
		$(str).appendTo("#recipe-pack-"+pack);
		$(".recipe-each-ing").sortable({
			handle: '.recipe-each-arrow'
		});
		$(".recipe-each-ing").on("sortstop", mat_sort);
	}	
	function each_del(pack, ing){
		$("#recipe-each-"+pack+"-"+ing).remove();
		mat_sort_input(pack);
	}
	function mat_sort(){
		var pack = $(this).attr("id").replace("recipe-pack-","");
		var ing = 1;
		$(this).find(".recipe-each-sort").each(function(){
			$(this).attr("id", "recipe-each-" + pack + "-" + ing);
			$(this).find(".recipe-each-name textarea").attr("name", "recipe-each-name-" + pack + "-" + ing);
			$(this).find(".recipe-each-quant textarea").attr("name", "recipe-each-quant-" + pack + "-" + ing);
			$(this).find(".recipe-each-delete").attr("onclick", "each_del(" + pack + "," + ing + ")");
			ing++;
		});
	}
	function mat_sort_input(pack){
		var ing = 1;
		$("#recipe-pack-"+pack).find(".recipe-each-sort").each(function(){
			$(this).attr("id", "recipe-each-" + pack + "-" + ing);
			$(this).find(".recipe-each-name textarea").attr("name", "recipe-each-name-" + pack + "-" + ing);
			$(this).find(".recipe-each-quant textarea").attr("name", "recipe-each-quant-" + pack + "-" + ing);
			$(this).find(".recipe-each-delete").attr("onclick", "each_del(" + pack + "," + ing + ")");
			ing++;
		});
	}
	
	function pack_sort(){
		var pack = 1;
		$(".recipe-ing-pack").each(function(){
			$(this).attr("id", "recipe-ing-pack-" + pack);
			$(this).find(".recipe-sort-pack textarea").attr("name", "ing-pack-"+pack);
			$(this).find(".recipe-delete-pack p").attr("onclick","del_pack("+pack+")");
			$(this).find(".recipe-each-ing").attr("id", "recipe-pack-"+pack);
			$(this).find(".recipe-each-add").attr("onclick","each_add("+pack+")");
			mat_sort_input(pack);
			pack++;
		});
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
		str += '<div><div class="recipe-sort-pack"><textarea rows="1" cols="16" name="ing-pack-' + pack + '" wrap="soft"></textarea></div>';
		str += '<div class="recipe-delete-pack"><p onclick="del_pack(' + pack + ')"><i class="fas fa-times"></i> 묶음삭제</p></div></div>';
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
				var readFile = e.target.result;
				var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
				readFile = readFile.substring(0, readFile.indexOf('/'));
				if(readFile === "data:image" && chkcor != "77u/"){
					$("#recipe-order-" + k + " .recipe-order-addimage i.fa-plus").hide();
					$("#recipe-order-" + k).find("input[type=hidden]").val(e.target.result);
					$("#recipe-order-" + k + " .recipe-order-image").empty();
					var imgapp = "<img onclick='add_order_image(" + k + ")' src=" + e.target.result + ">";
					imgapp += "<i class='fas fa-times' onclick = 'del_order_image("+ k + ")'></i>";
					$("#recipe-order-" + k + " .recipe-order-image").append(imgapp);
				} else {
					del_order_image(k);
				}
			}
		} else {
			del_order_image(k);
		}
	}
	function del_order_image(num){
		$("#recipe-orderimage-" + num).val('');
		$("#recipe-order-" + num).find("input[type=hidden]").val("");
		$("#recipe-order-" + num + " .recipe-order-image").empty();
		$("#recipe-order-" + num + " .recipe-order-addimage i.fa-plus").show();
	}
	function add_order(){
		var count = 0;
		$(".recipe-order").each(function(){
			var pre_count = $(this).attr("id").replace("recipe-order-","");
			var tmp_count = parseInt(pre_count, 10);
			count = Math.max(count, tmp_count);
		});
		count++;
		var str = '<div class="recipe-order" id="recipe-order-' + count + '"><div class="recipe-order-count">Step ' + count + '</div><div class="recipe-order-content">';
		str += '<textarea placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." name="order-text-'+count+'"></textarea></div>';
		str += '<input type="hidden" name="order-image-' + count + '">';
		str += '<div class="recipe-order-addimage"><div onclick="add_order_image(' + count + ')"><i class="fas fa-plus"></i></div><div class="recipe-order-image"></div></div>';
		str += '<input type="file" hidden="" name="recipe_orderimage' + count + '" accept="image/*" id="recipe-orderimage-' + count + '">';	
		str += '<div class="recipe-order-button"><i class="fas fa-angle-up" onclick="order_up()"></i> <i class="fas fa-angle-down" onclick="order_down()"></i>';
		str += '<i class="fas fa-plus" onclick="order_after()"></i> <i class="fas fa-times" onclick="order_del()"></i></div></div>';
		$("#recipe-order-container").append(str);
		$("#recipe-orderimage-" + count).bind("change", change_order_image);
	}
	function order_sort(){
		var i = 1;
		$(".recipe-order").each(function(){
			$(this).attr("id", "recipe-order-" + i);
			$(this).find(".recipe-order-count").text("Step " + i);
			$(this).find(".recipe-order-content").find("textarea").attr("name", "order-text-" + i);
			$(this).find("input[type=hidden]").attr("name", "order-image-" + i);
			$(this).find(".recipe-order-addimage").find("div:first-child").attr("onclick", "add_order_image(" + i + ")");
			$(this).find("input[type=file]").attr({"name":"recipe_orderimage" + i, "id":"recipe-orderimage-" + i});
			$(this).find(".recipe-order-addimage").find(".recipe-order-image").find("img").attr("onclick", "add_order_image(" + i + ")");
			$(this).find(".recipe-order-addimage").find(".recipe-order-image").find("i").attr("onclick", "del_order_image(" + i + ")");
			i++;
		});
	}
	
	function order_up(){
		var k = event.target.parentElement.parentElement.id.replace("recipe-order-","");
		k = parseInt(k, 10);
		if(k > 1){
			var content = $("#recipe-order-" + k);
			content.clone().insertBefore("#recipe-order-" + (k - 1));
			content.remove();
			order_sort();
			$("#recipe-orderimage-" + (k - 1)).bind("change", change_order_image);
		}
	}
	function order_down(){
		var k = event.target.parentElement.parentElement.id.replace("recipe-order-","");
		k = parseInt(k, 10);
		var max = 0;
		$(".recipe-order").each(function(){
			var pre_max = $(this).attr("id").replace("recipe-order-", "");
			var tmp_max = parseInt(pre_max, 10);
			max = Math.max(max, tmp_max);
		});
		if(k < max){
			var content = $("#recipe-order-" + k);
			content.clone().insertAfter("#recipe-order-" + (k + 1));
			content.remove();
			order_sort();
			$("#recipe-orderimage-" + (k + 1)).bind("change", change_order_image);
		}
	}
	function order_after(){
		var k = event.target.parentElement.parentElement.id.replace("recipe-order-","");
		k = parseInt(k, 10);
		var content = $("#recipe-order-" + k);
		content.clone().insertAfter("#recipe-order-" + k);
		order_sort();
		content = $("#recipe-order-" + (k + 1));
		content.find(".recipe-order-content").find("textarea").val("");
		content.find("input").val("");
		content.find(".recipe-order-addimage").find(".recipe-order-image").empty();
		content.find(" .recipe-order-addimage i.fa-plus").show();
		$("#recipe-orderimage-" + (k + 1)).bind("change", change_order_image);
	}
	function order_del(){
		var k = event.target.parentElement.parentElement.id.replace("recipe-order-","");
		$("#recipe-order-" + k).remove();
		order_sort();
	}
	function change_compimage(num){
		$("#comp-image-file-" + num).click();
	}
	function del_compimage(num){
		$("#comp-image-file-" + num).val("");
		$("#comp-image-" + num).find("input[type=hidden]").val("");
		$("#comp-image-" + num).find(".comp-image-selected").empty();
		$("#comp-image-" + num).find(".comp-image-empty").show();
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="write-recipe">
		<div id="write-recipe-topic">레시피 등록</div>
		<form method="post" id="recipe-form" name="recipe-form">
			<div id="write-top">
				<div id="write-top-left"> 
					<div class="write-label">레시피 제목</div>
					<div class="write-input"><textarea rows="1" cols="65" name="recipe_title" placeholder="예)소고기 미역국 끓이기"></textarea></div>
					<div class="write-label">요리소개</div>
					<div class="write-input"><textarea rows="3" cols="65" name="recipe_introduce" placeholder="이 레시피의 탄생 배경을 적어주세요."></textarea> </div>
					<div class="write-label">동영상</div>
					<div class="write-input" id="write-video">
						<textarea rows="3" cols="40" id="video-url" name="recipe_video" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube만 가능) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 예)http://youtu.be/lA0Bxo3lZmM"></textarea>
						<div id="video-pre">
							<i class="fab fa-youtube"></i>
							<p>동영상 썸네일</p>
						</div>
						<div id="video-thumbnail"></div>
					</div>
					<div class="write-label">카테고리</div>
					<div class="write-input">
						<select name="ca1">
							<option>종류별</option>
							<option>밑반찬</option>
							<option>메인반찬</option>
							<option>국/탕</option>
							<option>찌개</option>
							<option>디저트</option>
							<option>면/만두</option>
							<option>밥/죽/떡</option>
							<option>퓨전</option>
							<option>김치/젓갈/장류</option>
							<option>양념/소스/잼</option>
							<option>양식</option>
							<option>샐러드</option>
							<option>스프</option>
							<option>빵</option>
							<option>과자</option>
							<option>차/음료/술</option>
							<option>기타</option>
						</select>
						<select name="ca2">
							<option>상황별</option>
							<option>일상</option>
							<option>초스피드</option>
							<option>손님접대</option>
							<option>술안주</option>
							<option>다이어트</option>
							<option>도시락</option>
							<option>영양식</option>
							<option>간식</option>
							<option>야식</option>
							<option>푸드스타일링</option>
							<option>해장</option>
							<option>명절</option>
							<option>이유식</option>
							<option>기타</option>
						</select>
						<select name="ca3">
							<option>방법별</option>
							<option>볶음</option>
							<option>끓이기</option>
							<option>부침</option>
							<option>조림</option>
							<option>무침</option>
							<option>비빔</option>
							<option>찜</option>
							<option>절임</option>
							<option>튀김</option>
							<option>삶기</option>
							<option>굽기</option>
							<option>데치기</option>
							<option>회</option>
							<option>기타</option>
							<!-- 소고기 돼지고기 닭고기 육류 채소류 해물류 달걀/유제품 가공식품류 쌀 밀가루 건어물류 버섯류 과일류 콩/견과류 곡류 기타 -->
						</select>
						<select name="ca4">
							<option>재료별</option>
							<option>소고기</option>
							<option>돼지고기</option>
							<option>닭고기</option>
							<option>육류</option>
							<option>채소류</option>
							<option>해물류</option>
							<option>달걀/유제품</option>
							<option>가공식품류</option>
							<option>쌀</option>
							<option>밀가루</option>
							<option>건어물류</option>
							<option>버섯류</option>
							<option>과일류</option>
							<option>콩/견과류</option>
							<option>곡류</option>
							<option>기타</option>
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
									<textarea rows="1" cols="16" name="ing-pack-1" wrap="soft">재료</textarea>
								</div>
								<div class="recipe-delete-pack">
									<p onclick='del_pack(1)'><i class="fas fa-times"></i> 묶음삭제</p>
								</div>
							</div>
							<div class="recipe-each-ing" id="recipe-pack-1">
								<div class="recipe-each-sort" id="recipe-each-1-1">
									<div class="recipe-each-arrow">
										<i class="fas fa-sort-up"></i><br>
										<i class="fas fa-sort-down"></i>
									</div>
									<div class="recipe-each-name">
										<textarea rows="1" placeholder="예) 돼지고기" name="recipe-each-name-1-1"></textarea>
									</div>
									<div class="recipe-each-quant">
										<textarea rows="1" placeholder="예) 300g" name="recipe-each-quant-1-1"></textarea>
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
										<textarea rows="1" placeholder="예) 양배추" name="recipe-each-name-1-2"></textarea>
									</div>
									<div class="recipe-each-quant">
										<textarea rows="1" placeholder="예) 1/2개" name="recipe-each-quant-1-2"></textarea>
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
										<textarea rows="1" placeholder="예) 참기름" name="recipe-each-name-1-3"></textarea>
									</div>
									<div class="recipe-each-quant">
										<textarea rows="1" placeholder="예) 1T" name="recipe-each-quant-1-3"></textarea>
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
					<p onclick="add_pack()"><i class="fas fa-plus"></i> 재료/양념 묶음 추가</p>
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
							<div class="recipe-order-content"><textarea placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." name="order-text-1"></textarea></div>
							<input type="hidden" name="order-image-1">
							<div class="recipe-order-addimage">
								<div onclick="add_order_image(1)"><i class="fas fa-plus"></i></div>
								<div class="recipe-order-image"></div>
							</div>
							
							<input type="file" hidden="" name="recipe_orderimage1" accept="image/*" id="recipe-orderimage-1">
							<div class="recipe-order-button">
								<i class="fas fa-angle-up" onclick="order_up()"></i>
								<i class="fas fa-angle-down" onclick="order_down()"></i>
								<i class="fas fa-plus" onclick="order_after()"></i>
								<i class="fas fa-times" onclick="order_del()"></i>
							</div>
						</div>
					</div>
					<div id="recipe-order-add" onclick="add_order()">
						<i class="fas fa-plus"></i> 순서추가
					</div>
				</div>
			</div>
			
			<div id="write-bottom">
				<div id="write-comp-image">
					<div class="write-label">
						요리완성사진
						<p id="comp-image-oneclick"><i class="fas fa-plus"></i> 사진 한번에 넣기</p>
						<input type="file" hidden="" multiple accept="image/*" id="comp-image-multfile">
					</div>
					<div id="comp-image-pack">
						<c:forEach var="k" begin="1" end="4">
							<input type="file" hidden="" id="comp-image-file-${k}" accept="image/*">
							<div class="comp-image" id="comp-image-${k}">
								<input type="hidden" name="comp-image-val-${k}">
								<div class="comp-image-empty">
									<i class="fas fa-plus"></i>
								</div>
								<div class="comp-image-selected"></div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="write-tip">
					<div class="write-label">요리팁</div>
					<div id="write-tip-content">
						<textarea placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요." name="recipe_tip"></textarea>
					</div>
				</div>
				<div id="write-tag">
					<div class="write-label">태그</div>
					<div id="write-tag-content">
						<input type="text" name="recipe_tag">
					</div>
				</div>
				<p id="taginf">주재료, 목적, 효능, 대상 등을 태그로 남겨주세요. <span>예) 돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단</span></p>
				<div id="save-button">
					<span id="save">저장</span>
					<span id="public"> 저장 후 공개하기 </span>
					<span id="cancel">취소</span>
				</div>
				<input type="hidden" id="savepublic" name="savepublic" value="0">
			</div>
		</form>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
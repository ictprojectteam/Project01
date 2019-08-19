<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Recipe Write</title>
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
body, html{
	width: 100%;
	height: 100%;
	overflow: hidden;
}
*{
	margin: 0;
	padding: 0;
	font-family: monospace;
	box-sizing: border-box;
	transition: all ease-in-out .2s;
}
#container{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #f7f7f7;
	overflow: auto;
}
nav{
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 200px;
	margin-left: 0px;
	height: 100%;
	background-color: #333333;
}
#logo{
	height: 50px;
	background-color: #333333;
	color: #1E90FE;
	text-align: center;
	line-height: 50px;
	font-size: 1.3em;
	font-family: arial;
}
#logo span{
	font-size: 1em;
	font-family: monospace;
	font-style: italic;
	color: #f7f7f7;
}
#menu{
	width: 100%;
	background-color: #333333;
	min-height: 1500px;
}
#menu li{
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: #333333;
}
#menu li>a{
	font-size: 1.05em;
	font-family: arial;
	width: 100%;
	height: 100%;
	color: #f7f7f7;
	display: block;
	text-align: center;
	text-decoration: none;
}
#menu li:hover{
	background-color: #151515;
}
#menu li>a:hover{
	color: #1E90FF;
	border-left: 3px solid #1E90FF;
}
header{
	width: calc(100% - 200px);
	height: 50px;
	position: absolute;
	display: block;
	top: 0;
	left: 200px;
	background-color: #333333;
	color: #f7f7f7;
	line-height: 50px;
	min-width: 1000px;
}
header #links{
	float: right;
	height: 50px;
	display: block;
	color: #f7f7f7;
	font-size: 1em;
	margin-right: 1em;
}
#links>a{
	color: #f7f7f7;
	text-decoration: none;
	padding: 0.5em;
	width: 100%;
	height: 100%;
	display: block;
}
#links:hover{
	background-color: #1E90FF;
}
#main{
	margin-left: 20em;
	width: 100%;
	height: 50px;
	display: block;
	text-align: left;
	line-height: 30px;
	padding-top: 70px;
	margin-bottom: 1em;
	font-size: 1.0em;
	font-family: arial;
	font-weight: bold;
}
.row{
	display: flex;
	width: 100%;
	height: 30%;
	flex-wrap: nowrap;
	flex-direction: row;
	padding: 1em;
}
#user-action{
	margin-top: 5em;
}
#action{
	margin-top: 20em;
}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	color: #2b686e;
	text-align: left;
	font-size: 1.0em;
	margin-top: 1em;
	line-height: 25px;
}
table{
	position: relative;
	width: 1000px;
	margin-left: 1.0em;
	margin-right: 1.0em;
	margin-bottom: 1.0em;
}
table th{
	border-spacing: 0;
	text-align: center;
}
tabel td{
	font-size: 1.0em;
}
#body td{
	text-align: center;
}
#write-top-head{
	display: grid;
	width: 1000px;
	height: 350px;
	grid-template-columns: 480px 480px;
	grid-column-gap: 40px;
}

#write-top{
height: 400px;
margin-top: 50px
}
#write-top-left{
height: 400px;
margin-top:-40px;
}
#write-recipe-topic{
	column-span: all;
	margin-bottom: 1.0em;
}
#recipe-order{
	border-top: 2px solid #ccc;
}
#write-video{
	display: grid;
	grid-template-columns: 250px 200px;
}
#write-video{
	text-align: center; 
	color: #999;
	line-height: 0px;
}
#video-thumbnail img{
	margin-left: 30px;
	width: 200px;
	height: 50px;
}
#write-top-image{
	border: 1px solid #bbb;
	float: right;
	width: 150px;
	height: 130px;
	text-align: center;
	font-size: 1.5em;
	cursor: pointer;
}
#write-top-image-com{
	height: 100px;
}
#write-top-image-insert img{
	width: 150px;
	height: 150px;
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
	margin-top: 25px;
	font-size: 55pt;
	color: #999;
}
#write-top-image p{
	color: #999;
}
#write-body{
	margin-top: 20px;
}
.recipe-sort{
	width: 950px;
	display: grid;
	grid-template-columns: 30px 200px 720px;
}
.recipe-sort-pack textarea{
	background: #eec;
	resize: none;
	font-size: 1.0em;
	border: 1px solid #ccc;
	border-radius: 5px;
}
.recipe-each-sort{
	display: grid;
	margin-left: 80px;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 5px;
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
#recipe-ing-pack-2, #recipe-ing-pack-3, #recipe-ing-pack-4, #recipe-ing-pack-5, #recipe-ing-pack-6{
	display: none;
}

textarea{
	resize: none;
}





</style>
<script type="text/javascript">
	function send_one(f){
		f.action = "selectonerecipe.do";
		f.submit();
	}
</script>


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
				if(/.{8,8}/.test(url)) {
					url = "https://img.youtube.com/vi/" + url + "/mqdefault.jpg";
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
						}
					});
				} else {
					alert("올바른 주소를 입력해주세요.");
					$("#video-url").val("");
				}
			}
		});
		$("#save").on("click", function(){
			$("input[type=file]").attr("disabled", "disabled");
			$("#recipe-form").attr("action", "save_recipe").submit();
		});
		$("#cancel").on("click", function(){
			history.go(-1);
		});

		$("#check_ingredient").on("change", function(){
			if($("#recipe-ing-pack-1").css("display") == "none"){
				$("#recipe-ing-pack-1").css("display", "block");
			} else {
				$("#recipe-ing-pack-1").css("display", "none");
			}
		});
		
		$("#check_season").on("change", function(){
			if($("#recipe-ing-pack-2").css("display") == "none"){
				$("#recipe-ing-pack-2").css("display", "block");
			} else {
				$("#recipe-ing-pack-2").css("display", "none");
			}
		});

		$("#check_sause").on("change", function(){
			if($("#recipe-ing-pack-3").css("display") == "none"){
				$("#recipe-ing-pack-3").css("display", "block");
			} else {
				$("#recipe-ing-pack-3").css("display", "none");
			}
		});

		$("#check_broth").on("change", function(){
			if($("#recipe-ing-pack-4").css("display") == "none"){
				$("#recipe-ing-pack-4").css("display", "block");
			} else {
				$("#recipe-ing-pack-4").css("display", "none");
			}
		});

		$("#check_topping").on("change", function(){
			if($("#recipe-ing-pack-5").css("display") == "none"){
				$("#recipe-ing-pack-5").css("display", "block");
			} else {
				$("#recipe-ing-pack-5").css("display", "none");
			}
		});

		$("#check_syrup").on("change", function(){
			if($("#recipe-ing-pack-6").css("display") == "none"){
				$("#recipe-ing-pack-6").css("display", "block");
			} else {
				$("#recipe-ing-pack-6").css("display", "none");
			}
		});

		var subm = false;
		$(window).on("beforeunload", function(){
			if (!subm) return "작성된 레시피를 저장하지 않고 이동하시겠습니까?";
		});
	});
	
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



	//function showHide(){
	//	if(document.getElementById('check_season').checked){
	//		document.getElementById('recipe-ing-pack-2').style.visibility = 'visible';
	//	}else{
	//		document.getElementById('recipe-ing-pack-2').style.visibility = 'hidden';
	//	}
	//}

	

</script>

</head>
<body>
	<div id="container">
		<nav>
			<div id="logo">
				ICT레시피 <span>ict recipe</span>
			</div>
			<ul id="menu">
				<li><a id="home" href="home">HOME</a></li>
				<li><a id="recipe" href="a_recipe">레시피 관리</a></li>
				<li><a id="content" href="home">게시물 등록</a></li>
				<li><a id="user" href="membership">회원 관리</a></li>
				<li><a id="board" href="admin_qna">문의 관리</a></li>
				<li><a id="event" href="home">이벤트 관리</a></li>
				<li><a id="op" href="home">운영자 관리</a></li>
				<li><a id="setting" href="home">설정</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<a href="m">로그아웃</a>
			</div>
		</header>
		<main id="main">
			<div id="write-recipe">
				<div id="write-recipe-topic"><h2>레시피 등록</h2></div>
				<form method="post" id="recipe-form" name="recipe-form">
				<div id="write-top-head">
					<div id="write-top">
						<div id="write-top-left">
							<div class="write-label">레시피 제목
								<div id="write-top-image">
								<div id="write-top-image-com">
									<i class="fas fa-camera"></i>
									<p>대표 사진</p>
								</div>
								<div id="write-top-image-insert">
								</div>
							</div>
							</div>
							<div class="write-input"><textarea rows="1" cols="45" name="recipe_title" placeholder="예)소고기 미역국 끓이기"></textarea></div>
							<div class="write-label">요리소개</div>
							<div class="write-input"><textarea rows="2" cols="45" name="recipe_introduce" placeholder="이 레시피의 탄생 배경을 적어주세요."></textarea> </div>
							<div id="write-top-right">
							<input type="file" name="recipe_mainimage" hidden="" id="insert-main-image" accept="image/*">
							
						</div>
							<div class="write-label">동영상</div>
							<div class="write-input" id="write-video">
								<textarea rows="3" cols="40" id="video-url" name="recipe_video" placeholder="동영상 주소 입력.(Youtube만 가능)예)http://youtu.be/lA0Bxo3lZmM"></textarea>
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
							</div>
							<div class="write-label">요리정보</div>
							<div class="write-input" id="recipe-inf">
								<select name="recipe_quant">
									<option>인원</option>
									<option>1인분</option>
									<option>2인분</option>
									<option>3인분</option>
									<option>4인분</option>
									<option>5인분</option>
									<option>6인분이상</option>
								</select>
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
					</div>
					
					<!-- write body -->
					
					<div id="write-body">
						<div class="ingredient-label">재료정보</div>
						<div id="recipe-ing">
							<input type="checkbox" id="check_ingredient" name="recipe-ing-pack" value="재료" checked="checked"><label for="check_ingredient"> 재료 </label>
							<input type="checkbox" id="check_season" name="recipe-ing-pack" value="양념"><label for="check_season"> 양념 </label>
							<input type="checkbox" id="check_sause" name="recipe-ing-pack" value="소스"><label for="check_sause"> 소스 </label>
							<input type="checkbox" id="check_broth" name="recipe-ing-pack" value="소스"><label for="check_sause"> 육수 </label>
							<input type="checkbox" id="check_topping" name="recipe-ing-pack" value="육수"><label for="check_topping"> 토핑 </label>
							<input type="checkbox" id="check_syrup" name="recipe-ing-pack" value="시럽"><label for="check_syrup"> 시럽 </label>
							
							<div class="recipe-ing-pack" id="recipe-ing-pack-1">
								<div class="recipe-sort">
									<div>
										<div class="recipe-sort-pack">
											<textarea rows="1" cols="8" name="ing-pack-1" wrap="soft">재료</textarea>
										</div>
									</div>
									<div class="recipe-each-ing" id="recipe-pack-1">
										<div class="recipe-each-sort" id="recipe-each-1-1">
											<div class="recipe-each-name">
												<textarea rows="1" cols="20" placeholder="예) 돼지고기" name="recipe-each-name-1-1"></textarea>
											</div>
											<div class="recipe-each-quant">
												<textarea rows="1" cols="10" placeholder="예) 300g" name="recipe-each-quant-1-1"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="recipe-ing-pack" id="recipe-ing-pack-2">
								<div class="recipe-sort">
									<div>
										<div class="recipe-sort-pack">
											<textarea rows="1" cols="8" name="ing-pack-2" wrap="soft">양념</textarea>
										</div>
									</div>
									<div class="recipe-each-ing" id="recipe-pack-2">
										<div class="recipe-each-sort" id="recipe-each-1-2">
											<div class="recipe-each-name">
												<textarea rows="1" cols="20" placeholder="예) 돼지고기" name="recipe-each-name-1-2"></textarea>
											</div>
											<div class="recipe-each-quant">
												<textarea rows="1" cols="10" placeholder="예) 300g" name="recipe-each-quant-1-2"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="recipe-ing-pack" id="recipe-ing-pack-3">
								<div class="recipe-sort">
									<div>
										<div class="recipe-sort-pack">
											<textarea rows="1" cols="8" name="ing-pack-3" wrap="soft">소스</textarea>
										</div>
									</div>
									<div class="recipe-each-ing" id="recipe-pack-3">
										<div class="recipe-each-sort" id="recipe-each-1-3">
											<div class="recipe-each-name">
												<textarea rows="1" cols="20" placeholder="예) 돼지고기" name="recipe-each-name-1-3"></textarea>
											</div>
											<div class="recipe-each-quant">
												<textarea rows="1" cols="10" placeholder="예) 300g" name="recipe-each-quant-1-3"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="recipe-ing-pack" id="recipe-ing-pack-4">
								<div class="recipe-sort">
									<div>
										<div class="recipe-sort-pack">
											<textarea rows="1" cols="8" name="ing-pack-4" wrap="soft">육수</textarea>
										</div>
									</div>
									<div class="recipe-each-ing" id="recipe-pack-4">
										<div class="recipe-each-sort" id="recipe-each-1-4">
											<div class="recipe-each-name">
												<textarea rows="1" cols="20" placeholder="예) 돼지고기" name="recipe-each-name-1-4"></textarea>
											</div>
											<div class="recipe-each-quant">
												<textarea rows="1" cols="10" placeholder="예) 300g" name="recipe-each-quant-1-4"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="recipe-ing-pack" id="recipe-ing-pack-5">
								<div class="recipe-sort">
									<div>
										<div class="recipe-sort-pack">
											<textarea rows="1" cols="8" name="ing-pack-5" wrap="soft">토핑</textarea>
										</div>
									</div>
									<div class="recipe-each-ing" id="recipe-pack-5">
										<div class="recipe-each-sort" id="recipe-each-1-5">
											<div class="recipe-each-name">
												<textarea rows="1" cols="20" placeholder="예) 돼지고기" name="recipe-each-name-1-5"></textarea>
											</div>
											<div class="recipe-each-quant">
												<textarea rows="1" cols="10" placeholder="예) 300g" name="recipe-each-quant-1-5"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="recipe-ing-pack" id="recipe-ing-pack-6">
								<div class="recipe-sort">
									<div>
										<div class="recipe-sort-pack">
											<textarea rows="1" cols="8" name="ing-pack-6" wrap="soft">시럽</textarea>
										</div>
									</div>
									<div class="recipe-each-ing" id="recipe-pack-6">
										<div class="recipe-each-sort" id="recipe-each-1-6">
											<div class="recipe-each-name">
												<textarea rows="1" cols="20" placeholder="예) 돼지고기" name="recipe-each-name-1-6"></textarea>
											</div>
											<div class="recipe-each-quant">
												<textarea rows="1" cols="10" placeholder="예) 300g" name="recipe-each-quant-1-6"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					</div>	
						<div id="recipe-order">
							<div class="write-label">요리순서</div>
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
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>
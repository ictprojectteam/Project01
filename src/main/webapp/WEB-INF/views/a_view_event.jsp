<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin event</title>
<style type="text/css">
body, html{
	width: 100%;
	height: 100%;
	overflow: hidden;
}

*{
	margin: 0;
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


#event-div{
	width: 990px;
	margin: 5px auto;
	border: 1px solid #999;
}

.double{
	display: grid;
	grid-template-columns: 150px 344px 150px 344px;
}

.regular{
	display: grid;
	grid-template-columns: 150px 838px;
}

.label{
	border: 1px solid #999;
	background: #ccc;
	padding: 10px 10px;
	font-weight: bolder;
	color: #2b686e;
}

.center{
	text-align: center;
}

.content{
	padding: 10px;
	border: solid #999;
	border-width: 1px 1px 1px 0px;
}

.detail{
	width: 970px;
	margin: 10px auto;
	border: 1px solid #999;
}

.detail-title{
	width: 950px;
	border: 1px solid #999;
	border-radius: 5px;
	background: #ccc;
	padding: 5px 10px;
	margin: 5px auto;
	font-weight: bolder;
	color: #2b686e;
}

.detail-box{
	width: 950px;
	margin: 5px auto;
}

.detail-box img{
	max-height: 450px;
	max-width: 450px;
}

.e_content{
	resize: none;
	margin: 10px auto;
	width: 98%;
	min-height: 200px;
	font-size: 12pt;
	padding: 5px;
	border: 0px;
}

.view{
	display: block;
}

.editor{
	height: 0px;
	width: 0px;
	overflow: hidden;
	min-height: 0px;
	text-align: center;
}

.editor span{
	display: inline-block;
	padding: 5px 15px;
	margin: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
}
.save{
	background: #af8;
}

#main{
	margin-left: 20em;
	margin-top: 5em;
}

#body{
	width: 1002px;
	margin: 10px 5px;
}

img.banner{
	width: 490px;
	height: 150px;
}

#foot{
	text-align: center;
}
#foot span{
	display: inline-block;
	width: 150px;
	padding: 5px;
	border: 1px solid #aaa;
	border-radius: 5px;
	margin: 0px 10px;
	cursor: pointer;
}

#list{
	background: #f8a;
}

legend{
	font-size: 16pt;
	font-weight: bolder;
}

fieldset{
	margin: 5px;
	width: 1000px;
	border: 0px;
}

input[type=text], input[type=date]{
	width: 100%;
}
.switch {
	position: relative;
	display: none;
	width: 40px;
	height: 20px;
	margin-bottom: -10px;
	float: right;
}

.switch:after{
	clear: both;
}

.pub:hover .switch{
	display: inline-block;
}

.switch input { 
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: -2px;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 15px;
	width: 15px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked + .slider {
	background-color: #2196F3;
}

input:focus + .slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
	transform: translateX(15px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 15px;
}

.slider.round:before {
	border-radius: 50%;
}

.edit{
	float: right;
	display: none;
	padding: 5px 20px;
	border: 1px solid #aaa;
	margin: -6px;
	background: #7f7;
	cursor: pointer;
}
.content:hover .edit{
	display: inline-block;
}

.detail:hover .edit{
	display: inline-block;
}

.edit:after {
	clear: both;
}

#date-modal{
	width: 100%;
	height: 100%;
	display: none;
	position: fixed;
	z-index: 6;
	background-color: #000a;
}
#date-modal-content{
	width: 300px;
	position: relative;
	margin: auto;
	top: 200px;
	border: 1px solid #aaa;
	background: #fff;
	border-radius: 10px;
	padding: 20px;
}
.modal-title{
	margin-bottom: 10px;
	font-size: 12pt;
}
.modal-button{
	margin: 10px;
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #aaa;
	border-radius: 5px;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		var evo = {"e_idx":"${evo.e_idx}"};
		var obj = [];
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "smart",
	        sSkinURI: "<%= request.getContextPath() %> /smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : true,
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : true,
	        }
	    });
	    
	    $(".save").click(function(){
			obj.getById["smart"].exec("UPDATE_CONTENTS_FIELD", []);
			$(".view").html($("#smart").val());
			c.parent().find(".editor").css({"width": "0px", "height": "0px"});
			c.parent().find(".view").css("display", "block");
	    });
	    
		$("#list").on("click", function(){
			history.go(-1);
		});

		$("#editbutton").on("click", function(){
			location.href="#";
		});

		$("#public").on("change", function(){
			var v = $(this).parent().parent().find(".value");
			if($(this).prop("checked")){
				v.text("공개");
			} else {
				v.text("비공개");
			}
		});
		var c, l, p, d, i, s, e;
		$(".edit").on("click", function() {
			c = $(this).parent();
			l = c.prev(".label").text();
			if(c.hasClass("tit")) {
				p = prompt(l);
				if(!p){
					alert("제목은 공백일 수 없습니다.");
					c.find(".edit").click();
					return;
				}
				c.find(".value").text(p);
			}
			if(c.hasClass("dat")) {
				d = c.text();
				i = d.substring(0,16).replace(" ", "T");
				$("#date-modal").css({"display":"block"});
				$(".modal-title").text(l + " 변경");
				$("#date-input").val(i);
			}
			if(c.hasClass("ban")) {
				$("#file").click();
				/* c.find(".banner").attr("src", ""); */
			}
			if(c.hasClass("con")) {
				c.parent().find(".view").css("display", "none");
				c.parent().find(".editor").css({"width": "900px", "height": "500px"});
			}
		});

		$("#file").on("change", function(){
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			reader.onload = function(e){
				var readFile = e.target.result;
				var chkcor = readFile.substring(readFile.indexOf(',') + 1, readFile.indexOf(',') + 5);
				readFile = readFile.substring(0, readFile.indexOf('/'));
				if(readFile === "data:image" && chkcor != "77u/"){
					c.find(".banner").attr("src", e.target.result);
					$("#file").val("");
				} else {
					alert("1");
				}
			}
		});

		$(".modal-button:first-child").on("click",function(){
			if(l == '시작일') {
				s = $("#date-input").val();
				e = $(".end .value").text().replace(" ", "T");
			} else {
				s = $(".start .value").text().replace();
				e = $("#date-input").val();
			}
			if(s > e) {
				alert("시작일은 종료일 이후일 수 없습니다.");
				$("#date-input").focus();
				return;
			}
			$("#date-modal").css({"display":"none"});
			c.find(".value").text($("#date-input").val().replace("T", " "));
		});

		$(".modal-button:last-child").on("click",function(){
			$("#date-modal").css({"display":"none"});
		});

		$(this).on("click", function(){
			if(event.target == document.getElementById("date-modal")) $("#date-modal").css({"display":"none"});
		});
	});

</script>
</head>
<body>
	<div id="container">
		<jsp:include page="admin_menu.jsp" />
		<div id="date-modal">
			<div id="date-modal-content">
				<p class="modal-title"></p>
				<input id="date-input" type="datetime-local">
				<p><span class="modal-button">적용하기</span><span class="modal-button">취소</span></p>
			</div>
		</div>
		<div id="main">
			<form method="post" id="e_form">
				<fieldset>
					<legend>이벤트관리</legend>
					<div id="event-div">
						<div class="double">
							<div class="label">NO</div>
							<div class="content">${evo.e_idx}</div>
							<div class="label">등록자</div>
							<div class="content">${evo.name}</div>
						</div>
						<div class="regular">
							<div class="label">이벤트 제목</div>
							<div class="content tit"><span class="value">${evo.e_title}</span><span class="edit">변경</span></div>
						</div>
						<div class="double">
							<div class="label">시작일</div>
							<div class="content dat start"><span class="value">${evo.e_start.substring(0, 16)}</span><span class="edit">변경</span></div>
							<div class="label">종료일</div>
							<div class="content dat end"><span class="value">${evo.e_end.substring(0, 16)}</span><span class="edit">변경</span></div>
						</div>
						<div class="regular">
							<div class="label">구분</div>
							<div class="content">
								<c:choose>
									<c:when test="${evo.e_type eq '1'}">이벤트 공지</c:when>
									<c:otherwise>당첨자 발표</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="regular">
							<div class="label">공개</div>
							<div class="content pub">
								<c:choose>
									<c:when test="${evo.e_public eq '1'}"><span class="value">공개</span><label class="switch"><input id="public" type="checkbox" checked><span class="slider round"></span></label></c:when>
									<c:otherwise><span class="value">비공개</span><label class="switch"><input id="public" type="checkbox"><span class="slider round"></span></label></c:otherwise>
								</c:choose>
								
							</div>
						</div>
						<div class="regular">
							<div class="label">메인 배너 이미지</div>
							<div class="content ban">
								<img class="banner" src="${evo.e_banner}">
								<span class="edit">변경</span>
								<input type="file" hidden="" id="file" accept="image/*">
							</div>
						</div>
						<div class="label center">상세내용</div>
						<div class="detail">
							<div class="detail-title con">이벤트 상세보기<span class="edit">변경</span></div>
							<div class="detail-box">
								<div class="e_content view">${evo.e_content}</div>
								<div class="e_content editor">
									<textarea id="smart" style="height: 350px; width: 880px;">${evo.e_content}</textarea>
									<span class="save">저장</span><span class="cancel">취소</span>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<div id="body">
				<div id="foot">
					<span id="list">목록으로</span>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#coment_tab{
		width: 900px;
		margin: 20px auto;
		border-bottom: 1px solid;
	}
	.coment_bt{
		width: 120px;
		border: 1px solid #808080;
		font-size: 12pt;
		background: #dee;
		border-radius: 6px;
		margin-bottom: 10px;
		padding: 3px 6px;
		display: inline-block;
		text-align: center;
		box-sizing: border-box;
		cursor: pointer;
	}
	.selected{
		background: #489!important;
		cursor: default!important;
	}
	.coment_bt:hover {
		background-color: #8cd;
	}
	#com-box{
		width: 900px;
		display: grid;
		grid-template-columns: 215px 215px 215px 215px;
		grid-column-gap: 10px;
		margin: 10px auto;
		padding: 10px;
	}
	.each-com{
		cursor: pointer;
	}
	.main-image{
		padding: 10px;
	}
	.main-image img{
		width: 195px;
		height: 195px;
	}
	.recipe-title{
		white-space: nowrap;
	 	overflow: hidden;
		text-overflow: ellipsis;
	}
	.recipe-name{
		text-align: right;
		color: #aaa;
	}
	.comment-name{
		color: #aaa;
	}
	.com-content{
		height: 50px;
	}
	.com-date{
		color: #aaa;
	}
	.comment{
		border: 1px solid #aaa;
	}
	
</style>
<script type="text/javascript">
	var rcvo = {};
	$(function(){
		$(".menu_bt").on("click", function(){
			$(".menu_bt:button").css("background-color", "#D9D9D9");
			$(this).css("background-color", "#92895A");
		});
		rcvo.sep = '1';
		$(".coment_bt").each(function(){
			$(this).on("click", function(){
				if(!$(this).hasClass("selected")){
					$(".coment_bt").removeClass("selected");
					$(this).addClass("selected");
					if($(this).hasClass("write")) {
						rcvo.sep = '1';
					} else {
						rcvo.sep = '2';
					}
					getList();
				}
			});
		});

		getList();
	});

	function getList() {
		$.ajax({
			url : "myCommentList",
			data : rcvo,
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#com-box").empty();
				$("#com-box").append(data);
			},
			error : function() {
				alert("쓰기 실패2");
			}
		});
	}
	
	function go(e) {
		location.href = e;
	}

	function view(n) {
		location.href = 'view_recipe?rno=' + n;
	}
</script>
</head>
<body>
	<div id="menu">
		<input class="menu_bt" type="button" value="레시피" onclick="go('myRecipe')">
		<input class="menu_bt" type="button" value="요리후기" onclick="go('myReview')">
		<input class="menu_bt" type="button" value="댓글" onclick="go('myComent')" style="background-color: #92895A;">
		<input class="menu_bt" type="button" value="토크" onclick="go('myTalk')">
		<input class="menu_bt" type="button" value="문의" onclick="go('myReport')">
		<input class="menu_bt" type="button" value="회원정보수정" onclick="go('myPrf_update')">
	</div>
	<div id="coment_tab">
		<span class="coment_bt write selected">내가 쓴 댓글</span>
		<span class="coment_bt get">받은 댓글</span>
	</div>
	<div id="com-box">
	
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp" />
</footer>
</html>
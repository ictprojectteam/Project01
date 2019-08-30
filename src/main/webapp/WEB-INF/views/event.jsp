<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
	width: 1200px;
	margin: 30px auto 0px;
}
#tab{
	width: 1000px;
	margin: 10px auto;
}
#tab span{
	width: 120px;
	display: inline-block;
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 10px;
	text-align: center;
	background: #cff;
	cursor: pointer;
}

#tab span:hover{
	background: #add;
}

.selected{
	background: #6bb!important;
	cursor: default!important;
}

#box{
	border: solid #ccc;
	border-width: 1px 0px;
	width: 1000px;
	margin: auto;
	padding: 20px;
}

.each-content{
	display: grid;
	grid-template-columns: 490px 490px;
	grid-column-gap: 20px;
	cursor: pointer;
	margin-top: 20px;
}

.each-prize{
	cursor: pointer;
	margin-top: 20px;
}

.each-content:hover{
	opacity: 0.7;
}

.content{
	border: 1px solid #777;
	padding: 5px 10px;
}

.prize{
	border-width: 0px 0px 1px 0px;
}

.image{
	height: 150px;
	width: 490px;
}

.title{
	height: 110px;
	font-size: 20pt;
}

.each-prize .title{
	height: 50px;
}

.date{
	height: 10px;
	font-size: 9pt;
	color: #aaa;
	padding: 10px 0px;
}

.paging{
	width: 900px;
	margin: 30px auto;
	text-align: center;
}
.e-content{
	width: 1000px;
	margin: auto;
}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	var evo = {};
	var open;
	$(function(){
		$("#tab span").each(function(){
			$(this).on("click", function(){
				if(!$(this).hasClass("selected")){
					var c = $(this).attr("class");
					$("#tab span").removeClass("selected");
					$(this).addClass("selected");
					if (c === 'open') {
						evo.open = '1';
						evo.e_type = '1';
					} else if (c === 'close') {
						evo.open = '0';
						evo.e_type = '1';
					} else {
						evo.open = '';
						evo.e_type = '2';
					}
					evo.cPage = '1';
					loadList();
				}
			});
		});

		$(this).on("click", function(){
			if(event.target == document.getElementById("e-modal")) $("#e-modal").css({"display":"none"});
		});
		
		evo.open = '1';
		loadList();
	});

	function loadList() {
		$.ajax({
			url : "event_list",
			data : evo,
			dataType : "text",
			type : "post",
			success : function(data) {
				$("#box").empty();
				$("#box").append(data);
			},
			error : function(){
				alert("읽기 실패");
			}
		});
	}

	function view(e, t){
		$.ajax({
			url : "event_content",
			data : {"e_idx": e},
			dataType : "json",
			type : "post",
			success : function(data) {
				if(open == t){
					$(".e-content").remove();
				} else {
					open = t;
					if(data.e_content != null){
						$(".e-content").remove();
						$(t).append("<div class='e-content'></div>");
						$(".e-content").append(data.e_content);
					} else {
						$(".e-content").remove();
						$(t).append("<div class='e-content'>데이터가 없습니다.</div>");
						$(".e-content").append(data.e_content);
					}
				}
			},
			error : function(){
				alert("읽기 실패");
			}
		});
	}

</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div class="body">
		<div id="tab">
			<span class="open selected">진행중인 이벤트</span>
			<span class="close">종료된 이벤트</span>
			<span class="anno">당첨자 발표</span>
		</div>
		
		<div id="box">
		
		</div>
		<div class="paging">
			
		</div>
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
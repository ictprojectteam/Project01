    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
.top {
	background-color: #fa8;
	width: 1450px;
	text-align: center;
	color: white;
	cursor: pointer;
	border: solid;
	margin: -12px 0 0 -40px;
}
.body{
	width: 400px;
	margin: auto;
}
p{
	text-align: center;
}
.updButton{
	border-radius: 5px;
	border: 1px solid #888;
	background: #eee;
	width: 120px;
	height: 30px;
	float: right;
	margin-bottom: 10px;
}
.hid-box{
	display: none;
	clear: both;
	margin-top: 20px;
}
.input{
	margin: 10px auto;
	display: block;
	width: 300px;
	height: 30px;
	font-size: 12pt;
}
.sub{
	text-align: center;
	margin: 10px auto;
	border: 1px solid #e97;
	background: #fa8;
	width: 80px;
	height: 35px;
	border-radius: 5px;
	color: #eee;
	display: block;
	font-size: 12pt;
}
.sub:hover{
	background: #e97;
}
.sub:active{
	box-shadow: 0px 0px 0px 1px #c75;
}
.warning{
	text-align: center;
	font-size: 12pt;
	color: #f44;
	display: none;
}
#mailbox, #nickbox, #pwbox, #outbox{
	clear: both;
	margin-top: 20px;
	min-height: 21px;
}
#prf_set{
	position: relative;
	border: 1px solid #808080;
	width: 250px;
	height: 300px;
	margin: -30px auto 0 auto;
}
#prf_back{
	width: 250px;
	height: 180px;
}
#span_prf{
	margin-top: -50px;
}
#prf_img{
	width: 80px;
	height: 80px;
	border-radius: 70px;
	border: 1px solid #808080;
	margin: -50px 0px 0px 85px;
}
#prf_cam{
	width: 30px;
	height: 30px;
	border-radius: 30px;
	border: 1px solid #808080;
	margin: 0px 0px 50px -30px;
}
#prf_img{
		width: 250px;
		height: 180px;
		
	}
#prf_set{
	position: relative;
	float: right;
	border: 1px solid #808080;
	width: 250px;
	height: 300px;
	margin-top: -230px;
	margin-right: -550px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".top").on("click", function(){
			location.href="/";
		});
		$("#prf_chg").on("click", function(){
			alert("#");
		});
		$("#updEmail").on("click", function(){
			$("#email-input").css("display", "block");
		});
		$("#subEmail").on("click", function(){
			var email = $("#email").val();
			if(email != "") {
				$.ajax({
					url : "updEmail",
					data : {"id":"${mvo.id}", "email":email,},
					dataType : "text",
					type : "post",
					success : function(data) {
						if(data == 'duplicate'){
							$("#mailwarning").css("display", "block");
							$("#mailwarning").text("이미 사용중인 이메일입니다.");
						} else if(data == '1') {
							alert("변경 완료");
							$("#mailwarning").text("");
							$("#viewmail").text(email);
							$("#email").val("");
							$("#mailwarning").css("display", "none");
							$("#email-input").css("display", "none");
						} else{
							alert("실패");
						}
					},
					error : function(){
						alert("읽기 실패2");
					}
				});
			} else {
				$("#mailwarning").css("display", "block");
				$("#mailwarning").text("이메일을 입력해주세요.");
			}
		});
		$("#updNick").on("click", function(){
			$("#nick-input").css("display", "block");
		});
		
		$("#subNick").on("click", function(){
			var name = $("#nick").val();
			if(name != "") {
				$.ajax({
					url : "updName",
					data : {"id":"${mvo.id}", "name":name},
					dataType : "text",
					type : "post",
					success : function(data) {
						if(data == 'duplicate'){
							$("#nickwarning").css("display", "block");
							$("#nickwarning").text("이미 사용중인 닉네임입니다.");
						} else if(data == '1') {
							alert("변경 완료");
							$("#namewarning").text("");
							$("#viewnick").text(name);
							$("#nick").val("");
							$("#nickwarning").css("display", "none");
							$("#nick-input").css("display", "none");
						} else{
							alert("실패");
						}
					},
					error : function(){
						alert("읽기 실패2");
					}
				});
			} else {
				$("#nickwarning").css("display", "block");
				$("#nickwarning").text("닉네임을 입력해주세요.");
			}
		});
		$("#updPw").on("click", function(){
			$("#pw-input").css("display", "block");
		});
		
		var chknowpw = false;
		$("#nowpw").on("blur", function(){
			var nowpw = $("#nowpw").val();
			if(nowpw != "") {
				$.ajax({
					url : "pwchk",
					data : {"pw":nowpw},
					dataType : "text",
					type : "post",
					success : function(data) {
						if(data == '1'){
							$("#nowpwwarning").css({"display":"block", "color":"#4f4"});
							$("#nowpwwarning").text("확인되었습니다.");
							chknowpw = true;
						} else {
							$("#nowpwwarning").css({"display":"block", "color":"#f44"});
							$("#nowpwwarning").text("비밀번호가 일치하지 않습니다.");
							chknowpw = false;
						}
					},
					error : function(){
						alert("읽기 실패2");
					}
				});
			} else {
				$("#nowpwwarning").css({"display":"block", "color":"#f44"});
				$("#nowpwwarning").text("현재 비밀번호를 입력해주세요.");
				chkpw = false;
			}
		});
		
		var chknewpw = false;
		$("#newpw").on("blur", function(){
			var newpw = $("#newpw").val();
			var pwchk = $("#pwchk").val();
			if (newpw != "") {
				$("#newpwwarning").css({"display":"block", "color":"#4f4"});
				$("#newpwwarning").text("새 비밀번호 입력 완료");
				if (pwchk != ""){
					if (newpw == pwchk) {
						$("#newpwchkwarning").css({"display":"block", "color":"#4f4"});
						$("#newpwchkwarning").text("비밀번호 확인 완료");
						chknewpw = true;
					} else {
						$("#newpwchkwarning").css({"display":"block", "color":"#f44"});
						$("#newpwchkwarning").text("비밀번호가 일치하지 않습니다.");
						chknewpw = false;
					}
				}
			} else {
				$("#newpwwarning").css({"display":"block", "color":"#f44"});
				$("#newpwwarning").text("새 비밀번호를 입력해주세요.");
				chknewpw = false;
			}
		});
		
		$("#pwchk").on("blur", function(){
			var newpw = $("#newpw").val();
			var pwchk = $("#pwchk").val();
			if (pwchk != "") {
				if (newpw == pwchk) {
					$("#newpwchkwarning").css({"display":"block", "color":"#4f4"});
					$("#newpwchkwarning").text("비밀번호 확인 완료");
					chknewpw = true;
				} else {
					$("#newpwchkwarning").css({"display":"block", "color":"#f44"});
					$("#newpwchkwarning").text("비밀번호가 일치하지 않습니다.");
					chknewpw = false;
				}
			} else {
				$("#newpwchkwarning").css({"display":"block", "color":"#f44"});
				$("#newpwchkwarning").text("비밀번호 확인을 입력해주세요.");
				chknewpw = false;
			}
		});
		
		$("#subPw").on("click", function(){
			if(chknowpw && chknewpw) {
				var newpw = $("#newpw").val();
				$.ajax({
					url : "updPw",
					data : {"id":"${mvo.id}", "pw":newpw},
					dataType : "text",
					type : "post",
					success : function(data) {
						if (data == '1') {
							alert("변경 완료");
							$("#newpwchkwarning").text("");
							$("#nowpwwarning").text("");
							$("#newpwwarning").text("");
							$("#nowpw").val("");
							$("#newpw").val("");
							$("#pwchk").val("");
							$("#newpwchkwarning").css("display", "none");
							$("#nowpwwarning").css("display", "none");
							$("#newpwwarning").css("display", "none");
							$("#pw-input").css("display", "none");
						} else {
							alert("실패");
						}
					},
					error : function(){
						alert("읽기 실패2");
					}
				});
			} else {
				alert("변경 실패");
			}
		});
	});
</script>
</head>
<body>
	<div class="top">
		<h1>ICT 레시피</h1>
		<h2>ICT RECIPE</h2>
	</div>
	<p style="font-size: 35px;">회원정보 수정</p>
	<div id="prf_set">
		<img id="prf_back" src="resources/images/food.jpeg">
		<div id="span_prf">
			<a id="prf_chg">
				<img id="prf_img" src="resources/images/prf_img.png">
				<img id="prf_cam" src="resources/images/fa_cam.png">
			</a>
		</div>
	</div>
	<div class="body">
		
		<div id="mailbox">
			<span id="viewmail">${mvo.email}</span>
			<button id="updEmail" class="updButton">이메일 수정</button>
			<div id="email-input" class="hid-box">
				<input type="text" id="email" class="input" placeholder="이메일">
				<p id='mailwarning' class="warning"></p>
				<button id="subEmail" class="sub">변경</button>
			</div>
		</div>
		<div id="nickbox">
			<span id="viewnick">${mvo.name}</span>
			<button id="updNick" class="updButton">닉네임 수정</button>
			<div id="nick-input" class="hid-box">
				<input type="text" id="nick" class="input" placeholder="닉네임">
				<p id='nickwarning' class="warning"></p>
				<button id="subNick" class="sub">변경</button>
			</div>
		</div>
		<div id="pwbox">
			<button id="updPw" class="updButton">비밀번호 수정</button>
			<div id="pw-input" class="hid-box">
				<input type="password" id="nowpw" class="input" placeholder="현재 비밀번호">
				<p id='nowpwwarning' class="warning"></p>
				<input type="password" id="newpw" name= "pw" class="input" placeholder="새로운 비밀번호">
				<p id='newpwwarning' class="warning"></p>
				<input type="password" id="pwchk" class="input" placeholder="새 비밀번호 확인">
				<p id='newpwchkwarning' class="warning"></p>
				<button id="subPw" class="sub">변경</button>
			</div>
		</div>
		<div id="outbox">
			<span id="viewnick">회원탈퇴</span>
			<button id="out" class="updButton">탈퇴하기</button>
		</div>
	</div>
</body>
<footer>
	<jsp:include page="foot.jsp"></jsp:include>
</footer>
</html>
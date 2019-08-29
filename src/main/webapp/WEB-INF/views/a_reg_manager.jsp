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

#logo {
	height: 50px;
	background-color: #333333;
	color: #1E90FE;
	text-align: center;
	line-height: 50px;
	font-size: 1.3em;
	font-family: arial;
	margin-left:0.5em;
}

#logo:hover{
	cursor: pointer;
	background-color: #151515;
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
}

header #links{
	float: right;
	height: 50px;
	display: block;
	color: #f7f7f7;
	font-size: 1em;
	margin-right: 1em;
}

#links>span {
	padding-top:1.0em;
	color: #fff;
	text-decoration: none;
	width: 100%;
	height: 100%;
	display: block;
	line-height: 1.1em;
}

#links:hover {
	cursor:pointer;
	background-color: #151515;
}

#links span:hover{
	color: #1E90FF;
}

#mng-div{
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

.detail-box span{
	display: inline-block;
	width: 130px;
	padding: 5px;
	border: 1px solid #999;
	border-radius: 5px;
	margin: 5px;
	text-align: center;
	background: #ccc;
	cursor: pointer;
}

.detail-box span:hover{
	background: #fff;
	color: #fa8;
}

textarea[name=e_content]{
	resize: none;
	margin: 10px auto;
	width: 98%;
	height: 200px;
	font-size: 12pt;
	padding: 5px;
	display: block;
	border: 0px;
}

#main{
	margin-left: 20em;
	margin-top: 5em;
}

#body{
	width: 1002px;
	margin: 10px 5px;
}

#main_file{
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #777;
	border-radius: 5px 10px;
	cursor: pointer;
	background: #ccc;
}

#file_name{
	padding: 5px 10px;
	display: inline-block;
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

#regbutton{
	background: #af8;
}

#cancel{
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

.warning{
	color: #f33;
}

.pass{
	color: #3f3;
}

.notice{
	padding: 5px;
	font-size: 10pt;
	display: none;
}

</style>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var chkId = false;
	var chkPwd = false;
	$(function(){
		$("input[name=id]").on("keyup", function(){
			$(".id").css("display", "block");
			var id = $("input[name=id]").val();
			if(id == "") {
				if($(".id").hasClass("pass")){
					$(".id").removeClass("pass");
					$(".id").addClass("warning");
				}
				$(".id").text("아이디를 입력해주세요.");
				chkId = false;
			} else {
				$.ajax({
					url: "a_chkId",
					data: {"id":id},
					dataType: "text",
					type : "post",
					success: function(data){
						if(data > 0) {
							if($(".id").hasClass("pass")){
								$(".id").removeClass("pass");
								$(".id").addClass("warning");
							}
							$(".id").text("이미 존재하는 아이디입니다.");
							chkId = false;
						} else {
							if($(".id").hasClass("warning")){
								$(".id").removeClass("warning");
								$(".id").addClass("pass");
							}
							$(".id").text("사용 가능한 아이디입니다.");
							chkId = true;
						}
					},
					error: function(){
						alert("읽기 실패1");
					}
				});
			}
		});

		$("input[name=pw]").on("keyup", function(){
			chkPw();
		});

		$("input[name=pw2]").on("keyup", function(){
			chkPw();
		});



		
		$("#cancel").on("click", function(){
			history.go(-1);
		});

		$("#regbutton").on("click", function() {
			if(!validateForm()) return;
			$("#m_form").attr("action", "admin_reg_manager").submit();
		});
	});

	function chkPw() {
		var pw = $("input[name=pw]").val();
		var pw2 = $("input[name=pw2]").val();
		if(pw == "") {
			$(".pw").css("display", "block");
			$(".pw").text("암호를 입력해주세요.");
			$(".pw2").css("display", "none");
			chkPwd = false;
		} else {
			$(".pw").css("display", "none");
			$(".pw").text("");
			if(pw2 != "") {
				$(".pw2").css("display", "block");
				if(pw == pw2) {
					if($(".pw2").hasClass("warning")){
						$(".pw2").removeClass("warning");
						$(".pw2").addClass("pass");
					}
					$(".pw2").text("확인되었습니다.")
					chkPwd = true;
				} else {
					if($(".pw2").hasClass("pass")) {
						$(".pw2").removeClass("pass");
						$(".pw2").addClass("warning");
					}
					$(".pw2").text("암호가 일치하지 않습니다.")
					chkPwd = false;
				}
			} else {
				$(".pw2").css("display", "none");
				chkPwd = false;
			}
		}
	}

	function validateForm(){
		if($("input[name=name]").val() == "") {
			alert("이름을 입력해주세요.");
			$("input[name=name]").focus();
			return false;
		}
		if(!chkId) {
			alert("아이디를 확인해주세요.");
			$("input[name=id]").focus();
			return false;
		}
		if(!chkPwd) {
			alert("암호를 확인해주세요.")
			$("input[name=pw]").focus();
			return false;
		}
		if($("input[name=mng_contact]").val() == "") {
			alert("연락처를 입력해주세요.");
			$("input[name=mng_contact]").focus();
			return false;
		}
		if($("input[name=email]").val() == "") {
			alert("이메일을 입력해주세요.");
			$("input[name=email]").focus();
			return false;
		}
		if($("input[name=mng_email]").val() == "") {
			alert("개인 이메일을 입력해주세요.");
			$("input[name=mng_email]").focus();
			return false;
		}
		if($("input[name=mng_grade]").val() == "") {
			alert("직책을 입력해주세요.");
			$("input[name=mng_grade]").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div id="container">
		<nav>
			<div id="logo" onclick="javascript:location.href='home'">
				ICT레시피 <span>ict recipe</span>
			</div>
			<ul id="menu">
				<li><a id="home" href="home">HOME</a></li>
				<li><a id="recipe" href="a_recipe">레시피 관리</a></li>
				<li><a id="content" href="a_write_recipe">게시물 등록</a></li>
				<li><a id="user" href="a_membership">회원 관리</a></li>
				<li><a id="board" href="admin_qna">문의 관리</a></li>
				<li><a id="event" href="admin_event">이벤트 관리</a></li>
				<li><a id="op" href="a_manager">운영자 관리</a></li>
				<li><a id="setting" href="/">Main</a></li>
			</ul>
		</nav>
		<header>
			<div id="links">
				<span href="logout">${mvo.name}님 안녕하세요! <br> 로그아웃</span>
			</div>
		</header>
		<div id="main">
			<form method="post" id="m_form">
				<fieldset>
					<legend>운영자 등록</legend>
					<div id="mng-div">
						<div class="regular">
							<div class="label">이름</div>
							<div class="content"><input type="text" name="name" required></div>
						</div>
						
						<div class="regular">
							<div class="label">아이디</div>
							<div class="content"><input type="text" name="id" required></div>
						</div>
						<div class="notice warning id"></div>
						<div class="regular">
							<div class="label">암호</div>
							<div class="content"><input type="password" name="pw" required></div>
						</div>
						<div class="notice warning pw"></div>
						<div class="regular">
							<div class="label">암호 확인</div>
							<div class="content"><input type="password" name="pw2" required></div>
						</div>
						<div class="notice warning pw2"></div>
						<div class="regular">
							<div class="label">연락처</div>
							<div class="content"><input type="text" name="mng_contact" required></div>
						</div>
						<div class="regular">
							<div class="label">이메일</div>
							<div class="content"><input type="text" name="email" required></div>
						</div>
						<div class="regular">
							<div class="label">개인 메일</div>
							<div class="content"><input type="text" name="mng_email" required></div>
						</div>
						<div class="regular">
							<div class="label">성별</div>
							<div class="content">
								<input type="radio" name="gender" value="남" checked> 남
								<input type="radio" name="gender" value="여"> 여
							</div>
						</div>
						<div class="regular">
							<div class="label">직책</div>
							<div class="content"><input type="text" name="mng_grade" required></div>
						</div>
					</div>
				</fieldset>
				<div id="body">
				<div id="foot">
					<span id="regbutton">운영자 등록</span><span id="cancel">취소</span>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
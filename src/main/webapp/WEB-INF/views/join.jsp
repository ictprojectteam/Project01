<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
	.top{
		background-color: #fa8;
		text-align: center;
		color: white;
		cursor: pointer;
	}
	.body{
	margin-left: 100px;
	}
	.join_bt{
		width: 460px;
		height: 30px;
	}
	.inpo_box{
		width: 460px;
		height: 30px;
	}
	#pw1{
		width: 460px;
		height: 30px;
	}
	#pw2{
		width: 460px;
		height: 30px;
	}
	#alert-success{
		width: 15%;
		background-color: #7DFE74;
		color: #000;
	}
	#alert-danger{
		width: 20%;
		background-color: red;
		color: #000;
	}
</style>

</head>
<body>
<div class="top">
	<h1> ICT 레시피 </h1>
	<h2> ICT RECIPE </h2>
</div>
<script type="text/javascript">
	/* 홈 배너 */
	$(function(){
		$(".top").on("click", function(){
			location.href="/";
		});
	});

	$(function(){
		$(".join_bt").on("click", function(){
			var id = $("#id").val();
			var pw = $("#pw1").val();
			var pw_ok = $("#pw2").val();
			var email = $("#email").val();
			var name = $("#name").val();
			var gender = $("input[name='gender']:checked").length
			var join_chk = $("input[name='join_chk']:checked").length
			

			/* 
			var id = $("#id").val();  생략하고 
			if($("#id").val() == ""){  이런식으로 사용 가능 
				alert("아이디를 입력하세요");
				$("#id").focus();
				return false;
			} */

			if(id == ""){
				alert("아이디를 입력하세요");
				$("#id").focus();
				return false;
			}
			
			if(pw == ""){
				alert("패스워드를 입력하세요");
				$("#pw1").focus();
				return false;
			}
			
			if(pw_ok == ""){
				alert("패스워드를 확인하세요");
				$("#pw2").focus();
				return false;
			}
			if(email == ""){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return false;
			}
			if(name == ""){
				alert("닉네임을 입력하세요");
				$("#name").focus();
				return false;
			}
			if(gender == 0){
				alert("성별을 체크하세요");
				return false;
			}
			if(join_chk == 0){
				alert("이용약관에 동의해주세요");
				return false;
			}else{
				alert("가입 성공");
			}
		});
	});

	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();
			if(pw1 != "" || pw2 != ""){
				if(pw1 == pw2){
					$("#alert-success").show();
					$("#alert-danger").hide();
					// $(".join_bt").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					// $(".join_bt").attr("disabled","disavled");
				}
			}	
		});
	});
	
	
</script>
	<div class="body">
		<form method="post">
			<h1 style="font-size: 50px;">회원가입</h1>
			<p><input class=inpo_box type="text" placeholder="아이디" name="id" id="id"></p>
			<p><input id=pw1 type="password" placeholder="비밀번호" name="pw"></p>
			<p><input id=pw2 type="password" placeholder="비밀번호 확인" name="pw_ok"></p>
			<p id="alert-success">비밀번호가 일치합니다.</p>
			<p id="alert-danger">비밀번호가 일치하지 않습니다.</p>
			<p><input class=inpo_box type="text" placeholder="이메일" name="email" id="email"></p>
			<p><input class=inpo_box type="text" placeholder="닉네임" name="name" id="name"></p>
			<p><input type="radio" name="gender" class="gender">남자
			   <input type="radio" name="gender" class="gender">여자
			</p>
			<fieldset style="width: 10%">
			<legend>이용약관</legend>
			<p><textarea rows="5%" cols="60%">개인정보 수집입니다.</textarea></p>
			<input type="checkbox" id="join_chk" name="join_chk">이용약관 동의(필수)
			</fieldset>
			<br>
			<input class="join_bt" type="button" value="회원가입"/>
		</form>
	</div>
</body>
</html>
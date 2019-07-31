<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토크 작성</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
	.fs{
		left: 30%;
		width: 600px;
		background-color: white;
	}
	.btg{
		font-size: 1em;
		
	}
</style>
<script type="text/javascript">
	function write_ok(f){
		f.action = "talk_write_ok";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<form method="post">
			<table>
				<fieldset class = fs>
				<p><h3>ICT레시피 쉐프들의 자유토크</h3></p>
				<hr>
				<textarea rows="10" cols="60" style="font-size: 16pt;" name="content"></textarea>
				<hr>
				<input type="file" name="f_name">
				<hr>
				<p class="btg">
				<input type="button" value="등록" onclick="write_ok(this.form)">
				<input type="reset" value="취소">
				</p>
				</fieldset>
			</table>
		</form>
	</div>
</body>
</html>
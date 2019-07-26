<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ICT PROJECT TEAM</title>
<style type="text/css">
#body-content {
	width: 1200px;
	margin: 30px auto 0px;
}
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#profile-dropdown").fadeOut();
		$(".fa-user-circle").click(function(){
			if($("#loginchk").val() == null || $("#loginchk").val() == ""){
				location.href="login";
			} else {
				$("#profile-dropdown").css("visibility", "visible");
				$("#profile-dropdown").fadeToggle("fast");
			}
		});
		$(window).click(function(e){
			if(e.target.getAttribute("class") != "fas fa-user-circle"){
				$("#profile-dropdown").fadeOut("fast");
			}
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="body-content">
		<jsp:include page="${wPage}" />
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
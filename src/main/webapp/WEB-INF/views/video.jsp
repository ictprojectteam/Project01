<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video</title>
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css">
<style type="text/css">
/* ======================================== 영상 게시자 ========================================== */
	#video-body{
		width: 1200px;
		margin: 30px auto 0px;
	}
	#video-group{
		margin-top: 20px;
		width: 1200px;
		display: grid;
		grid-template-columns: 380px 380px 380px;
		grid-column-gap: 30px;
	}
	.video-group-each{
		height: 70px;
		cursor: pointer;
		display: grid;
		grid-template-columns: 70px 310px;
	}
	.video-group-each img{
		height: 50px;
		width: 50px;
		margin: 10px;
	}
	.video-uploader{
		font-size: 15pt;
		color: #444;
		padding: 20px 10px;
		text-align: center;
	}
	.video-group-each:hover{
		background: #eec;
		animation-name: video-group-ani;
		animation-duration: 0.5s;
	}
	@keyframes video-group-ani{
		from {background: #fff;}
		to {background: #eec;}
	}
	#video-request{
		width: 180px;
		height: 30px;
		margin: 10px 0px;
		border: 1px solid #fa8;
		border-radius: 20px;
		padding: 10px 0px 0px;
		text-align: center;
		background: #fa8;
		cursor: pointer;
		color: #555;
		box-shadow: 0px 0px 0px 1px #d86;
	}
	#video-request:hover{
		background: #d86;
		color: #ccc;
		animation-name: video-request-ani;
		animation-duration: 0.5s;
	}
	@keyframes video-request-ani{
		from{background: #fa8;
			color:#555;}
		to{background: #d86;
			color:#ccc;}
	}
/* ======================================== 인기 영상 ========================================== */

</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script src="../resources/js/jquery-ui.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	<div id="video-body">
		<div id="video-group">
			<c:forEach var="k" begin="1" end="9">
				<div class="video-group-each">
					<img src="resources/images/no_image.png">
					<div class="video-uploader">채널${k}</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
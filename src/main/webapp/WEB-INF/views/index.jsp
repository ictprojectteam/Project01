<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICT PROJECT TEAM</title>
<style type="text/css">
	#head{
		width: 101%;
		height: 150px;
		margin: -8px;
		overflow: hidden;
	}
	#logo-image{
		width: 100%;
		height: 100px;
	}
	#top-logo-bar{
		width: 1000px;
		height: 100px;
		display: grid;
		grid-template-columns: 300px 500px 300px;
		grid-gap: 10px;
		margin: auto;
	}
	#recipe-search{
		display: grid;
		grid-template-columns: 400px 40px;
		align-content: center;
	}
	/* 검색 텍스트 */
	#search-bar{
		font-size: 15pt;
		width: 99%;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		text-indent: 8pt;
	}
	#top-icon{
		display: grid;
		grid-template-columns: 60px 60px;
		align-content: center;
	}
	/* 검색 버튼 */
	#search-button{
		display: inline-block;
		padding: 5px 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		background: #fa8;
	}
	/* 검색 버튼 이미지 색 */
	.fa-search{
		font-size: 15pt;
		color: #55c;
	}
	/* 프로필 아이콘 */
	.fa-user-circle{
		font-size: 35pt;
		color: #bbb;
	}
	/* 글쓰기 버튼 */
	#top-pencil-icon{
		background: #fa8;
		border-radius: 30px;
		width: 30px;
		padding: 10px;
	}
	/* 글쓰기 아이콘 */
	.fa-pencil-alt{
		font-size: 20pt;
		color: #eee;
		border-radius: 15px;
	}
	#profile-dropdown{
		z-index: 1;
		position: absolute;
		margin-top: 80px;
		margin-left: -50px;
		line-height: 40pt;
		border: 2px solid #fa8;
		box-shadow: 0px 0px 3px 1px #e97;
		background: #eee;
		text-align: center;
		padding: 0px 10px;
		visibility: hidden;
	}
	.profile-dropdown-menu:link, .profile-dropdown-menu:visited{
		display: block;
		text-decoration: none;
		color: #333;
	}
	#top-nav{
		background: #fa8;
		width: 101%;
		height: 50px;
		position: relative;
	}
	#top-nav-menu-bar{
		margin: auto;
		width: 1200px;
		display: grid;
		grid-template-columns: auto auto auto auto auto auto auto;
	}
	.top-nav-menu{
		padding-top: 10px;
		height: 50px;
		text-align: center;
		color: #eee;
		text-decoration: none;
	}
	.top-nav-menu:hover{
		background:#fda;
		color: #777;
	}
	/* 
	
================================================ body ===========================================
	
	 */
	
	#body-content{
		width: 1200px;
		margin: 30px auto 0px;
	}
	
	
	/* 
	
================================================ footer ==========================================
	
	 */
	#footer{
		width: 101%;
		margin: 100px auto 0px;
	}
	#first-footer{
		width: 1300px;
		margin: auto;
		display: grid;
		grid-template-columns: 400px 550px 350px;
	}
	#footer-company{
		font-size: 9pt;
		color: #888;
		line-height: 5pt;
	}
	#footer-link a:link, #footer-link a:visited{
		color: #888;
	}
	#footer-sns img{
		margin-top: 50px;
		width: 70px;
		height: 70px;
	}
	#report-content{
		margin-left: 50px;
	}
	#send-report{
		display: block;
		text-decoration: none;
		font-size: 9pt;
		color: black;
		margin: auto;
		text-align: center;
	}
	#second-footer{
		background: #fa8;
		width: 101%;
		margin: -8px;
		margin-top: 20px;
	}
	#second-footer-content{
		width: 1300px;
		display: grid;
		grid-template-columns: 250px 800px 250px;
		height: 170px;
		margin: auto;
	}
	#footer-logo{
		padding: 40px;
	}
	#footer-counting{
		display: grid;
		grid-template-columns: auto auto auto;
		grid-template-rows: 100px 70px;
		text-align: center;
		color: #e86;
		font-size: 35pt;
	}
	#footer-counting i{
		margin-top: 25px;
	}
	#footer-counting a:link, #footer-counting a:visited{
		color: #e86;
	}
	#footer-mailto-round{
		padding: 40px;
	}
	#footer-mailto{
		margin: auto;
		height: 80px;
		width: 80px;
		border-radius: 80px;
		background: #fff;
		color: #d75;
		font-size: 30pt;
		text-align: center;
	}
	#footer-mailto i{ 
		margin-top: 20px;
	}
	.footer-counting-label{
		margin-top: -10px;
		font-size: 9pt;
		color: #eee;
	}
	.footer-counting-number{
		margin-top: -10px;
		font-size: 16pt;
		color: #dd3;
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
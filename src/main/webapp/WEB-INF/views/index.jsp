<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
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
		grid-template-columns: auto auto auto auto auto auto;
	}
	.top-nav-menu{
		padding-top: 10px;
		height: 50px;
		text-align: center;
		color: #eee;
	}
	.top-nav-menu:hover{
		background:#fda;
		color: #777;
	}
	#footer{
		width: 1300px;
		margin: 100px auto 0px;
	}
	#first-footer{
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
</style>
<script src="https://kit.fontawesome.com/057ba10041.js"></script>

</head>
<body>
	<header>
		<jsp:include page="head.jsp" />
	</header>
	
	
	<footer>
		<jsp:include page="foot.jsp" />
	</footer>
</body>
</html>
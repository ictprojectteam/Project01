<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

* {
	margin: 0;
	padding: 0;
	font-family: monospace;
	box-sizing: border-box;
	transition: all ease-in-out .2s;
}

#container {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #f7f7f7;
	overflow: auto;
}

#actions-container {
	width: 80%;
	height: calc(100% -4em);
	background-color: #dadada;
}

#main {
	margin-left: 20em;
}

.title {
	width: 100%;
	height: 50px;
	display: block;
	text-align: left;
	line-height: 30px;
	margin-bottom: 1em;
	font-size: 1.0em;
	font-family: arial;
	font-weight: bold;
}

.row {
	display: flex;
	width: 100%;
	height: 30%;
	flex-wrap: nowrap;
	flex-direction: row;
	padding: 1em;
}

#user-action {
	margin-top: 5em;
}

#action {
	margin-top: 20em;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	color: #2b686e;
	text-align: center;
	font-size: 1.0em;
}

table {
	position: relative;
	width: 1000px;
}

table th {
	border-spacing: 0;
}

tabel td {
	font-size: 1.0em;
}

#r_title{
	background-color: #cccccc;
}
.content-list:hover{
	background: #ccc;
	cursor:pointer;
} */
.content-line:hover{
	background: #ccc;
	cursor: pointer;
}

</style>
</head>
<body>
	<div id="container" >
		<jsp:include page="admin_menu.jsp" />
		<main id="main">
		<div id="action-container">
			<div id="user-action">
				<div class="title">
					신규 회원
					<div id="body">
						<table>
							<thead>
								<tr id="r_title">
									<th>회원번호</th>
									<th>회원이름</th>
									<th>이메일</th>
									<th>성별</th>
									<th>가입 일시</th>
								</tr>
							</thead>
							<!-- <tbody> -->
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="5"><h3>원하는 정보가 존재하지 않습니다</h3></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${list}" begin="0" end="4">
											<tr class="content-list" onclick="location.href='admin_view_one_member.do?m_idx=${k.m_idx}'">
												<td>${k.m_idx}</td>
												<td>${k.name}</td>
												<td>${k.email}</td>
												<td>${k.gender}</td>
												<td>${k.regdate}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="action">
				<div class="title">
					새로 등록된 레시피
					<div id="body">
						<table>
							<thead>
								<tr id="r_title">
									<th>번호</th>
									<th>회원번호</th>
									<th>레시피 제목</th>
									<th>종류 구분</th>
									<th>등록 일시</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty r_list }">
										<tr>
											<td colspan="6"><h3>정보가 존재하지 않습니다.</h3></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${r_list}" begin="0" end="4">
											<tr class="content-list" onclick="location.href='admin_view_one_recipe.do?r_idx=${k.r_idx}'">
												<td>${k.r_idx}</td>
												<td>${k.m_idx}</td>
												<td>${k.recipe_title}</td>
												<td>${k.recipe_introduce}</td>
												<td>${k.regdate}</td>
												<c:if test="${k.a_permission == 0}">
													<td>승인대기</td>
												</c:if>
												<c:if test="${k.a_permission == 1}">
													<td>승인완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="action">
				<div class="title">
					신규 문의
					<div id="body">
						<table>
							<thead>
								<tr id="r_title">
									<th>회원이름</th>
									<th>아이디</th>
									<th>이메일</th>
									<th>문의 구분</th>
									<th>문의 내용</th>
									<th>등록 일시</th>
									<th>처리 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty q_list}">
										<tr>
											<td colspan="8"><h3>정보가 존재하지 않습니다.</h3></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${q_list}" begin="0" end="4">
											<tr class="content-list" onclick="location.href='admin_qna.do'">
												<td>${k.name}</td>
												<td>${k.id}</td>
												<td>${k.email}</td>
												<td>${k.q_def}</td>
												<td>${k.content}</td>
												<td>${k.regdate}</td>
												<c:if test="${k.status == 0}">
													<td>처리대기중</td>
												</c:if>
												<c:if test="${k.status == 1}">
													<td>처리완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
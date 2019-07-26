<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Home_Body</title>
<style type="text/css">
	body{
		background-color: #FFFFFF;
	}
	body * {
		box-sizing: border-box;
	}
	
	#title {
		color: black;
		background-color: white;
		font-size: 1em;
		text-align: left;
	}
	
	table{
		width: 100vm;
	}
	table td, table th{
		color: #2b686e;
		padding: 10px;
	}
	
	table th {
		background-color: #daeff1;
		font-weight: 300;
	}
	
</style>
</head>
<body>
	<div id="title">신규 회원</div>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<!-- <th>연착처</th> -->
				<th>이메일</th>
				<!-- <th>닉네임</th> -->
				<th>성별</th>
				<th>가입 일시</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="k" items="${list}">
				<tr>
					<td>${k.m_idx}</td>
					<td>${k.name}</td>
					<%-- <td>${k.number}</td> --%>
					<td>${k.email}</td>
					<%-- <td>${k.nickname}</td> --%>
					<td>${k.gender}</td>
					<td>${k.regdate.substring(0,10)}</td>
				</tr>
			</c:forEach>
		</tbody>
		
		
		
		
	</table>
	
	
</body>
</html>
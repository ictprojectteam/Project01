<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table {width: 80%;}
			table, th, td{border: 1px solid red; text-align: center;}
		</style>
		<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn1").click(function(){
					$("#res").empty(); // 초기화
					$.ajax({
						url : "text.do",
						type : "post",
						dataType : "text",
						success : function(data){
							$("#res").append(data);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
				$("#btn2").click(function(){
					$("#res").empty();
					var table = "<table>";
					table += "<thead><tr><th>종류</th><th>가격</th></tr></thead>";
					table += "<tbody>";
					$.ajax({
						url : "xmltest.do",
						type : "post",
						dataType : "xml",
						success : function(data){
							$(data).find("product").each(function(){
								var name = $(this).find("name").text();
								var price = $(this).find("price").text();
								table += "<tr><td>" + name + "</td><td>" + price + "</td></tr>";
							});
							table += "</tbody></table>";
							$("#res").append(table);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
				$("#btn3").click(function(){
					$("#res").empty();
					var table = "<table>";
					table += "<thead><tr><th>종류</th><th>가격</th></tr></thead>";
					table += "<tbody>";
					$.ajax({
						url : "xmltest2.do",
						type : "post",
						dataType : "xml",
						success : function(data){
							$(data).find("product").each(function(){
								var name = $(this).attr("name");
								var price = $(this).attr("price");
								table += "<tr><td>" + name + "</td><td>" + price + "</td></tr>";
							});
							table += "</tbody></table>";
							$("#res").append(table);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
				$("#btn4").click(function(){
					$("#res").empty();
					var table = "<table>";
					table += "<thead><tr><th>번호</th><th>아이디</th><th>비번</th><th>이름</th><th>나이</th><th>주소</th><th>날짜</th></tr></thead>";
					table += "<tbody>";
					$.ajax({
						url : "jsontest.do",
						type : "post",
						dataType : "json",
						success : function(data){
							var idx = data["idx"];
							var id = data["id"];
							var pw = data["pw"];
							var name = data["name"];
							var age = data["age"];
							var addr = data["addr"];
							var regdate = data["regdate"];
							table += "<tr><td>" + idx + "</td><td>" + id + "</td><td>" + pw + "</td><td>" + name + "</td><td>" + age + "</td><td>" + addr + "</td><td>" + regdate + "</td></tr>"; 
							table += "</tbody></table>";
							$("#res").append(table);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
				$("#btn5").click(function(){
					$("#res").empty();
					var table = "<table>";
					table += "<thead><tr><th>번호</th><th>아이디</th><th>비번</th><th>이름</th><th>나이</th><th>주소</th><th>날짜</th></tr></thead>";
					table += "<tbody>";
					$.ajax({
						url : "jsontest2.do",
						type : "post",
						dataType : "json",
						success : function(data){
							$.each(data, function(k, v){
								var idx = v["idx"];
								var id = v["id"];
								var pw = v["pw"];
								var name = v["name"];
								var age = v["age"];
								var addr = v["addr"];
								var regdate = v["regdate"];
								table += "<tr><td>" + idx + "</td><td>" + id + "</td><td>" + pw + "</td><td>" + name + "</td><td>" + age + "</td><td>" + addr + "</td><td>" + regdate + "</td></tr>"; 
							});
							table += "</tbody></table>";
							$("#res").append(table);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
				$("#btn6").click(function(){
					$("#res").empty();
					$.ajax({
						url : "weather.do",
						type : "post",
						dataType : "text",
						success : function(data){
							$("#res").append(data);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
				$("#btn7").click(function(){
					$("#res").empty();
					$.ajax({
						url : "weather2.do",
						type : "post",
						dataType : "xml",
						success : function(data){
							var table = "<table><thead><tr><th>지역</th><th>온도</th><th>상태</th><th>아이콘</th></tr></thead>";
							table += "<tbody>";
							$(data).find("local").each(function(){
								table += "<tr>";
								table += "<td>" + $(this).text() + "</td>";
								table += "<td>" + $(this).attr("ta") + "</td>";
								table += "<td>" + $(this).attr("desc") + "</td>";
								table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB" + $(this).attr("icon") + ".png'></td>";
								table += "</tr>";
							});
							table += "</tbody></table>";
							$("#res").append(table);
						},
						error : function(){
							alert("읽기 실패");
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<h1>Ajax 예제</h1>
		<hr>
		<button id="btn1">텍스트</button>
		<button id="btn2">xml</button>
		<button id="btn3">xml2</button>
		<button id="btn4">json</button>
		<button id="btn5">jsonList</button>
		<button id="btn6">외부데이터(xml)</button>
		<button id="btn7">외부데이터(xml)</button>
		<br>
		<hr>
		<br>
		<div id="res"></div>
	</body>
</html>
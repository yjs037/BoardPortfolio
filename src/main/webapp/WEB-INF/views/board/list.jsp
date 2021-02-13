<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
	
</style>
</head>
<body>
	<h1>리스트 페이지</h1>
	<table>
		<tr>
		 	<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
			
		<c:forEach items = "${list}" var = "list">
			<tr>
				<td><c:out value="${list.bno }"/></td>
				<td><a href = "/board/read?bno=${list.bno}"><c:out value = "${list.title}"/></a></td>
				<td><c:out value = "${list.writer}"/></td>
				<td><fmt:formatDate value = "${list.regDate }" pattern = "yyyy-MM-dd"/></td>
				<td>${list.viewCnt}</td>
			</tr>
		</c:forEach>	
	</table>
	<a href="/">첫화면</a>
	<button type = "button" onclick = "location.href ='/board/write'">글쓰기</button>
</body>
</html>


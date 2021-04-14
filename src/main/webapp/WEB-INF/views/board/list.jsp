<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">
	th,td{
		text-align : center;
		width : 100px;
	}
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
	<button type = "button" onclick = "location.href ='/'">첫화면</button>
	<button type = "button" onclick = "location.href ='/board/write'">글쓰기</button>
</body>
</html>


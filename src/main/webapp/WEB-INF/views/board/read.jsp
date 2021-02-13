<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
</style>
</head>
<body>
	<h1>게시물조회 페이지</h1>			
	<table>
		<tr>
			<th>제목</th>		
			<td>${read.title}</td>
			<th>조회수</th>
			<td>${read.viewCnt}</td>
		</tr>
		<tr>
			<th>작성자</th><!-- 회원가입한 회원 이름으로 받아오기  -->
			<td>${read.writer}</td>
			<th>날짜</th>
			<td><fmt:formatDate value="${read.regDate}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${read.content}</td>
		</tr>
	</table>
	<button type = "submit" onclick = "location.href = '/board/modify?bno=${read.bno}'">수정</button>
	<button type = "button" onclick = "location.href = '/board/remove?bno=${read.bno}'">삭제</button>
	<button type = "button" onclick = "location.href = '/board/list'">목록</button>
</body>
</html>


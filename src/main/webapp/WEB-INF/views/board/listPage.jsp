<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
	th,td{
		text-align : center;
	}
</style>
</head>
<body>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>글쓴이</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${cri }">
				<tr>
					<td>${list.bno }</td>
					<td>${list.writer }</td>
					<td><a
						href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${list.bno}">${list.title }</a></td>
					<td><fmt:formatDate value="${list.regDate }"
							pattern="yyyy-MM-dd" /></td>
					<td>${list.viewCnt }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div>
		<div>
			<ul>
				<!-- 이전prev -->
				<c:if test="${pm.prev }">
					<a href="listPage${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
				</c:if>
				<!-- 페이지블럭 -->
				<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="bno">
					<a href="listPage${pm.makeQuery(bno)}">${bno}</a>
				</c:forEach>
				<!-- 다음next -->
				<c:if test="${pm.next && pm.endPage > 0}">
					<a href="listPage${pm.makeQuery(pm.endPage+1)}">&raquo;</a>
				</c:if>
			</ul>
			<button type="button" onclick="location.href ='/'">첫화면</button>
			<button type="button" onclick="location.href ='/board/write${pm.makeQuery(pm.cri.page)}'">글쓰기</button>
		</div>
	</div>
</body>
</html>					 
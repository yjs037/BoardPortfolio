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
	<h1>수정 페이지</h1>
	<form role="form" method="post">
		<table>
			<tr>
			  <th>제목</th>
			  <td><input type="text" name="title" value = "${modify.title }" autofocus /></td>
			</tr>
			
			<tr>
			  <th>내용</th>
			  <td><textarea cols = "50" rows = "15" name = "content">${modify.content }</textarea></td>
			</tr>
			  
			<tr>
			  <td>
			    <button type = "submit">수정완료</button>	
			    <button type = "button" onclick = "location.href = '/board/list'">목록</button>
			  </td>
			</tr>
		</table>
	</form>
</body>
</html>


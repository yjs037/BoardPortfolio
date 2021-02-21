<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
	th,td{
		text-align : center;
		width : 100px;
		height : 50px;
		border: 1px solid black;
	}


</style>
<script type = "text/javascript">

$(function(){
	
	//confirm을 이용해서 정말로 삭제할건지 확인
	$(".remove_btn").click(function(){
		var removeYN = confirm("삭제하시겠습니까?");
		if(removeYN) {
			location.href = "/board/remove${cri.makeQuery()}&bno=${read.bno}";
		}else{
			return false;
		}
	});
	
});


</script>
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
	<button type = "submit" onclick = "location.href = '/board/modify${cri.makeQuery()}&bno=${read.bno}'">수정</button>
	<button class = "remove_btn" type = "button" >삭제</button>
	<button type = "button" onclick ="location.href = '/board/listPage${cri.makeQuery()}'">목록</button>				
</body>
</html>


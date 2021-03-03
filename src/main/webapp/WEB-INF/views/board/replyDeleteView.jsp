<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<title>게시판</title>

	<script type="text/javascript">
	$(function(){
		$(".cancel_btn").click(function(){
			location.href = "/board/read?&page=${cri.page}"
				   + "&pageSize=${cri.pageSize}"
				   + "&searchType=${cri.searchType}"
				   + "&keyword=${cri.keyword}"
				   + "&bno=${replyDelete.bno}";
		})
			
	})
		
</script>
</head>
	<body>	
		<div id="root">
			<h1> 게시판</h1>
			<section id="container">
				<form name="deleteForm" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${cri.page}"> 
					<input type="hidden" id="pageSize" name="pageSize" value="${cri.pageSize}"> 
					<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예 삭제합니다.</button>
						<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>		
			</section>
		</div>
	</body>
</html>
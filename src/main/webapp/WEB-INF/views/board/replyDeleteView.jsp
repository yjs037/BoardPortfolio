<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">

</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
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
			<h1>댓글삭제</h1>
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
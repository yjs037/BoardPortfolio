<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type = "text/css">

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
					   + "&bno=${replyUpdate.bno}";
			})

		})
		
</script>
</head>
<body>	
	<div id="root">
		<h1>댓글수정</h1>
		<section id="container">
			<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
				<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
				<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
				<input type="hidden" id="page" name="page" value="${cri.page}"> 
				<input type="hidden" id="pageSize" name="pageSize" value="${cri.pageSize}"> 
				<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
				<table>
					<tr>
					  <td>
					 	<label for="content"></label>
					 	<textarea rows="5" cols="100" id="content" name="content" placeholder="댓글을 작성해주세요"></textarea>
					  </td>
					</tr>	
				</table>
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">
	.save_list {
		margin-top: 15px;
		text-align: right;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
	var writeForm = $("form[name='writeForm']");
	$("#btnSave").click(function(){
		if(valiChk()){
			return false;
		}
	});
	
	
	var str = $
})
function valiChk(){
	var chkForm = $("form[name='writeForm'] .form-control").length;
	for(var i = 0; i<chkForm; i++) {
		if($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null) {
			alert($(".form-control").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
</head>
<body>
<div class = "container">
	<h1>글쓰기 페이지</h1>
	<form name = "writeForm" method="post">
		<input type="hidden" id="userId" name="userId" value="${member.userId}">
		<input type="hidden" id="writer" name="writer" value="${member.userName}">
		<div>
		 	<label for="title">제목</label>
			<input type="text" name="title" class = "form-control" placeholder = "제목을 입력 해주세요" title = "제목을 입력하세요." autofocus />
		</div>
				
		<div>
			<label for="content">내용</label>
			<textarea cols = "50" rows = "15" name = "content" class = "form-control" placeholder = "내용을 입력 해주세요" title = "내용을 입력하세요."></textarea>
		</div>
		
		<div class = "save_list">
		    <c:if test="${member.userId != null}">
		      <button id = "btnSave" class = "btn btn-sm btn-primary" type = "submit">작성</button>			
		    </c:if>
		      <button id = "btnList" class = "btn btn-sm btn-primary" type = "button" onclick ="location.href = '/board/listPage${cri.makeQuery()}'">목록</button>
		</div>				  
			
		<c:if test="${member.userId == null}">
			<p>로그인 후에 작성하실 수 있습니다.</p>
		</c:if>
	
	</form>
</div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">
		.modify_list {
		margin-top: 15px;
		text-align: right;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
	var modifyForm = $("form[name='modifyForm']");
	$("#modify_btn").click(function(){
		if(valiChk()){
			return false;
		}
	});
})
function valiChk(){
	var chkForm = $("form[name='modifyForm'] .form-control").length;
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
	<h1>수정 페이지</h1>
	<form name = "modifyForm" method="post">	
		<div>
			<label for="title">제목</label> 
			<input type="text" name="title" value = "${modify.title }" placeholder = "제목을 입력 해주세요." autofocus class = "form-control" title = "제목을 입력하세요."/>
		</div>			
			
		<div>
			<label for=content>내용</label>
			<textarea cols = "50" rows = "15" name = "content" placeholder = "내용을 입력 해주세요." class = "form-control" title = "내용을 입력하세요.">${modify.content }</textarea>
		</div>
		
		<div class ="modify_list">
			    <button id = "modify_btn" class = "btn btn-sm btn-primary" type = "submit">수정완료</button>	
			    <button class = "btn btn-sm btn-primary" type = "button" onclick = "location.href = '/board/listPage${cri.makeQuery()}'">취소</button>
		</div>	 
		
	</form>
</div>
</body>
</html>


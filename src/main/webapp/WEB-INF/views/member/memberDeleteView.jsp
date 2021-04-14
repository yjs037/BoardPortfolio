<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">
	body {
		background-color: #f8f8f8;
        padding: 150px 0;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
	// 취소
	$("#cancle").click(function(){
		
		location.href = "/";
	})

	$("#delete").click(function(){
		
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}
		
		$.ajax({
			url : "/member/passChk",
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success: function(data){
				
				if(data==true){
					if(confirm("회원탈퇴하시겠습니까?")){
						$("#delForm").submit();
						alert("탈퇴되었습니다");
					}					
				}else {
					alert("패스워드가 틀렸습니다.");
					return;
				}
			}
		})		
	});				
})
</script>
</head>
<body>
<section id="container">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<form action="/member/memberDelete" method="post" id ="delForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label>
				<input class="form-control" type="password" id="userPass" name="userPass" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label>
				<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="delete">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button" id="cancle">취소</button>
			</div>
		</form>
	</div>
</section>
</body>
</html>
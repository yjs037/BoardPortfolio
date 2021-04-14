<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
var pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

$(function(){
	// 취소
	$("#cancle").click(function(){
		
		location.href = "/";
	})
	
	// 정규식
	$("#userPass").keyup(function(){
		if(pw.test($("#userPass").val())) {
			$("#pw_check").text("사용가능한 비밀번호입니다.");
			$("#pw_check").css("color", "green");		
		} else {
			$("#pw_check").text("8~16자 영문 대 소문자, 숫자, 특수문자를 입력하세요.");
			$("#pw_check").css("color", "red");			
		}
	})	

	//유효성검사
	$("#update").click(function(){
		if(pw.test(($("#userPass").val()))==""){
			alert("비밀번호가 잘못되었거나 비어있습니다.");
			$("#userPass").focus();
			return false;
		} else if(confirm("변경하시겠습니까?")) {
			$("#updateForm").submit();
			alert("변경되었습니다.");
		}
				
	});
		
})

</script>
</head>
<body>
	<section id="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<form action="/member/memberUpdate" method="post" id = "updateForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label>
				<input class="form-control" type="password" id="userPass" name="userPass" />
				<div class = "check_font" id = "pw_check"></div>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label>
				<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="update">회원정보수정</button>
				<button class="cencle btn btn-danger" type="button" id="cancle">취소</button>
			</div>
		</form>
		</div>
	</section>
</body>
</html>
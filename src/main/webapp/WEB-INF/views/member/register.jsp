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
	
	#idChk {
		margin-top : 5px;
	}


</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
var userName = /^[가-힣]{2,6}$/;
var id = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
var pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

$(function(){	
	//취소
	$("#cancle").click(function(){
		location.href = "/";
	})
	
	//정규식
	$("#userId").keyup(function(){
		if(id.test($("#userId").val())) {
			$("#id_check").text("");
		} else {
			$("#id_check").text("4~20자리, 첫글자 영문 또는 한글을 입력하세요.");
			$("#id_check").css("color", "red");	
		}
	})
	
	$("#userPass").keyup(function(){
		if(pw.test($("#userPass").val())) {
			$("#pw_check").text("사용가능한 비밀번호입니다.");
			$("#pw_check").css("color", "green");		
		} else {
			$("#pw_check").text("8~16자 영문 대 소문자, 숫자, 특수문자를 입력하세요.");
			$("#pw_check").css("color", "red");			
		}
	})	
	
	$("#userName").keyup(function(){
		if(userName.test($("#userName").val())) {
			$("#name_check").text("멋진 이름이네요!");
			$("#name_check").css("color", "green");	
		} else {
			$("#name_check").text("한글 이름 2~6자 이내로 입력하세요.");
			$("#name_check").css("color", "red");	
		}
	})
	
	//유효성검사
	$("#register").click(function(){
		if(id.test(($("#userId").val()))=="") {
			alert("아이디가 잘못되었거나 비어있습니다.");
			$("#userId").focus();
			return false;
		}
		if(pw.test(($("#userPass").val()))==""){
			alert("비밀번호가 잘못되었거나 비어있습니다.");
			$("#userPass").focus();
			return false;
		}
		if(userName.test(($("#userName").val()))==""){
			alert("이름이 잘못되었거나 비어있습니다.");
			$("#userName").focus();
			return false;
		}
		
		var idChkVal = $("#idChk").val();
		if(idChkVal == "N") {
			alert("중복확인 버튼을 클릭하세요.");
			return false; //없으면 클릭하고 가입이 되어버림
		} else if (idChkVal == "Y") {
			$("#regForm").submit();
			alert("가입을 환영합니다.");
		}
	})
})

	function fn_idChk(){
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
		

</script>
</head>
<body>
	<section id="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<form action="/member/register" method="post" id ="regForm">
			<div class="form-group has-feedback" id = "id">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" />
				<div class = "check_font" id = "id_check"></div>
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label>
				<input class="form-control" type="password" id="userPass" name="userPass" />
				<div class = "check_font" id = "pw_check"></div>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label>
				<input class="form-control" type="text" id="userName" name="userName" />
				<div class = "check_font" id = "name_check"></div>
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id ="register">회원가입</button>
				<button class="btn btn-danger" type="button" id ="cancle">취소</button>
			</div>
		</form>
		</div>
	</section>
</body>
</html>


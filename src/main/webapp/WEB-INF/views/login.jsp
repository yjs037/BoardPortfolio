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
	#login-form > div {
        margin: 15px 0;
    }
    
    #login, #register{
    	margin: 1px 0;
    }
      
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
	$("#logout").click(function(){
		location.href = "/member/logout";
	})
	
	$("#register").click(function(){
		location.href = "/member/register";
	})
	
	$("#memberUpdate").click(function(){
		location.href = "/member/memberUpdateView";
	})
	
	$("#memberDelete").click(function(){
		location.href = "/member/memberDeleteView";
	})
});
</script>
</head>
<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
     <div class="panel panel-success">
 		<div class="panel-heading">
            <div class="panel-title">환영합니다!</div>
        </div>
        <div class="panel-body">
		<form id = "login-form" name = "loginFrom" method = "post" action = "/member/login">
		<c:if test = "${member == null }">
			<div>
				<label for = "userId">아이디</label>
				<input type ="text" id = "userId" name = "userId" class="form-control" placeholder="userId" autofocus>
			</div>
			<div>
				<label for = "userPass">비밀번호</label>
				<input type="password" id = "userPass" name = "userPass" class="form-control" placeholder="Password">
			</div>
			<div>
				<button type = "submit" class="form-control btn btn-primary" id = "login">로그인</button>
				<button type = "button" class="form-control btn btn-primary" id = "register">회원가입</button>
			</div>
		</c:if>
		
		<c:if test = "${member != null }">
			<div>
				<p>${member.userName}님 환영합니다.</p>
				<button id = "logout" type = "button">로그아웃</button>
				<button id = "memberUpdate" type = "button">회원정보수정</button>
				<button id = "memberDelete" type = "button">회원탈퇴</button>
			</div>
			<a href="/board/listPage">게시판으로 가기</a><br />
		</c:if>
	
		<c:if test="${msg == false }">
			<p style = "color:red;">로그인 실패! id와 PassWord를 확인해주세요.</p>
		</c:if>
		</form>
		</div>
	 </div>
	</div>
</div>

	
</body>
</html>


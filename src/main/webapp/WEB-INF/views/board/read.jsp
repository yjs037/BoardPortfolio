<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">
	#read_table {
		table-layout: fixed;
	}

	th,td{
		text-align : center;
	}
	
	#th-1 {
		width: 70px;
	}
	
	#th-2, #td-2 {
		width: 100px;
	}
	
	#th-5 {
		vertical-align: middle;
	}
	
	.td-5 {
		text-align: left;
		height: 500px;
		word-break:break-all;
	}
	
	.sml {
		text-align: right;
		margin-bottom: 15px;
	}
	
	pre {
		white-space: pre-wrap;
		text-align: left;
	}
	
	.reply_btn {
		margin-bottom: 15px;
		text-align: right;
	}
	
	.replyDeleteBtn, .replyUpdateBtn {
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		font-size: 13px;
		text-align: center;
	}
	
	


</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">

$(function(){
	
	$("#remove_btn").click(function(){
		var removeYN = confirm("삭제하시겠습니까?");
		var readForm = $("form[name='readForm']");
		var count = "${countReply}";
		
		if(count > 0) {
			alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
			return;
		} 
		
		if(removeYN) {
			location.href = "/board/remove${cri.makeQuery()}&bno=${read.bno}";
			readForm.attr("action", "/board/remove");
			readForm.attr("method", "post");
			readForm.submit();
		}else{
			return false;
		}
	});
	
	//댓글 수정
	$(".replyUpdateBtn").click(function(){
		location.href = "/board/replyUpdateView?&page=${cri.page}"
						+ "&pageSize=${cri.pageSize}"
						+ "&searchType=${cri.searchType}"
						+ "&keyword=${cri.keyword}"
						+ "&bno=${read.bno}"
						+ "&rno="+$(this).attr("data-rno");
	});
			
	//댓글 삭제
	$(".replyDeleteBtn").click(function(){
		location.href = "/board/replyDeleteView?bno=${read.bno}"
						+ "&page=${cri.page}"
						+ "&pageSize=${cri.pageSize}"
						+ "&searchType=${cri.searchType}"
						+ "&keyword=${cri.keyword}"
						+ "&rno="+$(this).attr("data-rno");
	});
	
	$("#replyWriteBtn").click(function(){
		
		if($("#writer").val()==""){
			alert("이름을 입력해주세요.")
			$("#writer").focus();
			return false;
		}
		
		if($("#content").val()==""){
			alert("댓글을 입력해주세요.")
			$("#content").focus();
			return false;
		}
		
		
	});
	
});


</script>
</head>
<body>
<div class = "container">
	<h1>조회 페이지</h1>
	<table id= "read_table" class="table table-bordered">
		<tr>
			<th id = "th-1">제목</th>		
			<td id = "td-1"><c:out value ="${read.title}"></c:out></td>
			<th id = "th-2">조회수</th>
			<td id = "td-2"><c:out value = "${read.viewCnt}"></c:out></td>
		</tr>
		<tr>
			<th>작성자</th><!-- 회원가입한 회원 이름으로 받아오기  -->
			<td><c:out value = "${read.writer}"></c:out></td>
			<th>날짜</th>
			<td><fmt:formatDate value="${read.regDate}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th id = "th-5">내용</th>
			<td class = "td-5" colspan ="3">${read.content}</td>
		</tr>
	</table>
	<form name="readForm" role="form" method="post" >
		<input type="hidden" id="bno" name="bno" value="${read.bno}" />
		<input type="hidden" id="page" name="page" value="${cri.page}"> 
		<input type="hidden" id="pageSize" name="pageSize" value="${cri.pageSize}"> 
		<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
		<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
	</form>
	
	<div class = "sml">
		<c:if test = "${member.userId == read.userId}">	
			<button type = "button" id = "remove_btn" class = "btn btn-sm btn-primary"  >삭제</button>
			<button type = "button" class = "btn btn-sm btn-primary" onclick = "location.href = '/board/modify${cri.makeQuery()}&bno=${read.bno}'">수정</button>
		</c:if>
		<button class = "btn btn-sm btn-primary" type = "button" onclick ="location.href = '/board/listPage${cri.makeQuery()}'">목록</button>
	</div>		
	
<!-- 댓글 S-->
	<div id="reply">
		<c:forEach items="${replyList}" var="replyList">
<pre>
작성자 : <c:out value = "${replyList.writer}"></c:out> 
작성 날짜 :  <fmt:formatDate value="${replyList.regDate}" pattern="yyyy-MM-dd" />

<c:out value = "${replyList.content}"></c:out>
</pre>
	        
		<c:if test="${member.userId == replyList.userId}">
			<div class = "reply_btn">
				<button type="button" class = "replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
				<button type="button" class = "replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>				
			</div>
		</c:if>    
		</c:forEach>   
	</div>
	
	<div>
		<!-- 댓글작성  -->
		<form name="replyForm" method="post" action = "/board/replyWrite">
			<input type="hidden" id="bno" name="bno" value="${read.bno}" />
			<input type="hidden" id="page" name="page" value="${cri.page}"> 
			<input type="hidden" id="pageSize" name="pageSize" value="${cri.pageSize}"> 
			<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
			<input type="hidden" id="userId" name="userId" value="${member.userId}"> 
		
			<div>
				<input type="hidden" id="writer" name="writer" value = "${member.userName }" />
				<label for="content"></label>
				<textarea rows="5" cols="160" id="content" name="content" placeholder="댓글을 작성해주세요"></textarea>
			</div>
			<c:if test="${member.userId != null}">
			<div>
				<button type="submit" id="replyWriteBtn" class = "btn btn-sm btn-primary">댓글 작성</button>
			</div>
			</c:if>
		</form>
		<c:if test="${member.userId == null}">
			<i>로그인 한 사용자만 댓글 등록이 가능합니다.</i>
		</c:if>
	</div>
<!-- 댓글 E-->	
</div>			
</body>
</html>
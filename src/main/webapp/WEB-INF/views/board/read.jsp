<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
	th,td{
		text-align : center;
		width : 100px;
		height : 50px;
		border: 1px solid black;
	}


</style>
<script type = "text/javascript">

$(function(){
	
	//confirm을 이용해서 정말로 삭제할건지 확인
	$(".remove_btn").click(function(){
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
	
});


</script>
</head>
<body>
	<h1>게시물조회 페이지</h1>
<div>
	<table>
		<tr>
			<th>제목</th>		
			<td>${read.title}</td>
			<th>조회수</th>
			<td>${read.viewCnt}</td>
		</tr>
		<tr>
			<th>작성자</th><!-- 회원가입한 회원 이름으로 받아오기  -->
			<td>${read.writer}</td>
			<th>날짜</th>
			<td><fmt:formatDate value="${read.regDate}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${read.content}</td>
		</tr>
	</table>
	<form name="readForm" role="form" method="post" >
		<input type="hidden" id="bno" name="bno" value="${read.bno}" />
		<input type="hidden" id="page" name="page" value="${cri.page}"> 
		<input type="hidden" id="pageSize" name="pageSize" value="${cri.pageSize}"> 
		<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
		<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
	</form>	
	
	<button type = "button" class = "remove_btn"  >삭제</button>
	<button type = "button" onclick = "location.href = '/board/modify${cri.makeQuery()}&bno=${read.bno}'">수정</button>
	<button type = "button" onclick ="location.href = '/board/listPage${cri.makeQuery()}'">목록</button>
</div>			

<!-- 댓글 S-->
<div id="reply">
  <ol class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
        <p>
        작성자 : ${replyList.writer}<br />
        작성 날짜 :  <fmt:formatDate value="${replyList.regDate}" pattern="yyyy-MM-dd" />
        </p>

        <p>${replyList.content}</p>
        
		<div>
		  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
		  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>				
		</div>
      </li>
    </c:forEach>   
  </ol>
</div>

		<!-- 댓글작성  -->
		<form name="replyForm" method="post" action = "/board/replyWrite">
			<input type="hidden" id="bno" name="bno" value="${read.bno}" />
			<input type="hidden" id="page" name="page" value="${cri.page}"> 
			<input type="hidden" id="pageSize" name="pageSize" value="${cri.pageSize}"> 
			<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
		
			<div>
				<label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
				<br/>
				<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
			</div>
			
			<div>
				<button type="submit" class="replyWriteBtn">작성</button>
			</div>
		</form>
<!-- 댓글 E-->				
</body>
</html>
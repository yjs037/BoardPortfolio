<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style type="text/css">
	th,td{
		text-align : center;
	}
	
	.form-inline {
		text-align: right;
		margin : 2px 0;
		margin-bottom: 25px;
	}
	
	#writeBtn {
		text-align: right;
	}

	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function(){
		setSearchTypeSelect();

		function setSearchTypeSelect(){
			var searchTypeSel = $('#searchTypeSel');
			var keyword = $('#keyword');
			
			searchTypeSel.val('${pm.cri.searchType}').prop("selected",true);
			//검색 버튼이 눌리면
			$('#searchBtn').on('click',function(){
				var searchTypeVal = searchTypeSel.val();
				var keywordVal = keyword.val();
				//검색 조건 입력 안했으면 경고창 
				if(!searchTypeVal){
					alert("검색 조건을 선택하세요!");
					searchTypeSel.focus();
					return;
				//검색어 입력 안했으면 검색창
				}else if(!keywordVal){
					alert("검색어를 입력하세요!");
					$('#keyword').focus();
					return;
				}
				var url = "listPage?page=1"
					+ "&pageSize=" + "${pm.cri.pageSize}"
					+ "&searchType=" + searchTypeVal
					+ "&keyword=" + encodeURIComponent(keywordVal);
				window.location.href = url;
			})
		
	}
		
		
});
</script>
</head>
<body>
<div class = "container">
	<div class ="login">
		<%@include file = "../template/nav.jsp" %>
	</div>
	
	<div class="form-inline">
		<select id="searchTypeSel" name="searchType">
	  		<option value="">검색조건</option>
	  		<option value="t">제목</option> 
	  		<option value="c">내용</option>
	  		<option value="w">작성자</option>
	  		<option value="tc">제목+내용</option>
	  		<option value="all">전체조건</option>
		</select>
		<input class="form-control" type="text" id="keyword" name="keyword" 
			value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
		<button id="searchBtn" class="btn btn-primary">Search</button>
	</div>
	
	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${cri }">
			<tr>
				<td><c:out value ="${list.bno }"></c:out></td>
				<td><a href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${list.bno}">${list.title }</a></td>
				<td><c:out value = "${list.writer }"></c:out></td>
				<td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd" /></td>
				<td><c:out value = "${list.viewCnt }"></c:out></td>
			</tr>
		</c:forEach>
	</table>
				
	<!-- 페이징 -->

	<div class = "text-center">
		<ul class = "pagination">
			<li>
				<!-- 이전prev -->
				<c:if test="${pm.prev }">
					<a href="listPage${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
				</c:if>
				
				<!-- 페이지블럭 -->
				<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="bno">
					<a href="listPage${pm.makeQuery(bno)}">${bno}</a>
				</c:forEach>
				
				<!-- 다음next -->
				<c:if test="${pm.next && pm.endPage > 0}">
					<a href="listPage${pm.makeQuery(pm.endPage+1)}">&raquo;</a>
				</c:if>
			</li>
		</ul>	
	</div>
	<div id = "writeBtn">
		<button class="btn btn-sm btn-primary" type="button" onclick="location.href ='/board/write${pm.makeQuery(pm.cri.page)}'">글쓰기</button>
	</div>
</div>
</body>
</html>			















		 
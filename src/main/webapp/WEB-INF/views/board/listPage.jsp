<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
	th,td{
		text-align : center;
	}
	
	.btn btn-success {
	
	}
</style>
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
			<th>글쓴이</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${cri }">
			<tr>
				<td>${list.bno }</td>
				<td>${list.writer }</td>
				<td><a href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${list.bno}">${list.title }</a></td>
				<td><fmt:formatDate value="${list.regDate }"
						pattern="yyyy-MM-dd" /></td>
				<td>${list.viewCnt }</td>
			</tr>
		</c:forEach>
	</table>
				<!-- 페이징 -->
	<div>
		<div>
			<ul>
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
			</ul>
			<button type="button" onclick="location.href ='/board/listPage'">첫화면</button>
			<button class="btn btn-success" type="button" onclick="location.href ='/board/write${pm.makeQuery(pm.cri.page)}'">글쓰기</button>
		</div>
	</div>
</body>
</html>					 
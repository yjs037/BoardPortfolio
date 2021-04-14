<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type ="text/css">
	li {
		list-style: none;
		display: inline;
	}
</style>
<ul>
	<li>
		<c:if test="${member != null }"><a href = "/member/logout">로그아웃</a></c:if>
		<c:if test="${member != null }"><a href = "/">홈</a></c:if>
		<c:if test="${member == null }"><a href = "/">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${member != null }">
			<p>${member.userName}(${member.userId}) 님 안녕하세요.</p>
		</c:if>
	</li>
</ul>
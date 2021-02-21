<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../template/header.jsp" %>
<style type="text/css">
	th{
		text-align : center;
	}
</style>
<script type = "text/javascript">
$(function(){
	var writeForm = $("form[name='writeForm']");
	$(".write_btn").click(function(){
		if(valiChk()){
			return false;
		}
	});
})
function valiChk(){
	var chkForm = $("form[name='writeForm'] .check").length;
	for(var i = 0; i<chkForm; i++) {
		if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null) {
			alert($(".check").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
</head>
<body>
	<h1>글쓰기 페이지</h1>
	<form name = "writeForm" method="post">
		<table>
			<tr>
			  <th>제목</th>
			  <td><input type="text" name="title" value = "${write.title }" placeholder = "제목을 입력 해주세요" autofocus
			  			class = "check" title = "제목을 입력하세요."/></td>
			</tr>
			
			<tr>
			  <th>내용</th>
			  <td><textarea cols = "50" rows = "15" name = "content" placeholder = "내용을 입력 해주세요"
			  			class = "check" title = "내용을 입력하세요.">${write.content }</textarea></td>
			</tr>
			  
			<tr>
			  <td>
			    <button class = "write_btn" type = "submit">작성</button>			
			    <button type = "button" onclick ="location.href = '/board/listPage${cri.makeQuery()}'">목록</button>
			  </td>
			</tr>
		</table>
	</form>
</body>
</html>


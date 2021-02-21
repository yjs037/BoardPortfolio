<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<script type="text/javascript">
$(function(){
	var modifyForm = $("form[name='modifyForm']");
	$(".modify_btn").click(function(){
		if(valiChk()){
			return false;
		}
	});
})
function valiChk(){
	var chkForm = $("form[name='modifyForm'] .check").length;
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
	<h1>수정 페이지</h1>
	<form name = "modifyForm" method="post">
		<table>
			<tr>
			  <th>제목</th>
			  <td><input type="text" name="title" value = "${modify.title }" placeholder = "제목을 입력 해주세요." autofocus 
			  			class = "check" title = "제목을 입력하세요."/></td>
			</tr>
			
			<tr>
			  <th>내용</th>
			  <td><textarea cols = "50" rows = "15" name = "content" placeholder = "내용을 입력 해주세요."
			  			class = "check" title = "내용을 입력하세요.">${modify.content }</textarea></td>
			</tr>
			  
			<tr>
			  <td>
			    <button class = "modify_btn" type = "submit">수정완료</button>	
			    <button type = "button" onclick = "location.href = '/board/listPage${cri.makeQuery()}'">취소</button>
			  </td>
			</tr>
		</table>
	</form>
</body>
</html>


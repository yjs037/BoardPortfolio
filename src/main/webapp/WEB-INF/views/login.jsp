<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style type="text/css">
	/* css 적용 */
</style>
</head>
<body>
	<h1>로그인 페이지</h1>
		<form>
		  <div class="form-group">
		    <label for="id">ID</label>
		    <input type="text" class="form-control" id="id" placeholder="Id">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
		  </div>
		  <button type="submit" class="btn">로그인</button>
		</form>

</body>
</html>


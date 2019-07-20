<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<center>
		<form action="update" method="post">
			u_name:<input type="text" name="entity.u_name" value="${entity.u_name }" /><br />
			u_pass:<input type="password" name="entity.u_pass" value="${entity.u_pass }" /><br />
			<input type="hidden" name="entity.u_id" value="${entity.u_id }">
			<input type="submit" value="提交">
		</form>
		</center>
</body>
</html>
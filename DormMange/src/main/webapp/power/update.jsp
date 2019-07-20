<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	<center>
		<form action="update" method="post">
			r_name:<input type="text" name="entity.p_name" value="${entity.p_name }" /><br />
			r_sort:<input type="text" name="entity.p_url" value="${entity.p_url }" /><br />
			<input type="hidden" name="entity.p_id" value="${entity.p_id }">
			<input type="submit" value="提交">
		</form>
		</center>
</body>
</html>
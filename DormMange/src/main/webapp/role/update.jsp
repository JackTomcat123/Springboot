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
			r_name:<input type="text" name="entity.r_name" value="${entity.r_name }" /><br />
			r_sort:<input type="text" name="entity.r_sort" value="${entity.r_sort }" /><br />
			<input type="hidden" name="entity.r_id" value="${entity.r_id }">
			<input type="submit" value="提交">
		</form>
		</center>
</body>
</html>
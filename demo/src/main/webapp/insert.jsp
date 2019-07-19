<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<body>
<center>
<H1>部门添加</H1>
<form action="dinsert" method="post" enctype="multipart/form-data">
<table border="1" width="60%">
<tr>
<td><input type="file" name="file"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="submit"></td>
</tr>
</table>
</form>
<br/>
</center>
</body>
</html>
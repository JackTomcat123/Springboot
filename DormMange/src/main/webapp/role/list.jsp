
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" media="all">
</head>
<body>
<center>
	<a href="save.jsp">添加</a>
	<table class="layui-table">
	<tr>
	<td>r_id</td>
	<td>r_name</td>
	<td>r_sort</td>
	<td colspan="3">(操作)operation</td>
	</tr>
	<c:forEach items="${list }" var="entity">
	<tr>
	   <td>${entity.r_id }</td>
		<td>${entity.r_name }</td>
		<td>${entity.r_sort }</td>
		<td><a href="toUpdate?entity.r_id=${entity.r_id }">修改</a>|
		<a href="delete?entity.r_id=${entity.r_id }">删除</a>|
		<%-- <a href="toPower?entity.r_id=${entity.r_id }">分配权力</a> --%>
		<a href="toPower3?entity.r_id=${entity.r_id }">分配权力</a></td>
	</tr>
	</c:forEach>
	</table>
	<a href="${pageContext.servletContext.contextPath }/index.jsp">返回</a>
	</center>
</body>
</html>
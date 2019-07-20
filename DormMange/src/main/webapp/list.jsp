<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
</head>
<body>
<center>
	<a href="save.jsp">添加</a><br/><br/>
	<input class="layui-input" name="name"/><input class="layui-btn" type="button" value="高级查询"/><br/>
	<table class="layui-table">
	<tr>
	<td>No.</td>
	<td>account</td>
	<td>pass</td>
	<td>users_id</td>
	<td>rename</td>
	<td>u_type</td>
	<td>u_role</td>
	<td colspan="3">操作</td>
	</tr>
    <c:forEach items="${list }" var="entity">
    <tr>
		<td>${entity.u_id }</td>
		<td>${entity.u_name }</td>
		<td>${entity.u_pass }</td>
		<td>${entity.u_num}</td>
		<td>${entity.u_rename }</td>
		<td>${entity.u_type }</td>
		<td>${entity.u_role}</td>
		<td colspan="3" align="center"><a href="toUpdate?entity.u_id=${entity.u_id }">修改</a>|
		<a href="delete?entity.u_id=${entity.u_id }">删除</a>|
		<a href="toRole?entity.u_id=${entity.u_id }">受理角色</a></td>
		</tr>
	</c:forEach>
	</table>
	</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
</head>
<body>
<center>
	<form action="role" method="post">
	<h3>受理角色</h3>
	<table class="layui-table">
	<tr>
	<td>管理员姓名：</td><td><font color="red">${entity.u_rename}</font></td>
	</tr>
	<tr><td colspan="2" align="center">请选择一下角色<font color="red"><i><b>(可以多选，但不可为空)</b></i></font></td></tr>
	<c:forEach items="${ roleList}" var="role">
	<tr>
	<td align="center"><input type="checkbox"  value="${role.r_id }" name="roles" id="show${role.r_id }"/></td>
	<td align="center">${role.r_name }</td>
	</tr>
	</c:forEach>
	</table>
		<c:forEach items="${role}" var="r">
			<input  type="hidden" id="info${r.r_id}" type="text" class="info" value="${r.r_id}">
			</c:forEach>
		<div>
			<input type="hidden" value="${entity.u_id }" name="entity.u_id">
			<input type="submit" class="layui-btn" value="提交">
		</div>
	</form>
	</center>
</body>
<script type="text/javascript">
	$(function() {
		var s = $(".info").val();
	$(".info").each(function (index,e) {
			$("#show"+this.value).attr("checked", true);
	})
	/* 
		以上两者都可以
		$(".info").each(
				function(){
					$("#show"+this.value).attr("checked",true);
				}
		) */
	})
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" media="all">
<style type="text/css">
.info{
width:400px;
height:200px;
padding:40px;
display: none;
background-color:pink;
}


</style>
<script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
</head>
<body>
<center>
    <a href="save.jsp">添加一级菜单</a>|<a href="Addmenu">菜单管理</a>
    <table class="layui-table">
    <tr>
    <td>p_id</td>
    <td>p_name</td>
    <td>p_url</td>
    <td>操作</td>
    </tr>
    <c:forEach items="${list }" var="entity">
    <tr>
		<td>${entity.p_id }</td>
		<td>${entity.p_name }</td>
		<td>${entity.p_url }</td>
	<%-- <a href="javaScript:void(0)" onclick="show(${entity.p_id})">添加</a> --%>
	<td><a href="toUpdate?entity.p_id=${entity.p_id }">修改</a>|
		<a href="delete?entity.p_id=${entity.p_id }">删除</a>|</td>
		</tr>
	</c:forEach>
    </table>
	
	<a href="${pageContext.servletContext.contextPath }/index.jsp">返回</a>
	<div class="info">
	<form id="form1" action="save">
			p_name:<input type="text" name="entity.p_name" class=".name"/><br />
			p_url:<input type="text" name="entity.p_url" class=".url"/><br />
			p_mgr:<input  type="text" name="entity.p_mgr" class="mgr"/><br/>
			<input type="submit"  value="提交">
	</form>
	</div>
	</center>
	<script type="text/javascript">
	function show(id){
		var num=id;
		$(".info").fadeToggle(800);
		$(".mgr").val(num);
	}
	</script>
</body>
</html>
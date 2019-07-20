<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
<center>
<font color="red"><h3>个人信息查询</h3></font>
<form action="upone" method="post">
<table class="layui-table" border="1">
<tr>
<td align="center">学号：</td>
<td align="center"><input class="layui-input" name="entity.stuNum" value="${entity.stuNum }"></td>
</tr>
<td align="center">姓名：</td>
<td align="center"><input class="layui-input" name="entity.stuName" value="${entity.stuName }"></td>
</tr>
<tr>
<td align="center">用户名：</td>
<td align="center"><input class="layui-input" name="entity.stuUserName" value="${ entity.stuUserName}"></td>
</tr>
<input type="hidden" name="entity.stuPass" value="${ entity.stuPass}">
<tr>
<td align="center">性别：</td>
<td align="center"><input ${entity.sex=='男'?'checked':'' } name="entity.sex" class="layui-radio" value="男" type="radio">男<input ${entity.sex=='女'?'checked':'' } name="entity.sex" value="女"  class="layui-radio" type="radio">女</td>
</tr><tr>
<td align="center">生日：</td>
<td align="center"><input class="layui-input" name="entity.birthday" value="${entity.birthday }"></td>
</tr><tr>
<td align="center">身份证号：</td>
<td align="center"><input class="layui-input" name="entity.cardId" value="${entity.cardId }"></td>
</tr><tr>
<td align="center">班级：</td>
<td align="center">
<input type="hidden" value="${entity.clazz.classId}" name="entity.clazz.classId">
<input class="layui-input" value="${entity.clazz.className }" readonly="readonly">
</td>
</tr>
<tr>
<td align="center">电话：</td>
<td align="center"><input class="layui-input" name="entity.tel" value="${entity.tel }"></td>
</tr><tr>
<td align="center">省：</td>
<td align="center"><input class="layui-input" name="entity.province" value="${entity.province}"></td>
</tr>
<tr>
<td align="center">城市：</td>
<td align="center"><input class="layui-input" name="entity.city" value="${entity.city}"></td>
</tr>
<tr>
<td align="center">入学日期</td>
<td align="center"><input readonly="readonly" class="layui-input"  name="entity.inDate" value="${entity.inDate}"></td>
</tr>
<input name="entity.stuId" type="hidden" value="${entity.stuId }">
<tr>
<td align="center" colspan="2" ><input class="layui-btn" type="submit" value="update"></td>
</tr>
</table>
</form>
</center>
</body>
</html>
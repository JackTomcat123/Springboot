<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
<center>
<font color="red"><h1>学生信息录入</h1></font>
<form action="insert" method="post">
<table class="layui-table" border="1">
<tr>
<td align="center">学号：</td>
<td align="center"><input class="layui-input" name="entity.stuNum"></td>
</tr>
<tr>
<td align="center">姓名：</td>
<td align="center"><input class="layui-input" name="entity.stuName"></td>
</tr>
<tr>
<td align="center">性别：</td>
<td align="center"><input name="entity.sex" class="layui-radio" value="男" type="radio">男<input name="entity.sex" value="女"  class="layui-radio" type="radio">女</td>
</tr><tr>
<td align="center">生日：</td>
<td align="center"><input class="layui-input" name="entity.birthday"></td>
</tr><tr>
<td align="center">身份证号：</td>
<td align="center"><input class="layui-input" name="entity.cardId"></td>
</tr><tr>
<td align="center">班级：</td>
<td align="center">
<select class="layui-input" name="entity.clazz.classId">
<option value="0">--请选择--</option>
<c:forEach items="${c_list }"   var="c">
<option value="${c.classId}">${c.className }</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td align="center">电话：</td>
<td align="center"><input class="layui-input" name="entity.tel"></td>
</tr><tr>
<td align="center">省：</td>
<td align="center"><input class="layui-input" name="entity.province"></td>
</tr>
<tr>
<td align="center">城市：</td>
<td align="center"><input class="layui-input" name="entity.city"></td>
</tr>
<!-- <tr>
<td align="center">入学日期</td>
<td align="center"><input class="layui-input" type="date" name="entity.inDate"></td>
</tr> -->
<%-- <tr>
<td align="center">宿舍号：</td>
<td align="center"><select class="layui-input" name="entity.dorm.dormId">
<option value="0">--请选择--</option>
<c:forEach items="${d_list }"   var="d">
<option value="${d.dormId}">${d.dormNum }</option>

</c:forEach>
</select></td>
</tr> --%>
<tr>
<td>备注</td>
<td><input class="layui-input" name="entity.memo"></td>
</tr>
<tr>
<td align="center" colspan="2" ><input class="layui-btn" type="submit" value="insert"></td>
</tr>

</table>
</form>
</center>
</body>
</html>
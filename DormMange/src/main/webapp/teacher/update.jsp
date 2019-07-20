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
     <form action="update" method="post">
<table class="layui-table" border="1">
<tr>
<td align="center">姓名：</td>
<td align="center"><input class="layui-input" name="entity.teachName" value="${entity.teachName}"></td>
</tr>
<tr>
<td align="center">用户名：</td>
<td align="center"><input class="layui-input" name="entity.teachUserName" value="${entity.teachUserName }"></td>
</tr><tr>
<td align="center">密码：</td>
<td align="center"><input class="layui-input" name="entity.teachPass" value="${entity.teachPass }"></td>
</tr><tr>
<td align="center">性别：</td>
<td align="center"><input name="entity.sex" ${entity.sex=='男'?'checked':'' } class="layui-radio" value="男" type="radio">男<input  ${entity.sex=='女'?'checked':'' } name="entity.sex" value="女"  class="layui-radio" type="radio">女</td>
</tr><tr>
<td align="center">生日：</td>
<td align="center"><input class="layui-input" name="entity.birthday" value="${ entity.birthday}"></td>
</tr><tr>
<td align="center">身份证号：</td>
<td align="center"><input class="layui-input" name="entity.idCard" value="${entity.idCard }"></td>
</tr><tr>
<td align="center">学历：</td>
<td align="center"><input class="layui-input" name="entity.edulevel" value="${entity.edulevel}"></td>
</tr><tr>
<td align="center">专业：</td>
<td align="center"><input class="layui-input" name="entity.specialty" value="${entity.specialty }"></td>
</tr><tr>
<td align="center">电话：</td>
<td align="center"><input class="layui-input" name="entity.tel" value="${entity.tel }"></td>
</tr><tr>
<td align="center">地址：</td>
<td align="center"><input class="layui-input" name="entity.address" value="${entity.address }"></td>
</tr><tr>
<td align="center">入职日期</td>
<td align="center"><input  	readonly="readonly"   class="layui-input" name="entity.hireDate" value="${entity.hireDate }"></td>
</tr>
<tr>
<td align="center">离职日期</td>
<td align="center">
${entity.leaveDate==null?'无信息':entity.leaveDate}
</td>
</tr>
<tr>
<td align="center">教师类型：</td>
<td align="center"><select class="layui-input" name="entity.type.typeid">
<option value="0">--请选择--</option>
<c:forEach items="${t_list }"   var="t">
<option ${entity.type.typeid==t.typeid?'selected':'' } value="${t.typeid}">${t.typename }</option>

</c:forEach>
</select></td>
</tr>
<input type="hidden" value="${entity.teachId }" name="entity.teachId">
<tr>
<td align="center" colspan="2" ><input class="layui-btn" type="submit" value="update"></td>
</tr>

</table>
</form>
</center>
</body>
</html>
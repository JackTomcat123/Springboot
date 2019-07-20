<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" >
</head>
<body>
<center>
<h1><font color="red">支付成功</font></h1>
<table class="layui-table">
<tr><td>学号</td><td>${entity.stuNum}</td></tr>
<tr><td>姓名</td><td>${entity.stuName}</td></tr>
<tr><td>宿舍楼</td><td>${entity.sex} &nbsp; ${d.build.buildname}</td></tr>
<tr><td>宿舍编号</td><td>${d.dormNum}</td></tr>
<tr><td>支付金额/年</td><td>${type.unitprice}</td></tr>
<tr><td>支付方式</td><td>现金</td></tr>
</table>
<a  href="/DormMange/teacher/findStudent.jsp " target="main">返回</a>
</center>
</body>
</html>
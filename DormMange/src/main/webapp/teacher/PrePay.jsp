<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../js/layer.js"></script>
	<script type="text/javascript" src="../common/layui/layui.js"></script>
		<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
</head>
<body>
<center>
<h1>支付详情</h1>
<table class="layui-table">
<tr>
<td>订单编号</td><td>20190100 ${ctype.typeid}</td>
</tr><tr>
<td>学号</td><td>${fstu.stuNum}</td>
</tr>
<tr>
<td>姓名</td><td>${fstu.stuName}</td>
</tr>
<tr>
<td>班级</td><td>${fstu.clazz.className}</td>
</tr>
<tr>
<td>差价金额</td><td>${c.payMoney}</td>
</tr>
<tr>
<td>操作</td>
<td><a class="layui-btn layui-btn-normal layui-btn-radius" href="index.jsp">支付</a></td>
</tr>
</table>
</center>
</body>
</html>
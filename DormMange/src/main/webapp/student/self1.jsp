<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../js/layer.js"></script>
	<script type="text/javascript" src="../common/layui/layui.js"></script>
		<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" media="all">
</head>
<body>
<center>
<h1>消息记录</h1>
<table class="layui-table">
<tr>
<td>编号</td>
<td>学号</td>
<td>姓名</td>
<td>班级</td>
<td>辅导员</td>
<td>申请内容</td>
<td>发送时间</td>
<td>申请结果</td>
</tr>
<c:forEach items="${o_list}" var="o">
<tr>
<td>${o.o_id}</td>
<td>${o.stu.stuNum}</td>
<td>${o.stu.stuName}</td>
<td>${o.stu.clazz.className}</td>
<td>${o.teach.teachName}</td>
<td>${o.memo}</td>
<td>${o.sendTime}</td>
<td>${o.flag==0?'辅导员待批准。。。' :''}
${o.flag==1?'辅导员未批准' :''}
${o.flag==2?'辅导员已批准，待宿管执行。。。' :''}
${o.flag==3?'该申请已执行' :''}
${o.flag==4?'该申请已执行':''}
</td>
</tr>
</c:forEach>
</table>
</center>
</body>
</html> 
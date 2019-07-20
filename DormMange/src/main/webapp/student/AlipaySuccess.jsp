<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" >
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
</head>
<body>
<center>
<h1><font color="red">支付成功</font></h1>
<table class="layui-table">
<tr><td>学号</td><td>${stu.stuNum}</td></tr>
<tr><td>姓名</td><td>${stu.stuName}</td></tr>
<tr><td>宿舍楼</td><td>${stu.sex} &nbsp; ${dorm.build.buildname}</td></tr>
<tr><td>宿舍编号</td><td>${dorm.dormNum}</td></tr>
<tr><td>支付金额/年</td><td>${type.unitprice}</td></tr>
<tr><td>支付方式</td><td><i>支付宝移动付款<i></i></td></tr>
<input type="hidden" id="stuid" value="${stu.stuId }"/>
<input type="hidden" id="dormid" value="${dorm.dormId}"/>
<input type="hidden" id="chid" value="${type.typeid}"/>
</table>
<a  href="/DormMange/teacher/findStudent.jsp " target="main">返回</a>
</center>
<script type="text/javascript">
$(function(){
	var stuid=$("#stuid").val();
	var dormid=$("#dormid").val();
	var chid=$("#chid").val();
	 $.ajax(
	            {
	                url:"/DormMange/student/AlipaySuccess",
	                data:{"stuid":stuid,"dormid":dormid,"chid":chid},
	                type:'post',
	                dataType:'html',
	                success:function(data)
	                {
	                	
	                }
	            }); 
});

</script>
</body>
</html>
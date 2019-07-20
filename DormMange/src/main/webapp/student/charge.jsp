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
	<script type="text/javascript" src="../layui/layui.js"></script>
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" >
</head>
<body>
<center>
<h1>缴费信息</h1>
<form action="Pay">
<table class="layui-table">
<tr>
<input type="hidden" id="stuid"  name="stuid" value="${h_list[0].stu.stuId}">
<td>学号</td>
<td>${h_list[0].stu.stuNum}</td>
</tr>
<tr>
<td>姓名</td>
<td>${h_list[0].stu.stuName}</td>
</tr>
<tr>
<td>宿舍楼</td>
<td>${h_list[0].stu.sex}:${d.build.buildname}</td>
</tr>
<tr>
<td>宿舍</td>
<input type="hidden" id="dormid"  name="dormid" value="${d.dormId}">
<td>${d.dormNum}</td>
</tr>
<tr>
<td>应付</td>
<input type="hidden" id="chid" name="chid" value="${h_list[0].type.typeid }"/>
<td>${h_list[0].payMoney}</td>
</tr>
<tr>
<td>缴费日期</td>
<td>${h_list[0].chargeDate}</td>
</tr>
<tr>
<td colspan="2" align="center"><input  class="layui-btn layui-btn-normal layui-btn-radius" type="submit" value="现金支付" >
<a class="layui-btn layui-btn-normal layui-btn-radius" href="javaScript:void(0)" onclick="pay()">支付宝支付</a>
</td>
</tr>
</table>
</form>
</center>
<script type="text/javascript">
function pay(){
	var stuid=$("#stuid").val();
	var dormid=$("#dormid").val();
	var chid=$("#chid").val();
	window.location="/DormMange/student/Alipay?stuid="+stuid+"&dormid="+dormid+"&chid="+chid;
}


</script>

</body>
</html>
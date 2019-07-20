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
<font color="red">支付成功</font>
<table class="layui-table">
<tr>
<td>订单编号</td>
<td>20190100${ctype.typeid}</td>
</tr>
<tr>
<td>学号</td>
<td>${fstu.stuNum}</td>
</tr>
<tr>
<td>姓名</td>
<td>${fstu.stuName}</td>
</tr>
<tr>
<td>办理业务</td>
<td>宿舍换宿补费</td>
</tr>
<tr>
<td>支付金额</td>
<td>${ctype.unitprice}</td>
</tr>
<tr>
<td>支付方式</td>
<td>支付宝移动支付</td>
</tr>
</table>
<input type="hidden" id="stuid" value="${fstu.stuId}"/>
<input  type="hidden" id="dormid" value="${fstu.dorm.dormId}"/>
<input  type="hidden" id="id" value="${dorm.dormId}"/>
<input  type="hidden" id="cid" value="${ctype.typeid}"/>
<a  href="/DormMange/teacher/findstu.jsp " target="main">返回</a>
</center>
<script type="text/javascript">
$(function(){
	var dormid=$("#dormid").val();
	var id=$("#id").val();
	var stuid=$("#stuid").val();
	var cid=$("#cid").val();
	$.ajax(
            {                 
                url:"Pay",
                data:{
                "dormid":dormid,
                "stuid":stuid,
                "id":id,
                "ctype.typeid":cid
                },
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
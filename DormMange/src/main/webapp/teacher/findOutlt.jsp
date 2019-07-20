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
		<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css">
</head>
<body>
<center>
<h1>本次执行任务</h1>
<table class="layui-table">
<tr>
<td>编号</td>
<td>学号</td>
<td>姓名</td>
<td>班级</td>
<td>辅导员</td>
<td>申请内容</td>
<td>发送时间</td>
</tr>
<c:forEach items="${o_list}" var="o">
<tr>
<input id="stuid" type="hidden" value="${o.stu.stuId}">
<input id="dormid" type="hidden" value="${o.dorm.dormId}">
<input id="dtype" type="hidden" value="${o.dorm.type.typename}">
<input id="price" type="hidden" value="${o.dorm.type.price}">
<input id="o_id" type="hidden" value="${o.o_id}">
<input id="teachid" type="hidden" value="${o.teach.teachId}">
<td>${o.o_id}</td>
<td>${o.stu.stuNum}</td>
<td>${o.stu.stuName}</td>
<td>${o.stu.clazz.className}</td>
<td>${o.teach.teachName}</td>
<td>${o.memo}</td>
<td>${o.sendTime}</td>
</tr>
</c:forEach>
</table>
<h1>相关信息查询</h1>
<table class="layui-table">
<tr>
<td>
性别
</td>
<td>
<select class="layui-input" style="width: 200px;" onchange="build(this.value)">
<option value="1=1">--请选择--</option>
<option value="男">男</option>
<option value="女">女</option>
</select>
</td>
<td>
宿舍楼
</td>
<td>
<div id="build"></div>
</td>
<td>
宿舍
</td>
<td>
<div id="dorm" ></div>
</td>
</tr>
</table>
<h1>宿舍情况显示</h1>
<div id="room">
</div>
</center>
<script type="text/javascript">
function build(val){
	var sex=val;
	 $("#build").find("option").remove(); 
	 $.ajax(
	            {                 
	                url:"teacher/findBuild",
	                data:{
	               	"sex":sex
	               	 
	                },
	                type:'post',
	                dataType:'html',
	                success:function(data)
	                {  
	               	 $("#build").find("option").remove(); 
                     $("#build").append(data);
	                }
	            });	 
	
}
function dorm(val){
	 $("#dorm").find("option").remove(); 
	var id=val;
	//alert(id);
	 $.ajax(
	            {                 
	                url:"teacher/findDormByBid",
	                data:{
	               	"id":id
	               	 
	                },
	                type:'post',
	                dataType:'html',
	                success:function(data)
	                {  
	               	 $("#dorm").find("option").remove(); 
                  $("#dorm").append(data);
	                }
	            });	 
	
}
function detil(val){
	var id=val;
	 $("#room").find("table").remove(); 
	 $.ajax(
	            {                 
	                url:"findDetil2",
	                data:{
	               	"id":id
	               	 
	                },
	                type:'post',
	                dataType:'html',
	                success:function(data)
	                {  
	            $("#room").find("table").remove(); 
               $("#room").append(data);
	                }
	            });	 
	
}
//换宿去缴费
function pay(dormid){
	 var o_id=$("#o_id").val();
	//新宿舍id
	var dormid=dormid;
	//新宿舍单价
	var nprice=$("#nprice").val();
	//学生id
	var stuid=$("#stuid").val();
	//老师id
	var teachid=$("#teachid").val();
	//原单价
	var dprice=$("#price").val();
	//补得差价
	var fprice=nprice-dprice;
	//执行
	$.ajax(
            {                 
                url:"PrePay",
                data:{
                "o_id":o_id,
                "dormid":dormid,
                "stuid":stuid,
                "id":teachid,
                "price":fprice
                },
                type:'post',
                dataType:'html',
                success:function(data)
                {  
                 window.location="PrePay.jsp";
                }
            });	 
}
</script>
</body>
</html> 
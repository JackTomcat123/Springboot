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
<td>辅导员意见</td>
<td colspan="2" align="center">操作</td>
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
<td>辅导员已同意</td>
<td>
<a href="javaScript:void(0)" class="layui-btn layui-btn-warm layui-btn-radius" onclick=" Dpass(${o.o_id},${o.dorm.dormId},${o.stu.stuId})">执行退宿</a>
<a href="javaScript:void(0)" class="layui-btn layui-btn-radius" onclick="Change(${o.o_id},${o.dorm.dormId},${o.stu.stuId})">执行换宿</a>
</td>
</tr>
</c:forEach>
</table>
</center>
<script type="text/javascript">
function Dpass(o_id,dormid,stuid){
	 var o_id=o_id;
	 var dormid=dormid;
	 var stuid=stuid;
	 $.ajax(
            {                 
                url:"teacher/Dpass",
                data:{
               	 "o.o_id":o_id,
               	 "dormid":dormid,
               	 "stu.stuId":stuid
               	 
                },
                type:'post',
                dataType:'html',
                success:function(data)
                {  
                	layer.open({
              		  title: '信息提示',
              		  content: '办理成功!'
              		}); 
                }
            });	 
	 
}
function Dpass2(o_id,dormid,stuid){
	 var o_id=o_id;
	 var dormid=dormid;
	 var stuid=stuid;
	 $.ajax(
           {                 
               url:"teacher/Dpass2",
               data:{
              	 "o.o_id":o_id,
              	 "dormid":dormid,
              	 "stu.stuId":stuid
              	 
               },
               type:'post',
               dataType:'html',
               success:function(data)
               {  
               	layer.open({
             		  title: '信息提示',
             		  content: '办理成功!'
             		}); 
               }
           });	 
	 
}

//换宿执行
function Change(o_id,dormid,stuid){
	 var o_id=o_id;
	 var dormid=dormid;
	 var stuid=stuid;
	 window.location="findOMsg?o.o_id="+o_id;
}
</script>
</body>
</html> 
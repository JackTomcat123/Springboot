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
<td>操作</td>
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
<td><a href="javaScript:void(0)" class="layui-btn layui-btn-warm layui-btn-radius" onclick="Pass(${o.o_id})">通过</a>
<a class="layui-btn layui-btn-danger layui-btn-radius" href="javaScript:void(0)" onclick="no(${o.o_id})">驳回</a></td>
</tr>
</c:forEach>
</table>
</center>
<script type="text/javascript">
function Not(id){
	 var id=id;
	 var tmemo=$("#tmemo").val();
	 $.ajax(
            {                 
                url:"teacher/NotPass",
                data:{"o.o_id":id,"Tmemo":tmemo},
                type:'post',
                dataType:'html',
                success:function(data)
                {  
                	layer.open({
              		  title: '信息提示',
              		  content: '已拒绝!'
              		}); 
                }
            });
	 
}
//同意受理
function Pass(id){
	 
	 var id=id;
	 $.ajax(
            {                 
                url:"teacher/Pass",
                data:{"o.o_id":id},
                type:'post',
                dataType:'html',
                success:function(data)
                {  
                	layer.open({
              		  title: '信息提示',
              		  content: '已通过!'
              		}); 
                }
            });
}
function no(id){
	   var id=id;
	   layui.use('layer',function(){
         var layer=layui.layer;
         layer.open({
    		  title:"信息驳回",
    		  offset: ['100px', '310px'],//上，左坐标
    		  type: 1,		 
    		  area: ['600px', '400px'], //宽高
    		  content: '<div id="notPass"><center><textarea placeholder="请输入内容" class="layui-textarea" id="tmemo"></textarea><br/>'
    		  +'<input class="layui-btn layui-layer-close" onclick="Not('+id+')" value="提交"/></center></div>'
          });  
     });
	
	
}
</script>
</body>
</html> 
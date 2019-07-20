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
<tr>
<input id="stuid" type="hidden" value="${o.stu.stuId}">
<input id="dormid" type="hidden" value="${o.dorm.dormId}">
<input id="dtype" type="hidden" value="${o.dorm.type.typename}">
<input id="o_id" type="hidden" value="${o.o_id}">
<td>${o.o_id}</td>
<td>${o.stu.stuNum}</td>
<td>${o.stu.stuName}</td>
<td>${o.stu.clazz.className}</td>
<td>${o.teach.teachName}</td>
<td>${o.memo}</td>
<td>${o.sendTime}</td>
</tr>
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
<div align="right">
<a  target="main" href="/DormMange/">返回</a>
</div>
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
	                url:"findDetil",
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
//换宿成功
function change(id){
	
	var ndid=$("#ndid").val();
	var ntype=$("#ntype").val();
	var o_id=$("o_id").val();
	var dtype=$("#dtype").val();
	if(dtype!=ntype){
		var bool=window.confirm("与原宿舍类型不一致是否，驳回？");
		if(bool){
			Tochange();
		}
		
	}else if(dtype==ntype){
		

		var newId=id;
		var dormid=$("#dormid").val();
		var stuid=$("#stuid").val();
		var o_id=$("#o_id").val();
		 $.ajax(
		            {                 
		                url:"change",
		                data:{
		               	"id":newId,
		               	"stuid":stuid,
		                "dormid":dormid,
		               	 "o_id":o_id
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
	
	

}
//换宿失败
function Nochange(id){
	var newId=id;
	var o_id=$("#o_id").val();
	 $.ajax(
	            {                 
	                url:"Nochange",
	                data:{
	               	 "o_id":o_id
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
//回绝办理
function Tochange(){
	var o_id=$("#o_id").val();
	 $.ajax(
	            {                 
	                url:"Tochange",
	                data:{
	               	 "o_id":o_id
	                },
	                type:'post',
	                dataType:'html',
	                success:function(data)
	                {  
	                	layer.open({
	                		  title: '信息提示',
	                		  content: '回复成功!'
	                		}); 
	                }
	            });	 
	
}


</script>
</body>
</html> 
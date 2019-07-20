
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
<h2>学生信息查询</h2>
<table  class="layui-table">
<tr>
<td><input id="str" placeholder="学号/姓名/性别" type="text" class="layui-input"/></td><td><a href="javascript:void(0)" onclick="findStudent()" class="layui-btn layui-btn-normal layui-btn-radius">查询</a></td></tr>
</table>
<div id="table1"></div>
</center>
<script type="text/javascript">


function findStudent()
{
	$("#table1").find("table").remove();
	//已2018开头或者换为学号长度
	var reg = /^(2018).*/i;
	var num='';
	var cid='';
	var sex='';
	if($("#str").val()=='男' ||$("#str").val()=='女' ){
		
		cid='';
		sex=$("#str").val();
		num='';
		
	}else if(reg.test($("#str").val())==true){
		
		cid='';
		sex='';
		num=$("#str").val();
	}else{
		cid=$("#str").val();
		sex='';
		num='';
		
	}
	
	$.ajax(
			{
				url:"teacher/findbylike",
				data:{"stu.stuNum":num,"stu.stuName":cid,"stu.sex":sex},
				type:'post',
				dataType:'html',
				success:function(data)
				{
					$("#table1").find("table").remove();
					$("#table1").append(data);
				}
			});
}



</script>
</body>
</html>
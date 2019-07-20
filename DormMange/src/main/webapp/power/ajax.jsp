<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" media="all">
</head>
<body>
<div id="showInfo" style="width: 80%; border: 0px solid black; margin: 0 auto;">
			<table class="layui-table" style="width: 80%;" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td>编号</td>
					<td>名称</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${list }" var="entity">
					<tr>
						<td>${entity.p_id }</td>
						<td>
							<a href="javascript:void(0)" onclick="showView(${entity.p_id })">${entity.p_name }</a>
						</td>
						<td>
							<a href="javascript:void(0)" onclick="showSave(${entity.p_id },'${entity.p_name }')">添加子菜单</a>
							<a href="javascript:void(0)" onclick="showUpdate(${entity.p_id },'${entity.p_name }','${entity.p_url }',${entity.p_mgr })">修改菜单</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="save" style="width: 80%; border: 0px solid black; margin: 0 auto;">
			<table class="layui-table" style="width: 80%;" border="1">
				<tr>
					<td>名称</td>
					<td>
						<input class="layui-input" type="text" id="save-name" />
					</td>
				</tr>
				<tr>
					<td>请求路径</td>
					<td>
						<input class="layui-input" type="text" id="save-url" />
					</td>
				</tr>
				<tr>
					<td>父级菜单</td>
					<td>
						<input type="hidden" id="save-mgrName" readonly="readonly" />
						<input type="hidden" id="save-mgr" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" class="layui-btn" value="添加" onclick="save()"/>
					</td>
				</tr>
			</table>
		
		</div>
		<div id="update" style="width: 80%; border: 0px solid black; margin: 0 auto;">
			<table class="layui-table" style="width: 80%;" border="1">
				<tr>
					<td>名称</td>
					<td>
						<input class="layui-input" value="${entity.p_name }" type="text" id="update-name" />
					</td>
				</tr>
				<tr>
					<td>请求路径</td>
					<td>
						<input class="layui-input" value="${entity.p_url }" type="text" id="update-url" />
					</td>
				</tr>
						
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" id="update-id" readonly="readonly" />
						<input type="hidden" id="update-mgr" readonly="readonly" />
						<input type="button" class="layui-btn" value="修改" onclick="update()"/>
					</td>
				</tr>
			</table>
		</div>
		<div id="view" style="width: 80%; border: 0px solid black; margin: 0 auto;">
		
		
		</div>
</body>
</html>
<script type="text/javascript">
	//窗体加载事件
	$(function(){
		
		clear();
	})
	function clear()
	{
		$("#save").hide();
		$("#update").hide();
		$("#view").hide();
	}

	function showSave(id,name)
	{
		clear();
		$("#save-mgr").val(id);
		$("#save-mgrName").val(name);
		$("#save").show();
		
		
	}
	function save()
	{
		//获得参数
		var name = $("#save-name").val();
		var url = $("#save-url").val();
		var mgr = $("#save-mgr").val();
		
		//将参数提交给数据库
		//alert(name+","+url+","+mgr);
		$.ajax(
		{
			url:"ajaxSave",
			type:'post',
			data:{"entity.p_name":name,"entity.p_url":url,"entity.p_mgr":mgr},
			dataType:'text',
			success:function(data)
			{
				//alert(data);
				//隐藏
				$("#save").hide();
				//清空
				$("#save-name").val("");
				$("#save-url").val("");
			}
		});
	}
	
	function showUpdate(id,name,url,mgr)
	{
		clear();
		$("#update-id").val(id);
		$("#update-name").val(name);
		$("#update-url").val(url);
		$("#update-mgr").val(mgr);
		$("#update").show();
	}
	function update()
	{
		//获得参数
		var name = $("#update-name").val();
		var url = $("#update-url").val();
		var id = $("#update-id").val();
		var mgr = $("#update-mgr").val();
		//隐藏
		$("#update").hide();
		$.ajax(
				{
					url:"ajaxUpdate",
					type:'post',
					data:{"entity.p_name":name,"entity.p_url":url,"entity.p_mgr":mgr,"entity.p_id":id},
					dataType:'text',
					success:function(data)
					{
						//alert(data);
						//隐藏
						$("#update").hide();
						
					}
				});
	
		
	}
	
	function showView(id)
	{
		clear();
		$.ajax
		(
			{
				url:"ajaxView",
				type:'post',
				data:{"entity.p_id":id},
				dataType:"html",
				success:function(data)
				{
					if(data == "没有子菜单")
					{
						alert(data);
						
					}
					else
					{
						$("#view").html(data);
						$("#view").show();
					}
					
				}
				
			}		
		);
		
		
		
		
	}
	
</script>


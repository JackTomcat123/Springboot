<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>

</head>
<body>
	<div>${entity.r_name }</div>
	<hr>
	<script  type="text/javascript">
	function findPower(id,rid)
	{
		$.ajax(
				{
					url:"/DormMange/power/findPowerMgrById3",
					data:{"entity.p_id":id,"role.r_id":rid},
					type:'post',
					dataType:'html',
					success:function(data)
					{
						$("#100-"+id).html(data);
						$("input[type='checkbox']").click(function()
								{
							
									//全选/全不选
									var flag = $(this).attr("checked");
									if(!flag) flag = false;
									
									$(this).next().next().next().find("input[type='checkbox']").attr('checked',flag);
								
									//如果子集选中，则父子被选中，如果子集没有选中则父级没有选中
									var fatherBox = $(this).parent().parent().parent().prev().prev().prev();
									
									if(fatherBox.html() == "undefind")
									{
										alert(fatherBox.html());
										alert("退出");
										return;
									}
									var f = false;
									$(this).parent().parent().find("input[type='checkbox']").each(function(){
										//文本框
										if($(this).attr('checked'))
											f = true;
									});
									
									fatherBox.attr("checked",f);
									
									//$(fatherBox).click();
								})
					}
				});
	}
</script>

	<form action="Power" method="post">
		<div id="100-0">
			<script type="text/javascript">
			findPower(0,${entity.r_id});
			</script>
		</div>
	
		<hr>
		<div>
			<input type="hidden" value="${entity.r_id }" name="entity.r_id">
			<input type="submit" value="提交">
		</div>
	</form>
</body>
</html>

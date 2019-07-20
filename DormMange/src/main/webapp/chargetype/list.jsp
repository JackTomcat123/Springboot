<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
</head>
<body>
<center>    
     <a class="layui-btn layui-btn-sm layui-btn-normal" href="save.jsp">添加</a>        
    <table border="1" class="layui-table">
        <tr>
           <td>缴费类型编号</td>
           <td>缴费类型</td>
           <td>价格(/季度)</td>
           <td>备注</td>
           <td>操作</td>
        </tr>
        <c:forEach items="${list }" var="entity">
        <tr>
           <td>${entity.typeid }</td>
           <td>${entity.typename }</td>
           <td>${entity.unitprice }</td>
           <td>${entity.memo }</td>
           <td colspan="2" align="center">
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="toUpdate?entity.typeid=${entity.typeid} ">修改</a>
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="delete?entity.typeid=${entity.typeid} ">删除</a>
           </td>
        </tr>
        </c:forEach>
          <tr><td align="right" colspan="6"><a href="${pageContext.servletContext.contextPath }/index.jsp" class="layui-btn layui-btn-sm layui-btn-normal" ><i class="layui-icon"></i></a></td></tr>
    </table>
</center>
</body>
<script type="text/javascript">
   function updateflag(id){
	   $.ajax({
		url:"/Dorm/chargetype/updateflag",
   		data:{"entity.typeid":id},
   		type:'post',
   		dataType:'text',
		success:function(data){
			alert(data);
		}
	   })
   }
</script>

</html>
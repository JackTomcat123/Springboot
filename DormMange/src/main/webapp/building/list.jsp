<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
<center>   
    <a class="layui-btn layui-btn-sm layui-btn-normal" href="save.jsp">添加</a>         
    <table class="layui-table">
        <tr>
           <td>楼编号</td>
           <td>楼名称</td>
           <td>房间数</td>
           <td>楼层</td>
           <td>操作</td>
        </tr>
        <c:forEach items="${list }" var="entity">
        <tr>
           <td>${entity.buildid }</td>
           <td>${entity.buildname }</td>
           <td>${entity.dormcount }</td>
           <td>${entity.dormfloor }</td>
           <td colspan="2" align="center">
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="toUpdate?entity.buildid=${entity.buildid} ">修改</a>
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="delete?entity.buildid=${entity.buildid}">删除</a>
           </td>
        </tr>
        </c:forEach>
        <tr><td align="right" colspan="6"><a href="${pageContext.servletContext.contextPath }/index.jsp" class="layui-btn layui-btn-sm layui-btn-normal" ><i class="layui-icon"></i></a></td></tr>
    </table>
    
</center>
</body>
</html>
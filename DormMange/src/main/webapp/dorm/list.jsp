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
<a href="toInsert" class="layui-btn layui-btn-sm layui-btn-normal">添加</a>         
    <table border="1" class="layui-table">
        <tr>
           <td>编号</td>
           <td>宿舍名</td>
           <td>宿舍类型</td>
           <td>宿舍楼编号</td>
           <td>人数</td>
           <td>备注</td>
           <td>操作</td>
        </tr>
        <c:forEach items="${list }" var="entity">
        <tr>
           <td>${entity.dormId }</td>
           <td>${entity.dormNum }</td>
           <td>${entity.type.typename }</td>
           <td>${entity.build.buildname }</td>
           <td>${entity.personCount }</td>
           <td>${entity.memo }</td>
           <td colspan="2" align="center">
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="toUpdate?entity.dormId=${entity.dormId} ">修改</a>
              <a  class="layui-btn layui-btn-sm layui-btn-normal" href="delete?entity.dormId=${entity.dormId}">删除</a>
           </td>
        </tr>
        </c:forEach>
          <tr><td align="right" colspan="8"><a href="${pageContext.servletContext.contextPath }/index.jsp" class="layui-btn layui-btn-sm layui-btn-normal" ><i class="layui-icon"></i></a></td></tr>
    </table>
</center>
</body>
</html>
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
           <td>班级名</td>
           <td>班主任</td>
           <td>开班时间</td>
           <td>毕业时间</td>
           <td>备注</td>
           <td>操作</td>
        </tr>
        <c:forEach items="${list }" var="entity">
        <tr>
           <td>${entity.classId}</td>
           <td>${entity.className }</td>
           <td>${entity.teacher.teachName}</td>
           <td>${entity.createDate }</td>
           <td>${entity.endDate==null?'未毕业':entity.endDate }</td>
           <td>${entity.memo }</td>
           <td colspan="2" align="center">
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="toUpdate?entity.classId=${entity.classId} ">修改</a>
              <a  class="layui-btn layui-btn-sm layui-btn-normal" href="delete?entity.classId=${entity.classId}">删除</a>
           </td>
        </tr>
        </c:forEach>
          <tr><td align="right" colspan="8"><a href="${pageContext.servletContext.contextPath }/index.jsp" class="layui-btn layui-btn-sm layui-btn-normal" ><i class="layui-icon"></i></a></td></tr>
    </table>
</center>
</body>
</html>
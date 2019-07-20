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
           <td>姓名</td>
           <td>用户名</td>
           <td>密码</td>
           <td>性别</td>
           <td>生日</td>
           <td>身份证号</td>
           <td>学历</td>
           <td>专业</td>
           <td>电话</td>
           <td>地址</td>
           <td>备注</td>
           <td>入职日期</td>
           <td>离职日期</td>
           <td>教师类别</td>
           <td>操作</td>
        </tr>
        <c:forEach items="${list }" var="entity">
        <tr>
           <td>${entity.teachId }</td>
           <td>${entity.teachName }</td>
           <td>${entity.teachUserName }</td>
           <td>${entity.teachPass }</td>
           <td>${entity.sex }</td>
           <td>${entity.birthday }</td>
           <td>${entity.idCard }</td>
            <td>${entity.edulevel }</td>
            <td>${entity.specialty }</td>
            <td>${entity.tel }</td>
            <td>${entity.address }</td>
            <td>${entity.memo }</td>
            <td>${entity.hireDate }</td>
            <td>${entity.leaveDate==null ?'在上岗':entity.leaveDate}</td>
            <td>${entity.type.typename }</td>
           <td colspan="2" align="center">
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="toUpdate?entity.teachId=${entity.teachId} ">update</a>
              <a  class="layui-btn layui-btn-sm layui-btn-normal" href="delete?entity.teachId=${entity.teachId}">delete</a>
           </td>
        </tr>
        </c:forEach>
          <tr><td align="right" colspan="10"><a href="${pageContext.servletContext.contextPath }/index.jsp" class="layui-btn layui-btn-sm layui-btn-normal" ><i class="layui-icon"></i></a></td></tr>
    </table>
</center>
</body>
</html>
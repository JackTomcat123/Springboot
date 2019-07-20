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
           <td>学号</td>
            <td>姓名</td>
           <td>用户名</td>
           <td>密码</td>
           <td>性别</td>
           <td>生日</td>
           <td>身份证号</td>
           <td>班级</td>
           <td>电话</td>
           <td>省份</td>
           <td>城市</td>
           <td>入学日期</td>
           <td>宿舍</td>
           <td>备注</td>
           <td>操作</td>
        </tr>
        <c:forEach items="${list}" var="entity">
        <tr>
           <td>${entity.stuId }</td>
           <td>${entity.stuNum }</td>
           <td>${entity.stuName }</td>
           <td>${entity.stuUserName }</td>
           <td>${entity.stuPass }</td>
           <td>${entity.sex }</td>
           <td>${entity.birthday }</td>
           <td>${entity.cardId }</td>
            <td>${entity.clazz.className }</td>
            <td>${entity.tel }</td>
            <td>${entity.province }</td>
            <td>${entity.city}</td>
             <td>${entity.inDate }</td>
             <td>${entity.dorm.dormNum }</td>
            <td>${entity.memo }</td>
           <td colspan="2" align="center">
              <a class="layui-btn layui-btn-sm layui-btn-normal" href="toUpdate?entity.stuId=${entity.stuId} ">update</a>
              <a  class="layui-btn layui-btn-sm layui-btn-normal" href="delete?entity.stuId=${entity.stuId}">delete</a>
           </td>
        </tr>
        </c:forEach>
          <tr><td align="right" colspan="10"><a href="${pageContext.servletContext.contextPath }/index.jsp" class="layui-btn layui-btn-sm layui-btn-normal" ><i class="layui-icon"></i></a></td></tr>
    </table>
</center>
</body>
</html>
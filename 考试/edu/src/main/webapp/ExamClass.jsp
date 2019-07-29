<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>学生考试次数统计</title>
	<%
    	String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
	<c:set var="path" value="<%=basePath %>"></c:set>
 	<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
 	<script src="js/jquery.js"></script>
    <style type="text/css">
    	li {list-style: none;float: left;margin-left: 9px;}
    	a{text-decoration:none;}
		a:HOVER{text-decoration: none;}
		a:link{text-decoration:none; }
		a:visited{text-decoration:none; }
		a:active{text-decoration:none;}
		li a {cursor: pointer;}
    </style>
</head>
<body>
	<div style="width: 100%; height: 500px;">
		<div style="width: 104px; height: 100%;float: left; margin-left: 10px;">
			<strong>描述：</strong>
			<p style="font-size: 12px;">当前图表所描述了本班
				所有学生考试信息
			</p>
			<p style="font-size: 12px;">
			当前老师的所有班级：
			</p>
			<c:forEach items="${list }" var="l">
			<p style="font-size: 12px;">
			<a href="admin/charts/studentExamCount.jsp?classId=${l.classId}">${l.className}</a>
			</p>
			</c:forEach>
			<div>
			</div>
		</div>
		<div id="stuExamInfo" style="margin-left: 100px; width:750px; height: 400px; float: left; border: 1px solid #E5E5E5;"></div>
	</div>
	<script>

</script>
</body>
</html>
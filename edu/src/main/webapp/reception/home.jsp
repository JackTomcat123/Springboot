<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<%
    	String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
	<c:set var="path" value="<%=basePath %>"></c:set>
 	<link href="${path }/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-color: #EEEEEE;">
	<div class="jumbotron" style="height: 630px;padding-top: 100px; padding-bottom: 0px; margin-bottom: 0px;">
		<div style="padding-left: 20px;">
			<h1>
				智云在线考试系统
			</h1>
			<p>
				&emsp;&emsp;一个专注于学习的在线考试系统<br />
			</p>
			<p>
				&emsp;&emsp;岁月无声，我只相信缘分，萍水相逢，我只相信自己，做自己的事，做自己的路，千万不要效仿他人！
			</p>
			<p>
　　			北冥有鱼，其名为鲲，化而为鸟，其名为鹏，鹏之大，一锅炖不下，需要两个烧烤架，一个红烧，一个麻辣，再来两瓶雪花，带你勇闯天涯！爱学习，我骄傲！
			</p>
			<p>
				<a class="btn btn-primary btn-large" href="https://www.baidu.com">Learn more</a>
			</p>
		</div>
	</div>

	<!-- js引入 -->
    <script src="${path }/js/jquery.js"></script>
    <script src="${path }/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>
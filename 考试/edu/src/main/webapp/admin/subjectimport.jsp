<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>试题导入</title>
	<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<p>所属科别</p>
			<form action="${pageContext.servletContext.contextPath}/Sub/ExcelImport" method="post" enctype="multipart/form-data">
						<select style="height:30px;width: 100px" name="division">
							<option value="0">综合</option>
							<option value="1">文科</option>
							<option value="2">工科</option>
						</select>
				<br/>

					<p>所属科目</p>
						<select id="courseId"  style="height:30px;width: 100px" name="courseId">
							<c:if test="${courses != null }">
								<c:forEach items="${courses }" var="course">
									<option value="${course.courseId }">${course.courseName }</option>
								</c:forEach>
							</c:if>
						</select>
		<br/>
					<p>所属年级</p>
						<select style="height:30px;width: 100px" name="gradeId">
							<c:if test="${grades != null }">
								<c:forEach items="${grades }" var="grade">
									<option value="${grade.gradeId }">${grade.gradeName }</option>
								</c:forEach>
							</c:if>
						</select>

					<p>选项</p>
							<input type="radio"  checked="checked" /> 只导入试题
						<br/>
						<span class="help-block" id="alltips">注意: 导入 Excel 文件中的第一行必须是包含 
						<b class="tips">题目</b>|<b class="tips">答案A-D</b>|<b class="tips">正确答案</b>|<b class="tips">分值</b>|<b class="tips">试题类型</b>|<b class="tips">难易程度</b> 
						与其列对应, 第一行标题名不得有误, 否则将无法解析; 如果是导入到新建试卷, 试卷和试题同用 分科、科目、年级信息。</span>

				<br/>
						<br/>
					<p>难易程度</p>

						<select style="height:30px;width: 100px" name="examPaperEasy" >
							<option value="0">简单</option>
							<option value="1">普通</option>
							<option value="2">困难</option>
						</select>
			<br/>
						<br/>

						<input name="file" type="file" />
						<br/>
						<br/>
						<input class="btn btn-default" type="submit" value="提交"/>
			</form>
</body>
</html>
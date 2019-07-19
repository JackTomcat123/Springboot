<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<center>
<a href="toInsert">insert</a>
<h4>员工列表</h4>
	<form action="Del" method="post">
<table border="1" width="80%">
<tr>
	<td><input  type="submit" value="批量删除"/></td>
<td>编号</td>
<td>姓名</td>
<td>部门</td>
<td>照片</td>
<td colspan="2" align="center">操作</td>
</tr>
<c:forEach  items="${list}"   var="e">
<tr>
	<td><input type="checkbox" value="${e.eid}" name="eids"></td>
<td>${e.eid}</td>
<td>${e.ename}</td>
<td>${e.dname}</td>
<td><img  src="${pageContext.servletContext.contextPath }/upload/${e.img}" height="50px" width="50px"> </td>
<td><a href="toUpdate?eid=${e.eid}">update</a></td>
<td><a href="delete?eid=${e.eid}">delete</a></td>
</tr>
</c:forEach>
</table>
		<a href="http://localhost:8080">考试</a>

	</form>
<input type="button" value="首页" onclick="toPage(1)" />
	<input type="button" value="上一页" onclick="toPage(${bean.nowPage-1})" />
	<input type="button" value="下一页" onclick="toPage(${bean.nowPage+1})" />
	<input type="button" value="尾页" onclick="toPage(${bean.totalPage})" />
	<select onchange="toPage(this.value)">
		<c:forEach begin="1" end="${bean.totalPage }" step="1" varStatus="i" >
			<option ${bean.nowPage == i.index ? 'selected':'' } value="${i.index }">${i.index }</option>
		</c:forEach>
	</select> / ${bean.totalPage }
	<script type="text/javascript">
		function toPage(nowPage)
		{
			if(nowPage <= 0)
			{
				alert("已经是第一页了");
				nowPage = 1;
			}
			if(nowPage > ${bean.totalPage})
			{
				alert("已经是第最后一页了");
				nowPage = ${bean.totalPage};
			}
			
			window.location = "findAll?nowPage="+nowPage;
		}

	</script>
</center>

</body>
</html>
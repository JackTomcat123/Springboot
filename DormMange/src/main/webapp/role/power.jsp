<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
</head>
<body>
<center>
<h3>管理员</h3>
	<div>${entity.r_name }</div>
	<hr>
	选择角色：
	<br/>
	<br/>
	<form action="Power" method="post">
		<div>
			<c:forEach items="${plist}" var="p">
			<input type="checkbox"  value="${p.p_id }" name="pid" id="show${p.p_id }"/>${p.p_name }<br />
			</c:forEach>
			<div id="sh">
		<c:forEach items="${p}" var="r">
			<input  type="hidden" id="info${r.p_id}" type="text" class="info" value="${r.p_id}">
		</c:forEach>
			</div>
		</div>
		<hr>
		<div>
			<input type="hidden" value="${entity.r_id }" name="entity.r_id">
			<input type="submit" value="提交">
		</div>
	</form>
	</center>

</body>
<script type="text/javascript">
	$(function() {
		var s = $(".info").val();
		$(".info").each(function (index,e) {
			$("#show"+this.value).attr("checked", true);
		})
	})
</script>
</html>
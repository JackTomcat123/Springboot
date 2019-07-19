<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<body>
<center>
<H1>员工添加</H1>
<form action="insert" method="post" enctype="multipart/form-data">
<table border="1" width="60%">
<tr>
<td>姓名：</td>
<td><input type="text" name="ename"/></td>
</tr>
<tr>
<td>部门：</td>
<td>
<select name="deptid">
<c:forEach items="${dlist}" var="d">
<option value="${d.deptid}">${d.dname}</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>照片：</td>
<td><input type="file" name="image"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="submit"></td>
</tr>
</table>
</form>
<br/>
    <h3>按部门查询该部门员工</h3>
    <hr/>
    <select name="deptid" onchange="show(this.value)" style="width: 100px;height: 30px;" >
        <option value="0">--请选择--</option>
        <c:forEach items="${dlist}" var="d">
            <option value="${d.deptid}">${d.dname}</option>
        </c:forEach>
    </select>
    <br/>
    <div id="show"></div>
</center>
<script>
    function show(deptid) {
        $("#show").val(" ");
        var deptid = deptid;
        $.ajax({
            url:'findEmp',
            type:'post',
            data:{"deptid":deptid},
            dataType:'json',
            success:function (data) {
                var html = "";
                for(var i = 0 ; i < data.length; i++)
                {
                    html += data[i].eid+"&nbsp;&nbsp;&nbsp;";
                    html += data[i].ename+"&nbsp;&nbsp;&nbsp;";
                    html += data[i].dname+"&nbsp;&nbsp;&nbsp;";
                    html += data[i].loc+"&nbsp;&nbsp;&nbsp;";
                    html += "<hr />";
                }
                $("#show").html(html);
            }


        });
    }
</script>
</body>
</html>
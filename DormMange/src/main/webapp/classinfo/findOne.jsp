<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
     <center>
   
   <form action="update" method="post">
      <table border="1" class="layui-table">
         <tr>
            <td>班级名:</td>
            <td>${entity.className }</td>
         </tr>
         <tr>
            <td>班主任:</td>
            <td>
  ${entity.teacher.teachName}
            </td>
         </tr>
          <tr>
            <td>开班时间:</td>
            <td>
         ${ entity.createDate}
            </td>
         </tr>
         <tr>
            <td>备注:</td>
            <td>${entity.memo }</td>
         </tr>
      </table>
   </form>
   </center>
</body>
</html>
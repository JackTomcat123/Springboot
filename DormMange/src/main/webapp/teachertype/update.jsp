<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
      <form action="update" method="post">
      <table border="1" class="layui-table">
        <tr>
            <td>类型名称:</td>
            <td><input class="layui-input" name="entity.typename" value="${entity.typename }"/></td>
         </tr>
         <tr>
            <td>备注:</td>
            <td><input class="layui-input" name="entity.memo" value="${entity.memo }"/></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="hidden" name="entity.typeid" value="${entity.typeid }"/>
               <input  class="layui-btn" type="submit" value="提交"/>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>
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
   <form action="save" method="post">
      <table border="1" class="layui-table">
         <tr>
            <td>类型名称:</td>
            <td><input class="layui-input" name="entity.typename"/></td>
         </tr>
         <tr>
            <td>额定人数:</td>
            <td><input class="layui-input" name="entity.personcount"/></td>
         </tr>
         <tr>
            <td>住宿价格:</td>
            <td><input class="layui-input" name="entity.price"/></td>
         </tr>
         <tr>
            <td>性别:</td>
            <td><input class="layui-input" name="entity.sex"/></td>
         </tr>
         <tr>
            <td>备注:</td>
            <td><input class="layui-input" name="entity.memo"/></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input class="layui-btn" type="submit" value="提交"/>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>
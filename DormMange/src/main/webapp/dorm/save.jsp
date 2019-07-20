<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
   <form action="insert" method="post">
      <table border="1" class="layui-table">
         <tr>
            <td>宿舍号:</td>
            <td><input class="layui-input" name="entity.dormNum"/></td>
         </tr>
         <tr>
            <td>宿舍类型:</td>
            <td>
            
            <select class="layui-input" name="entity.type.typeid">
            <option value="0">--请选择--</option>
            <c:forEach items="${t_list }" var="t">
            <option value="${t.typeid}">${t.typename}</option>
              </c:forEach>
            </select>
            </td>
         </tr>
          <tr>
            <td>宿舍楼编号:</td>
            <td>
            <select class="layui-input" name="entity.build.buildid">
            <option value="0">--请选择--</option>
            <c:forEach items="${b_List }" var="b">
            <option value="${b.buildid}">${b.buildname}</option>
              </c:forEach>
            </select>
            </td>
         </tr>
         <tr>
            <td>宿舍人数:</td>
            <td><input class="layui-input" name="entity.personCount"/></td>
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
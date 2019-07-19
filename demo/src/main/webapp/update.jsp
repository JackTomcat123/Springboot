<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script type="text/javascript">
        function setImagePreview() {
            var docObj=document.getElementById("doc");
            var imgObjPreview=document.getElementById("preview");
            if(docObj.files && docObj.files[0]){
//火狐下，直接设img属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '243px';
                imgObjPreview.style.height = '150px';
//imgObjPreview.src = docObj.files[0].getAsDataURL();
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
            }else{
//IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById("localImag");
//必须设置初始大小
                localImagId.style.width = "303px";
                localImagId.style.height = "300px";
//图片异常的捕捉，防止用户修改后缀来伪造图片
                try{
                    localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }catch(e){
                    alert("您上传的图片格式不正确，请重新选择!");
                    return false;
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
            return true;
        }
    </script>
</head>
<body>
<center>
<H1>员工添加</H1>
<form action="update" method="post" enctype="multipart/form-data">
<table border="1" width="60%">
<tr>
<td>姓名：</td>
<td><input type="text" name="ename" value="${entity.ename}"/></td>
</tr>
<tr>
<td>部门：</td>
<td>
<select name="deptid">
<c:forEach items="${dlist}" var="d">
<option ${entity.deptid==d.deptid?'selected':''} value="${d.deptid}">${d.dname}</option>

</c:forEach>
</select>

</td>
</tr>
<tr>
    <input type="hidden" name="eid" value="${entity.eid}">
    <input type="hidden" name="img"value="${entity.img}">
<td>
    <!-- 图片显示 -->
    <div id="localImag">
       新照片： <img id="preview" width=-1 height=-1 style="diplay:none" />
    </div>
    <input type="file" name="image" style="height:35;" class="input-text lh30" size="10" id="doc"onchange="javascript:setImagePreview();"/>
   原照片： <img src="${pageContext.servletContext.contextPath}/upload/${entity.img}" height="50px" width="50px"></td>
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="submit"></td>
</tr>
</table>


</form>


</center>
</body>
</html>
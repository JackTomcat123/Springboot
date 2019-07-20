<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Insert title here</title>

    <style>
            .green{
            
     background-color:springgreen;
            color: black;
            width: 100px;
            margin: 10px;
            }
            .red{
            background-color:tomato;
            color: white;
            width: 100px;
           
            margin: 10px;
            }
            
            </style>
            <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
            <script type="text/javascript" src="../layui/layui.js"></script>
            <link rel="stylesheet" type="text/css" href="../layui/css/layui.css" >
</head>
<body>
      <center>
       <h2>入住办理</h2>
        </center>
    <div style="width:350px;overflow:hidden;  float: left; text-align:  center; margin: 10px; height:800px; border: 1px black solid;"> 
    <div style="width:300px; height:100px; margin: 10px;">
            <font color="red"><h2>学生信息</h2></font><br/>
            <table style="width:300px;height:80px;" class="layui-table">
            <tr><td>学号</td><td>姓名</td><td>性别</td><td>班级</td><td>辅导员</td></tr>
            <c:forEach items="${s_list}" var="s">
            <tr>
             <input type="hidden" id="stuid" name="stu.stuId" value="${s.stuId }">
            <input type="hidden" id="teachid" value="${s.clazz.teacher.teachId}">
            <input type="hidden" id="sex" value="${s.sex}">
            <td> ${s.stuNum}</td>
            <td>${s.stuName} </td>
            <td>${s.sex}</td>
            <td>${s.clazz.className}</td>
            <td> ${s.clazz.teacher.teachName}</td>
            </tr>
            <tr><td colspan="5" align="center"> <a href="javascript:void(0)" onclick="findBuild()"class="layui-btn layui-btn-warm layui-btn-radius" >选择宿舍楼</a></td></tr>
            </c:forEach>
            </table>
            
    </div>
    
<div style="width:300px;  height:500px; margin-top:200px;">
        <div id="info" style="width:300px;  height:50px;"></div>

</div>
</div>
<div style="width:800px;overflow:hidden;  float: left; text-align:  center; margin: 10px; height:800px; border: 1px black solid;">

        <div style="width:800px;margin-top: 10px;"> 
        <img  src="../img/2.jpg" height="160px;" width="200px;"/><img  src="../img/3.jpeg" height="160px;" width="200px;"/><img  src="../img/4.jpeg"height="160px;" width="200px;"/>
        </div>
         <div style="width:800px;  height:100px; margin-top:60px;">
         <center><h2>房间状态</h2><div class="green">未住满</div><div class="red">已住满</div></center>
        </div>
        
        <div style="width:800px;  height:900px; margin: 10px;">
                <div id="info1"></div>
        </div>

</div>
</body>
  <script type="text/javascript" src="../js/layer.js"></script>
<script type="text/javascript">
    function findBuild(){
        var sex=$("#sex").val();
        //alert(sex);
        $("#info").find("table").remove(); 
        $.ajax(
                {
                    url:"teacher/findBuildbySex",
                    data:{"sex":sex},
                    type:'post',
                    dataType:'html',
                    success:function(data)
                    {
                        $("#info").find("table").remove(); 
                        $("#info").append(data);
                    }
                });
    }
    
    function findDorm(id){
        var id=id;
        $("#info1").find("div").remove(); 
        $.ajax(
                {
                    url:"teacher/findDorm",
                    data:{"dorm.build.buildid":id},
                    type:'post',
                    dataType:'html',
                    success:function(data)
                    {
                        $("#info1").find("div").remove(); 
                        $("#info1").append(data);
                    }
                }); 
    }
    //付款
    function Incharge(typeid,dormid,price){
        //获取参数
    var stuid=$("#stuid").val();
    var teachid=$("#teachid").val();
    var typeid=typeid;
    var dormid=dormid;
    var price=price;
    //调用方法
    $.ajax(
            {
                url:"/DormMange/student/toPay",
                data:{"entity.stuId":stuid,"dormid":dormid,"typeid":typeid,"price":price,"teachid":teachid},
                type:'post',
                dataType:'html',
                success:function(data)
                {
                    //""+"&dormid="+dormid
                    window.location="/DormMange/student/findCost?entity.stuId="+stuid+"&dormid="+dormid;
                }
            }); 
    
    
    }
    //已住满
    function over(){
        
        alert('该宿舍已经住满！');
    }
    //查询宿情况
    function findPerson(id){
      $("#stuinfo").find("table").remove();
        var stuid=id;
        $.ajax(
                {
                    
                    url:"teacher/findPerson",
                    data:{"stu.dorm.dormId":id},
                    type:'post',
                    dataType:'html',
                    success:function(data)
                    {   //弹出层显示
                    	  showinfo();
                        $("#stuinfo").find("table").remove(); 
                        $("#stuinfo").append(data);
                      
                        
                    }
                }); 
        //弹出层隐藏
        hide();
        
    }
  //弹出层隐藏
    
    function hide(){
    	   layui.use('layer',function(){
               var layer=layui.layer;
               layer.open({
          		  title:"本宿舍已入住的学生信息",
          		  offset: ['100px', '310px'],//上，左坐标
          		  type: 1,		 
          		  area: ['500px', '300px'], //宽高
          		  display:none,
          		  content: '<div id="stuinfo"></div>'
                });  
           });
    	
    }
  //弹出层显示
    function showinfo(){
 	   layui.use('layer',function(){
            var layer=layui.layer;
            layer.open({
       		  title:"本宿舍已入住的学生信息",
       		  offset: ['100px', '310px'],//上，左坐标
       		  type: 1,		 
       		  area: ['500px', '300px'], //宽高
       		  content: '<div id="stuinfo"></div>'
             });  
        });
 	
 }
    </script>
</html>
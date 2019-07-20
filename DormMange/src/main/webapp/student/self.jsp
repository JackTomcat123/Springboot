<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../js/layer.js"></script>
	<script type="text/javascript" src="../common/layui/layui.js"></script>
		<link rel="stylesheet" type="text/css" href="../layui/css/layui.css" media="all">
</head>
<body>
<center>
<a href="javascript:;" class="layui-btn" onclick="findSelf(${ENTITY.u_num})">查询个人信息</a>&nbsp;&nbsp;<a  href="javascript:;" onclick="upPass()" class="layui-btn">修改密码</a>
</center>
<script>
function findSelf(id){
	
 $("#stuinfo").find("table").remove();
      var stuid=id;
      $.ajax(
              {                 
                  url:"findStuSelf",
                  data:{"entity.stuId":stuid},
                  type:'post',
                  dataType:'html',
                  success:function(data)
                  {   //弹出层显示
                  	   self();
                      $("#stuinfo").find("table").remove(); 
                      $("#stuinfo").append(data);
                  }
              });
      hide();
  }
//个人信息显示层
 function self(){
 	   layui.use('layer',function(){
            var layer=layui.layer;
            layer.open({
       		  title:"个人信息显示",
       		  offset: ['100px', '310px'],//上，左坐标
       		  type: 1,		 
       		  area: ['600px', '500px'], //宽高
       		  content: '<div id="stuinfo"></div>'
             });  
        });
 	
 }
 //个人信息隐藏层
   function hide(){
    	   layui.use('layer',function(){
               var layer=layui.layer;
               layer.open({
          		  title:"个人信息显示",
          		  offset: ['100px', '310px'],//上，左坐标
          		  type: 1,		 
          		  area: ['600px', '500px'], //宽高
          		  display:none,
          		  content: '<div id="stuinfo"></div>'
                });  
           });
    	
    }
 //申请退宿
 function out(stuid,teachid,dormid){
	 var stuid=stuid;
	 var teachid=teachid;
	 var dormid=dormid;
	 layer.closeAll();//关闭弹出层
	 layui.use('layer',function(){
         var layer=layui.layer;
         layer.open({
    		  title:"学生申请",
    		  offset: ['100px', '310px'],//上，左坐标
    		  type: 1,		 
    		  area: ['600px', '320px'], //宽高
    		  content:'<div id="out">'
    	   +'<table class="layui-table">'
    	   +'<tr><td>退宿说明</td><td><font color="red">请严格按照下面提示来写，不然不给通过</font></td></tr>'
         +'<tr><td>退宿原因</td><td><textarea placeholder="由。。。而退宿" class="layui-textarea" id="memo"></textarea></td></tr>'
         +'<tr><td colspan="2" align="center"><input onclick="outing('+stuid+','+teachid+','+dormid+')" class="layui-btn layui-layer-close" value="提交"></td></tr>'
         +'</table>'
        +'</div>'
          });  
     });
	
 }
 //换宿申请
  function change(stuid,teachid,dormid){
	 var stuid=stuid;
	 var teachid=teachid;
	 var dormid=dormid;
	  layer.closeAll();
	 layui.use('layer',function(){
         var layer=layui.layer;
         layer.open({
    		  title:"学生申请",
    		  offset: ['100px', '310px'],//上，左坐标
    		  type: 1,		 
    		  area: ['600px', '500px'], //宽高
    		  content:'<div id="out">'
    	   +'<table class="layui-table">'
    	   +'<tr><td>退宿说明</td><td><font color="red">请严格按照下面提示来写，不然不给通过</font></td></tr>'
         +'<tr><td>换宿内容</td><td><textarea placeholder="eg:由男1号楼101宿舍换到男2号楼102宿舍" class="layui-textarea" id="memo"></textarea></td></tr>'
         +'<tr><td colspan="2" align="center"><input onclick="changing('+stuid+','+teachid+','+dormid+')" class="layui-btn" value="提交"></td></tr>'
         +'</table>'
        +'</div>'
          });  
     });
 }
 //退宿申请提交
 function outing(stuid,teachid,dormid){
	 var stuid=stuid;
	 var teachid=teachid;
	 var dormid=dormid;
	 var memo=$("#memo").val();
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"outDrom",
                 data:{"out.stu.stuId":stuid,"out.teach.teachId":teachid,"out.dorm.dormId":dormid,"out.memo":memo},
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {  layer.open({
           		  title: '信息提示',
        		  content: '已发送!'
        		}); 
                 }
             });
	 
	 
 }
 //转宿申请提交
 function changing(stuid,teachid,dormid){
	 var stuid=stuid;
	 var teachid=teachid;
	 var dormid=dormid;
	 var memo=$("#memo").val();
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"outDrom",
                 data:{"out.stu.stuId":stuid,"out.teach.teachId":teachid,"out.dorm.dormId":dormid,"out.memo":memo},
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {   layer.open({
           		  title: '信息提示',
        		  content: '已发送!'
        		}); 
                 }
             });
	 
	 
 }
 //修改个人密码
   function upPass(u_id,stuid){
	   layui.use('layer',function(){
           var layer=layui.layer;
           layer.open({
      		  title:"修改个人密码",
      		  offset: ['100px', '310px'],//上，左坐标
      		  type: 1,		 
      		  area: ['600px', '400px'], //宽高
      		  content:'<div id="pass"><form action="">'
      	   +'<table class="layui-table">'
           +'<tr><td>请输入旧密码</td><td><input class="layui-input" style="width: 300px"/></td></tr>'
           +'<tr><td>请输入新密码</td><td><input class="layui-input" style="width: 300px"name="entity.stuPass" id="pass"></td></tr>'
           +'<tr><td>确认新密码</td><td><input class="layui-input" style="width: 300px" id="repass"></td></tr>'
           +'<tr><td colspan="2" align="center"><input class="layui-btn layui-layer-close" type="submit"  value="提交"></td></tr>'
           +'</table>'
          +'</form></div>'
            });  
       });
	 
	 
 }
</script>
</body>
</html> 
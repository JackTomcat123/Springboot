<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台管理</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
		<link rel="stylesheet" type="text/css" href="layui/css/main.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/layer.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="http://www.kuxuebao.net" title="logo">后台管理系统</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
         
           <input id="u_nums" type="hidden" value="${ENTITY.u_num}">
               
           <input id="u_roles" type="hidden" value="${ENTITY.role.get(0).r_name}">
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item">
                <c:if test="${ENTITY.role.size() > 0 }">
<font color="red">欢迎 <b>${ENTITY.role.get(0).r_name}</b> : <i><b>${ENTITY.u_rename}</b></i></font>
	               </c:if>
            		</li>
            		<li class="layui-nav-item">
						<a href="javascript:void(0)" onclick="See('${ENTITY.role.get(0).r_name}')">
                         <i class="iconfont icon-piliangicon" data-icon='icon-piliangicon'></i>
						系统信息<span style="color:red;">+1</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a id="see" href="#" target="main">查看全部</a>
							</dd>
						</dl>
					</li>
            		<li class="layui-nav-item">
						<a href="javascript:void(0)" onclick="self('${ENTITY.role.get(0).r_name}')">
                         <i class="iconfont icon-jiaoseguanli" ></i>
						个人信息</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="show" href="#" target="main">查看个人信息</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
					</li>
					
					<li class="layui-nav-item">
						<a href="login.jsp">
                        <i class="iconfont icon-exit"></i>
						退出</a>
					</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	 <div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side"> 
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
        <c:forEach items="${POWER}" var="power">
			<li id="${power.p_id}" class="layui-nav-item">
                    <a href="javascript:void(0)"  onclick="findPower(${power.p_id})">
                            <i class="iconfont icon-jiaoseguanli" ></i>
                            <span>${power.p_name }</span>
                            <em class="layui-nav-more"></em>
                     </a>
			</li>
		</c:forEach>
		  </ul>
    </div>
	</div> 

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div id="msg"></div>
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<iframe  width="100%" height="100%" name="main">
      <!-- 内容主体区域  a href="" target="main"-->
      
    </iframe>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	<span>2019 &copy;</span>
		    </p>
		</div>
	</div>
</div>
<!-- 加载js文件-->                                                                                                                                                                                           
	 <script type="text/javascript" src="common/layui/layui.js"></script> 
	<script type="text/javascript" src="js/larry.js"></script>
	<script type="text/javascript" src="js/index.js"></script> 
		<script type="text/javascript" src="js/lock.js"></script> 
		<script type="text/javascript" src="js/layer.js"></script> 
		<!--锁屏  -->
	<div class="admin-header-lock" id="lock-box" style="display: none;" >
		<div class="admin-header-lock-img"><img src="images/face.jpg"/></div>
		<div class="admin-header-lock-name" id="lockUserName">请叫我鹏哥</div>
		<div class="input_btn">
			<input type="password" class="admin-header-lock-input layui-input" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />
			<button class="layui-btn" id="unlock">解锁</button>
		</div>
	</div>

</body>
<script  type="text/javascript">
	function findPower(id)
	{
		$.ajax(
				{
					url:"power/findPowerMgrById",
					data:{"entity.p_id":id},
					type:'post',
					dataType:'html',
					success:function(data)
					{
						$("#"+id).find("dl").remove();
						$("#"+id).append(data);
					}
				});
	}
	
function self(role){
	
	if(role=='学生'){
		$('#show').attr('href','student/tofindOne?entity.stuId=${ENTITY.u_num}'); 
	}else{
		$('#show').attr('href','teacher/tofindOne?entity.teachId=${ENTITY.u_num}'); 
		
	}
	}
	//查看相应角色对应的消息
	function See(role){
		var role=role;
	  if(role=='辅导员'){
		  $('#see').attr('href','teacher/findTMsg?id=${ENTITY.u_num}'); 
	    }else if(role=='宿管'){
	    	$('#see').attr('href','teacher/findDMsg'); 
	    }else if(role=='学生'){
	    	$('#see').attr('href','student/findStuSelf1?out.stu.stuId=${ENTITY.u_num}'); 
	    	
	    	
	    }
		
		
		
		
	}
//个人信息隐藏层
   function hide(){
    	   layui.use('layer',function(){
               var layer=layui.layer;
               layer.open({
          		  title:"信息提示",
          		  offset: ['100px', '310px'],//上，左坐标
          		  type: 1,		 
          		  area: ['600px', '400px'], //宽高
          		  display:none,
          		  content: '<div id="msg1"></div>'
                });  
           });
    	
    }
   function show(){
 	   layui.use('layer',function(){
            var layer=layui.layer;
            layer.open({
       		  title:"信息提示",
       		  offset: ['100px', '310px'],//上，左坐标
       		  type: 1,		 
       		  area: ['600px', '400px'], //宽高
       		 // display:none;
       		  content: '<div id="msg1"></div>'
             });  
        });
 	
 }
   function msg(){
	   $("#msg1").find("table").remove(); 
	   var id=$("#u_nums").val();
		if($("#u_roles").val()=='辅导员'){
			 layer.closeAll();//关闭弹出层
			 $.ajax(
		             {                 
		                 url:"teacher/Tmsg",
		                 data:{"o.teach.teachId":id},
		                 type:'post',
		                 dataType:'html',
		                 success:function(data)
		                 {  
		                	 show();
		                	 $("#msg1").find("table").remove(); 
		                      $("#msg1").append(data);
		                 }
		             });
			 
		}else if($("#u_roles").val()=='学生'){
			stuMsg();
			
   }else if($("#u_roles").val()=='宿管'){
	   Dmsg();
   }
	hide();	
   }
   window.onload=msg();

   
 //不同意驳回
   function  NotPass(id){
	 var id=id;
	 layer.closeAll();//关闭弹出层
	   layui.use('layer',function(){
           var layer=layui.layer;
           layer.open({
      		  title:"信息驳回",
      		  offset: ['100px', '310px'],//上，左坐标
      		  type: 1,		 
      		  area: ['600px', '400px'], //宽高
      		  content: '<div id="notPass"><center><textarea placeholder="请输入内容" class="layui-textarea" id="tmemo"></textarea><br/>'
      		  +'<input class="layui-btn layui-layer-close" onclick="Not('+id+')" value="提交"/></center></div>'
            });  
       });
  	 
   }
 function Not(id){
	 var id=id;
	 var tmemo=$("#tmemo").val();
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"teacher/NotPass",
                 data:{"o.o_id":id,"Tmemo":tmemo},
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {  
                	 layer.open({
                		  title: '信息提示',
                		  content: '已拒绝!'
                		}); 
                 }
             });
	 
 }
 //同意受理
 function Pass(id){
	 
	 var id=id;
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"teacher/Pass",
                 data:{"o.o_id":id},
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {  
                	 layer.open({
               		  title: '信息提示',
               		  content: '已通过!'
               		}); 
                 }
             });
 }
 //学生信息查看
 
 function stuMsg(){
	 
	 var id=$("#u_nums").val();
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"student/Smsg",
                 data:{"out.stu.stuId":id},
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {  
                 //show();
                	 $("#msg").find("table").remove(); 
                      $("#msg").append(data);
                 }
             });	 
 }
 //宿管信息查看
 function  Dmsg(){
	 
	 var id=$("#u_nums").val();
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"teacher/Dmsg",
                 data:{},
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {  
                	 show();
                	 $("#msg1").find("table").remove(); 
                      $("#msg1").append(data);
                 }
             });	 
	 
 }
 //宿管执行 Dpass
 function Dpass(o_id,dormid,stuid){
	 var o_id=o_id;
	 var dormid=dormid;
	 var stuid=stuid;
	 layer.closeAll();//关闭弹出层
	 $.ajax(
             {                 
                 url:"teacher/Dpass",
                 data:{
                	 "o.o_id":o_id,
                	 "dormid":dormid,
                	 "stu.stuId":stuid
                	 
                 },
                 type:'post',
                 dataType:'html',
                 success:function(data)
                 {  
                	 layer.open({
               		  title: '信息提示',
               		  content: '办理成功!'
               		}); 
                 }
             });	 
	 
 }
 //换宿执行
 function Change(o_id,dormid,stuid){
	 var o_id=o_id;
	 var dormid=dormid;
	 var stuid=stuid;
	 layer.closeAll();//关闭弹出层
	 window.location="teacher/findOMsg?o.o_id="+o_id;
 }
</script>
</html>
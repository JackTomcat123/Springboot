<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 		
<!--  html代码-->






	<script type="text/javascript" src="static/js/jquery.cookie.js"></script><!--cookie的jar包  -->
	<script type="text/javascript">
	
		function sengMessage(){//获取验证码按钮的点击事件方法
			var phone = $("#phoneID").val();//得到手机号文本框的值   
			$.ajax({
				type: "POST",
				url: 'sendMessageController/send',//发送验证发的controller路径
		    	data: {pheone:phone},
				dataType:'json',
				cache: false,
				success: function(data){//回调函数，controller中返回的验证码
				var millisecond = new Date().getTime();
				var expiresTime = new Date(millisecond + 60 * 1000 * 10);//设置时间为15分钟
				$.cookie('pheoneCode',data , { expires: expiresTime });//把验证码保存到cookie中15分钟后失效
				
				}
					
			});
		}
		
		function jiaoyan(phone){//得到用户输入的验证码
			var status=document.cookie.indexOf("pheoneCode="); 
			if(status == -1){ //如果等于-1则cookie失效或者不存在
					alert("验证码失效");
			} else{
					var phoneCode = $.cookie('pheoneCode');//获取保存在cookie中的验证码
					if(phone==phoneCode){//判断用户输入的验证码与cookie中的验证码是否一样
						alert("验证码正确");
					}else{
						alert("验证码不正确");
					}
			}
		}
		
	
		
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	

</body>
</html>
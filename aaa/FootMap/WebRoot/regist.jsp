<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>足迹-注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/getXHR.js"></script>   
	<link type="text/css" href="jslib/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">

	<script src="jslib/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/form.js" type="text/javascript"></script>
	<script src="jslib/jQuery.validate/jquery.validate.js" type="text/javascript"></script>
	<script src="jslib/bootstrap-3.3.5/bootstrap.min.js" type="text/javascript"></script>
	<style>
	#main{
	width:80%;
	height:70%;
	border-radius:20px;
	margin-top:3%;margin-left: 10%;
	}
	form{
	color: #fff;
	font-size: 20px;
	padding-left: 25%;
	padding-top: 10%;
	}
	span{
	font-size: 15px;
	}
	.getRegistCodeBtn{
	color: black;font-size: 17px;
	}
	</style>
	<script type="text/javascript">
	
	window.onload=function(){
		
	document.getElementById("submitForm").onclick=function()
	{
		if(document.getElementById("registCode").value==""||
				document.getElementById("firstname").value==""||
				document.getElementById("password").value==""||
				document.getElementById("confirm_password").value==""||
				document.getElementById("email").value=="")
  		{
  		alert("注册信息填写不完整！");
  		return false;
  		}
		var xhr=getXHR();
  		//2.注册监听器
  		xhr.onreadystatechange=function(){
  		if(xhr.readyState==4)
  		{
  			if(xhr.status==200)
  			{
  				document.getElementById("msg1").innerHTML=xhr.responseText;
  				if(xhr.responseText.toString()=="")
  					document.getElementById("register-form").submit();
  				else
  					document.getElementById("msg1").innerHTML=xhr.responseText;
  				/* if(document.getElementById("msg1").value=="")
  				{
  					//submitForm();
  					alert("chenggong");
  					document.form.submit;
  				}
  				else
  					return false; */
  			}
  		}
  	}
  	//3.建立连接
  		xhr.open("POST","${pageContext.request.contextPath}/registCodeCheckServlet?time="+new Date().getTime());
  		//4.发送正文
  		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  		xhr.send("registCode="+document.getElementById("registCode").value);
  		
  		
	}
	 document.getElementById("firstname").onblur=function()
	{
          if(this.value=="")
        	  {
        	  alert("请输入用户名!");
        	  return false;
        	  }
            var xhr=getXHR();
            xhr.onreadystatechange=function()  //当请求状态变化时调用该函数
            {
            if(xhr.readyState==4)    //    标志xhr对象的当前状态
                if(xhr.status==200)        //服务器的响应状态码
                {
                    document.getElementById("msg").innerHTML=xhr.responseText; //本例是在用户名的输入后加<span id ="msg"></span>
                }
            }
            xhr.open("POST","${pageContext.request.contextPath}/usernameCheckServlet?time="+new Date().getTime());//避免拿到缓存中的旧数据，但是会占用浏览器资源
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");    //一定要写，否则数据无法被正常接收
            //4.发送数据
            xhr.send("name="+document.getElementById("firstname").value);

      } 
	 
	 document.getElementById("btn").onclick=function()
		{
		 if(document.getElementById("email").value=="")
			 {
			 	alert("请输入注册的邮箱地址");
			 	return false;
			 }
		 var obj = $("#btn");
		    settime(obj);
	            var xhr=getXHR();
	            xhr.onreadystatechange=function()  //当请求状态变化时调用该函数
	            {
	            if(xhr.readyState==4)    //    标志xhr对象的当前状态
	                if(xhr.status==200)        //服务器的响应状态码
	                {
	                    document.getElementById("msg1").innerHTML=xhr.responseText; //本例是在用户名的输入后加<span id ="msg"></span>
	                }
	            }
	            xhr.open("POST","${pageContext.request.contextPath}/sendMailServlet?time="+new Date().getTime());//避免拿到缓存中的旧数据，但是会占用浏览器资源
	            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");    //一定要写，否则数据无法被正常接收
	            //4.发送数据
	            xhr.send("email="+document.getElementById("email").value);

	      } 
  var countdown=60; 
  	function settime(obj) { //发送验证码倒计时
	    if (countdown == 0) { 
	        obj.attr('disabled',false); 
	        //obj.removeattr("disabled"); 
	        obj.val("免费获取验证码");
	        countdown = 60; 
	        return;
	    } else { 
	        obj.attr('disabled',true);
	        obj.val("重新发送(" + countdown + ")");
	        countdown--; 
	    } 
	    setTimeout(function() { 
	        settime(obj) 
	    }
	  ,1000) 
	} 
  }
    </script>
    
  </head>
  
  <body>
     <div class="top" style="height: 12%;background-color: #FCFCFA">
		<a href="index.jsp"><img alt="" src="images/logo.jpg" onclick="s" style="height: 65px"></a>
		<span style="font-size: 35px;color: #3B9EC5;padding-left:32%;padding-top: 20%;">人生天地间，忽如远行客</span>
	</div>
	<!--  -->
	<div id="main" style="background-color: #55B8DF;">
		<form id="register-form"  name="register-form" class="form-horizontal" method="post" action="regist.do">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="firstname">用户名：</label>
			<div class="col-sm-5" style="display: inline-block;">
				<input class="form-control" id="firstname" name="firstname" />
			</div>
			<span id="msg">
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="password">密码：</label>
			<div class="col-sm-5">
				<input class="form-control" id="password" name="password" type="password" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="confirm_password">确认密码：</label>
			<div class="col-sm-5">
				<input class="form-control" id="confirm_password" name="confirm_password" type="password" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="email">E-Mail：</label>
			<div class="col-sm-5">
				<input class="form-control" id="email" name="email" />
			</div>
			 
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="registCode">注册码：</label>
			<div class="col-sm-5">
				<input class="form-control" id="registCode" name="registCode" />
			</div>
			<input type="button" id="btn" value="获取注册码" class="btn btn-primary btn-sm"/>
			<span id="msg1">
		</div>
		<br>
		<div class="form-group">
			<div class="col-md-offset-3 col-md-10">
				<button type="button" class="btn btn-primary btn-sm" id="submitForm">注册</button>
				<button type="reset" class="btn btn-primary btn-sm">重置</button>
			</div>
		</div>
	</form>
	</div>
  </body>
</html>

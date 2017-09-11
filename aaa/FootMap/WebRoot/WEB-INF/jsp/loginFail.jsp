<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>足迹-登录成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
	#main{
	width:80%;
	height:70%;
	border-radius:20px;
	margin-top:3%;margin-left: 10%;
	}
	
	h2{
	color: #fff;
	font-style:inherit;
	}
	
	a{
	color: #fff;
	}
	</style>

  </head>
  
  <body>
     <div class="top" style="height: 12%;background-color: #FCFCFA">
		<a href="/index.jsp"><img alt="" src="images/logo.jpg" onclick="s" style="height: 65px"></a>
		<span style="font-size: 35px;color: #3B9EC5;padding-left:32%;padding-top: 20%;">人生天地间，忽如远行客</span>
	</div>
	<div id="main" style="background-color: #55B8DF;">
	<br><br>
	<center>
		<h2>很遗憾，登录失败<br>用户名或密码错误</h2><br><br><br>
		<a href="login.jsp">点击返回</a>
	</center>
	</div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�㼣-��¼�ɹ�</title>
    
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
		<span style="font-size: 35px;color: #3B9EC5;padding-left:32%;padding-top: 20%;">������ؼ䣬����Զ�п�</span>
	</div>
	<div id="main" style="background-color: #55B8DF;">
	<br><br>
	<center>
		<h2>���ź�����¼ʧ��<br>�û������������</h2><br><br><br>
		<a href="login.jsp">�������</a>
	</center>
	</div>
  </body>
</html>

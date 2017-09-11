<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>足迹-登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/getXHR.js"></script>
	<style>
	#main{
	width:80%;
	height:70%;
	border-radius:20px;
	box-shadow:5px 0px 0px  #88888;
	float: inherit;
	margin-top:2%;margin-left: 10%;
	}
	img{
	height: 40px;
	width: 120px;
	}
	form{
	color: #fff;
	font-size: 20px;
	padding-left: 35%;
	padding-top: 10%;
	}
	</style>

  </head>
  
  <body>
  	<div class="top" style="height: 15%;background-color: #FCFCFA">
		<a href="index.jsp"><img alt="" src="images/logo.jpg" onclick="s" style="height: 65px"></a>
		<span style="font-size: 35px;color: #3B9EC5;padding-left:32%;">人生天地间，忽如远行客</span>
	</div>
	<div id="main" style="background-color: #55B8DF;">
		<form action="login.do" name="form" id="login-form" method="post">
		用户名：<input type="text" name="name" id="name"><br><br>
		密&nbsp;&nbsp;码：<input type="password" name="password" id="password"><br><br>
		验证码：<input type="text" name="validateCode" id="validateCode">
		<div style="display: inline-block;">
		<a><img alt="" src="service.do?command=loginPreparement" onclick="this.src='service.do?command=loginPreparement&date=<%=new Date().getTime()%>'"></div></a>
		<span id="msg"></span>
		<br/><input type="button" value="登录" onclick="check()"><br><br>
		</form>
		
	</div>
  </body>
</html>
<script type="text/javascript" >
//表单提交时调用
function check(){
	/* checkUserName();
	checkPassword();
	checkValidateCode(); */
	var flag=checkUserName()&checkPassword()&checkValidateCode();
	//if(flag!=false)
	//document.getElementById("form").submit();
		//alert("check中得到form为"+document.getElementById("form"));
}

//验证用户名
function checkUserName(){
	//1 获得要验证的用户名
	var userName = document.form.name.value;
	if(userName==""){
		alert("用户名不能为空");
		return false;
	}
}
//验证密码
function checkPassword(){
	//1 获得要验证的用户名
	var password = document.form.password.value;
	if(password==""){
		alert("密码不能为空");
		return false;
	}
}

function checkValidateCode()
{
	//异步提交核实验证码
	//document.getElementById("uname").onblur=function(){
		if(document.form.validateCode.value=="")
		{
		alert("请输入验证码");
		document.form.validateCode.focus();
		//用户名：<input type="text" name="uname" id="uname"/><span id="msg"></span ><br/>
		return false;
		}
		//alert("aaa");
		//1.创建xrh对象
		var xhr=getXHR();
		//2.注册监听器
		xhr.onreadystatechange=function(){
		if(xhr.readyState==4)
		{
			if(xhr.status==200)
			{
				//document.getElementById("msg").innerHTML=xhr.responseText;
				//document.getElementById("msg1").innerHTML=xhr.responseText;
  				if(xhr.responseText.toString()=="")
  				{
  					//alert("成功");
  					document.getElementById("login-form").submit();
  					//alert("ajax中得到form为"+document.getElementById("login-form"));
  				}	
  				else
  					document.getElementById("msg").innerHTML=xhr.responseText;
			}
		}
		
		
	}
	//3.建立连接
		xhr.open("POST","${pageContext.request.contextPath}/validateCodeCheckServlet?time="+new Date().getTime());
		//4.发送正文
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("validateCode="+document.form.validateCode.value);
}
</script>

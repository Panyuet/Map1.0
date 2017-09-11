<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" +request.getServerName() + ":" + request.getServerPort()+ path;
	response.setHeader("cache-control", "no-store");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("expires", 0);
%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="-10">
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<script src="jslib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/getXHR.js"></script> 
<link type="text/css" href="jslib/bootstrap-3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<title>足迹-详情页面</title>
<style>
#main {
	width: 80%;
	height: 70%;
	border-radius: 20px;
	box-shadow: 5px 0px 0px #88888;
	float: inherit;
	margin-top: 5%;
	margin-left: 10%;
}

#input-append {
	opacity: 1;
}

label {
	color: #fff;
}
</style>
<script type="text/javascript">
	/* function modifyPoint(id) {
		var xhr = getXHR();
		var city=document.getElementById("city").value;
		if(city=='${point.city}')
			city="";
		alert(document.getElementById("file").value);
		return false;
		var mem=document.getElementById("men").value;
		xhr.open("POST","modify.do?command=modifyPoint&time="+ new Date().getTime()+"&pointId="+id+"&city="+city+"&mem="+mem);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//xhr.send("uname=" + this.value);
	/* 	var xhr = getXHR();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					document.getElementById("msg").innerHTML = xhr.responseText;
				}
			}
		}
		xhr.open("POST","${pageContext.request.contextPath}/usernameCheckServlet?time="+ new Date().getTime());
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("uname=" + this.value); */
	//}
	/* function modifyItem() {
		if (trim(document.getElementById("itemName").value) == "") {
			alert("物料名称不能为空！");
			document.getElementById("itemName").focus();
			return;
		}
		with (document.getElementById("itemForm")) {
			method = "post";
			action = "item.do?command=modify&pageNo=${itemForm.pageNo}&pageSize=${itemForm.pageSize}";
			submit();
		}
	}
*/
	function goBack() {
		window.self.location ="service.do?command=doDispatcher&uri=pointsManage";
		//window.self.location = "item.do?command=list&pageNo=${itemForm.pageNo}&pageSize=${itemForm.pageSize}";
	} 
</script>
</head>
<body style="background-image: url('images/bg.jpg');">

	<div class="top" style="height: 10%;background-color: #FCFCFA">
		<a href="index.jsp"><img alt="" src="images/logo.jpg" onclick="s"
			style="height: 65px"></a> <span
			style="font-size: 35px;color: #3B9EC5;padding-left:32%;">人生天地间，忽如远行客</span>
	</div>
	<div id="main" style="background-color: #55B8DF;">
		<br> <br>
		<h3 style="color: #fff;margin: 0 auto;text-align: center;">修改我的足记</h3>
		<br> <br>
		<center>
			<div>
				<form id="modify-form" name="modify-form" class="form-horizontal"  enctype="multipart/form-data"
					method="post" action="modify.do" style="text-align: center">
					<input type="hidden" value="${point.id}" name="pointId" id="pointId">
					<input type="hidden" value="${point.imagePath}" name="imagePath" id="imagePath">
					<input type="hidden" value="${point.imageName}" name="imageName" id="imageName">
					<div class="form-group">
						<label class="col-sm-4 control-label">经度：</label>
						<div class="col-sm-5" style="display: inline-block;">
							<input class="form-control" readonly="readonly"
								value="${point.x}" />
						</div>
						<span id="msg">
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">纬度：</label>
						<div class="col-sm-5">
							<input class="form-control" readonly="readonly"
								value="${point.y}" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">城市名：</label>
						<div class="col-sm-5">
							<input class="form-control" readonly="readonly" id="city"
								value="${point.city}" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">备注：</label>
						<div class="col-sm-5">
							<textarea class="form-control" id="mem" name="mem" rows="5"
								cols="" style="resize:none">${point.mem}</textarea>
						</div>
					</div>
					<label class="col-sm-4 control-label">图片：</label>
					<div class="col-sm-2">
						<img id='imgDemo' width='139' height='104' margin='0 auto'
							src="<%=basePath %>/uploadImages/${point.imagePath}/${point.imageName}">
						<%-- <img id='imgDemo' width='139' height='104' margin='0 auto'
							src="./uploadImages/${point.imagePath}/${point.imageName}"> --%>
					</div>
					<input type="file" name="file" id="file" title="修改图片"> <br> <br> <br> <br> <br>
					<div class="form-group">
						<div class="col-md-offset-3 col-md-5">
							<button type="submit" class="btn btn-primary btn-sm"
								id="modifyBtn">修改</button>
							<button type="reset" class="btn btn-primary btn-sm"
								style="margin-left: 3%;">重置</button>
							<button type="button" class="btn btn-primary btn-sm"
								style="margin-left: 3%;" onclick="goBack()">返回</button>
						</div>
					</div>
				</form>
			</div>
		</center>
	</div>
	<br>
	<br>

</body>
</html>
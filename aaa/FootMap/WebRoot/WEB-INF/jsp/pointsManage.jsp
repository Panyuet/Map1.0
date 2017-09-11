<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix='bean' uri="http://struts.apache.org/tags-bean"%>
<%@taglib prefix='logic' uri="http://struts.apache.org/tags-logic"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>

<script language="javascript">
	function deletePoint(id) {
		//return false;
		if (confirm("确认删除吗？")) {
			window.location.href="<%=path %>/service.do?command=deletePoint&pointId="+id;
			//window.open()
		} else {
			return false;
		}
	}
	//function modifyPreparement(id) {
	//window.self.location = "service.do?command=modifyPoint&pointId=" + id;
	/* if (confirm("确认修改吗？")) {
		return true;
	}
	else 
		return false; */
	// window.self.location = "service.do?command=modifyPreparement&pointId="+id;
	//}

	/* window.onload = function() {
		//<c:set value="0" var="pageNum"/>
	};

	function topPage() {
		//var pageNum=${pageNum};
		//<c:set value="0" var="pageNum"/>
		//window.location.reload();
		//window.self.location = "item.do?command=list&pageNo=${pagemodel.topPageNo}&pageSize=${itemForm.pageSize}&clientIdOrName=${ itemForm.clientIdOrName }"
	}
	function previousPage() {
		var currNum = ${pageNum};
		/*  var pageNum=currNum-1;
		if(pageNum<0)
			pageNum=0;  
		<c:set value=pageNum var="pageNum"/>
		window.location.reload(); */

	//window.self.location = "item.do?command=list&pageNo=${pagemodel.previousPageNo}&pageSize=${itemForm.pageSize}&clientIdOrName=${ itemForm.clientIdOrName }"
	//}
	//function nextPage() {
	//var currNum=${pageNum};
	//var pageNum=currNum+1;
	//if(pageNum>((${points.size()})/5)+1)
	//pageNum=((${points.size()})/5)+1);
	//<c:set value=pageNum var="pageNum"/>
	//window.location.reload();
	//window.self.location = "item.do?command=list&pageNo=${pagemodel.nextPageNo}&pageSize=${itemForm.pageSize}&clientIdOrName=${ itemForm.clientIdOrName }"
	//}
	//function bottomPage() {
	//<c:set value='((${points.size()})/5)+1)' var="pageNum"/>
	//window.location.reload();
	//window.self.location = "item.do?command=list&pageNo=${pagemodel.bottomPageNo}&pageSize=${itemForm.pageSize}&clientIdOrName=${ itemForm.clientIdOrName }"
	//}
</script>


<title>足迹-管理我的足迹</title>
<style>
#main {
	width: 80%;
	height: 70%;
	border-radius: 20px;
	margin-top: 3%;
	margin-left: 10%;
}
</style>
</head>
<body>
	<div class="top" style="height: 12%;background-color: #FCFCFA">
		<a href="/index.jsp"><img alt="" src="images/logo.jpg" onclick="s"
			style="height: 65px"></a> <span
			style="font-size: 35px;color: #3B9EC5;padding-left:32%;padding-top: 20%;">人生天地间，忽如远行客</span>
	</div>
	<div id="main" style="background-color: #55B8DF;">
		<br> <br>
		<table width="98%" border="0" cellpadding="4" cellspacing="2"
			align="center">
			<tr style="color: #fff">
				<td height="24" colspan="6" align='center'>&nbsp;管理我的足迹&nbsp;</td>
			</tr>
			<tr align="center" height="22" style="color: #fff">
				<td width="9%">记录编号</td>
				<td width="15%">经度</td>
				<td width="15%">纬度</td>
				<td width="10%">城市</td>
				<td width="40%">备注</td>
				<td width="9%">操作</td>
			</tr>
			<logic:iterate id="p" name="points" indexId="number">
				<tr style="color: #fff">
					<td align="center"><bean:write name="number" /></td>
					<td align="center"><bean:write name="p" property="x" /></td>
					<td align="center"><bean:write name="p" property="y" /></td>
					<td align="center"><bean:write name="p" property="city" /></td>
					<td align="center"><bean:write name="p" property="mem" /></td>
					<td align="center"><a href="javascript:;"
						onclick="return deletePoint('${p.id}');">删除</a> <%-- <a href="" onClick="modifyPreparement(${p.id})">修改</a> --%>
						<a href="service.do?command=modifyPreparement&pointId=${p.id}"
						onClick="modifyPreparement(${p.id})">修改</a></td>
				</tr>
			</logic:iterate>
		</table>
		<center>
			<br>
			<br> <input name="btnTopPage" class="button1" type="button"
				id="btnTopPage" value="&lt;&lt; " title="首页" onClick="topPage()">
			<input name="btnPreviousPage" class="button1" type="button"
				id="btnPreviousPage" value=" &lt;  " title="前一页"
				onClick="previousPage()"> <input name="btnNext"
				class="button1" type="button" id="btnNext" value="  &gt; "
				title="后一页" onClick="nextPage()"> <input
				name="btnBottomPage" class="button1" type="button"
				id="btnBottomPage" value=" &gt;&gt;" title="尾页"> <br>
			<br> <a href="service.do?command=doDispatcher&uri=loginSuccess"
				style="color: #fff">返回</a>
		</center>
	</div>
</body>
</html>

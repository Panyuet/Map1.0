<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title>足记</title>
<style type="text/css">
body, html, #map_demo, #tab, #mapfrm {
	width: 100%;
	height: 90%;
	margin: 0;
	font-family: "微软雅黑";
}

td {
	font-size: 14px
}

h4 {
	margin: 0;
}

#map_demo {
	/*  width: 80%;
  margin-bottom: 30%;  */
	margin-top: 2%;
	margin-bottom: 2%;
	margin-right: 35%;
}

#main {
	width: 80%;
	height: 80%;
	border-radius: 20px;
	float: inherit;
	margin-top: 2%;
	margin-left: 10%;
}

#container {
	width: 70%;
	height: 90%;
	margin-left: 2%;
}

form {
	color: #fff;
	font-size: 15px;
	margin-left: 35%;
	/*padding-top: 10%;  */
}

.anchorBL {
	display: none;
}
</style>
<script type="text/javascript" src="js/baidumap_offline_v2_load.js"></script>
<script type="text/javascript" src="js/AreaRestriction_min.js"></script>
<link rel="stylesheet" type="text/css" href="css/baidu_map_v2.css" />
</head>
<body style="background-image: url('images/bg.jpg');">
	<div class="top" style="height: 15%;background-color: #FCFCFA">
		<a href="index.jsp"><img alt="" src="images/logo.jpg" onclick="s"
			style="height: 65px"></a> <span
			style="font-size: 35px;color: #3B9EC5;padding-left:32%;">人生天地间，忽如远行客</span>
	</div>
	<span style="color: #3B9EC5;padding-left: 90%">欢迎您：<c:out
			value="${sessionScope.user.firstname}"></c:out></span>
	<c:if test="${sessionScope.points==null}">
		<div align="right">
			<span style="color: #3B9EC5">地图上还没有你的足迹呢，快动手添加吧</span>
		</div>
	</c:if>
	<div id="main" style="background-color: #55B8DF;margin-top: 5%;">
		<br>
		<div id="container" style="width: 70%;display: inline-block;">
			<div id="map_demo" style="display: inline-block;"></div>
			<!-- <input name="addBtn" type="button" class="addBtn" id="addBtn"  value="添加足迹" onClick="addPoint()"> -->

		</div>
		<div id="sheet" style="display: inline-block;vertical-align:top;">
			<form action="upload.do" style="margin-top: 20%;"
				id="form" method="post"  enctype="multipart/form-data">
				坐标x:<input type="text" name="x" id="x" readonly="readonly"><br>
				坐标y:<input type="text" name="y" id="y" readonly="readonly"><br>
				城市:<input type="text" name="city" id="city"><br>
				图片:<input type="file" name="file" id="file"><br>
				备注:<textarea rows="5" cols="23" style="resize:none" id="mem" name="mem"></textarea>
				<br>
				<br> <input type="button" value="添加" onclick="check()">
			</form>
			<c:if test="${sessionScope.points[0]!=null}"></c:if>

		</div>
		<a href="service.do?command=doDispatcher&uri=pointsManage"
			style="color: #fff;margin-left: 85%;display: inline-table;margin-bottom: 10%;">管理我的足迹</a>
	</div>
</body>
</html>
<script type="text/javascript">
	function check(){
		//alert("aaa");
		//return false;
		if(document.getElementById("x").value==""||document.getElementById("y").value=="")
		{
			alert("坐标值不能为空哦>.<");
			return false;
		}
		document.getElementById("form").submit();
	}
</script>

<script type="text/javascript">  
//百度地图API配置
var bdmapcfg = {
  'home':'js/', //API主目录
  'imgext':'.jpg', //瓦片图的后缀 ------ 根据需要修改，一般是 .png .jpg
  'tiles_dir':''   //瓦片图的目录，为空默认在 baidumap_v2/tiles/ 目录
};

//百度地图API功能
	function loadJScript() {
		var script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "js/baidumap_offline_v2_20160921_min.js";
		document.body.appendChild(script);    
    //异步加载增加代码
    window.BMap=window.BMap||{};
    window.BMap.apiLoad=function(){delete window.BMap.apiLoad;if(typeof init=="function"){init()}}
	}
	
	function init() {
		var map = new BMap.Map("map_demo",{minZoom:2,maxZoom:8});            // 创建Map实例
		var point = new BMap.Point(116.404, 39.915); // 创建点坐标
		map.centerAndZoom(point, 4);     
		            
		map.enableScrollWheelZoom();                 //启用滚轮放大缩小
		
		//设置点的弹跳动画
		/* var point = new BMap.Point(106.404, 39.915);
		//map.centerAndZoom(point);
		var marker = new BMap.Marker(point);  // 创建标注
		map.addOverlay(marker);               // 将标注添加到地图中
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画 */
		var points="<%=session.getAttribute("points")%>"
		//alert(${points.size()});
		//var size =0+ ${points.size()};
		var array = new Array();
		<c:forEach items="${points}" var="p">
		//array.push(${t.x}+{t.y}+${t.mem});  
		var x = ${p.x};
		var y = ${p.y};
		var mem = '${p.mem}';
		var point = new BMap.Point(x, y);
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //增加点的弹跳动画
		
		//var root="./uploadImages/"+"${p.imagePath}/${p.imageName}";
		var root="./uploadImages/";
		var imagePath='${p.imagePath}/';
		var imageName='${p.imageName}';
		var sContent = "<div style='width:300px;height:150px;'><h5 style='margin:0 0 5px 0;padding:0.2em 0'>"+'${p.city}'+"</h5>"
				+ "<img style='float:right;margin:4px' id='imgDemo' width='139' height='104' src="+root+imagePath+imageName+">"
				+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+mem+"</p>"
				+ "</div>";
		var infoWindow = new BMap.InfoWindow(sContent); // 创建信息窗口对象
		marker.addEventListener("click", function() {
			this.openInfoWindow(infoWindow);
			//图片加载完毕重绘infowindow
			//alert(document.getElementByI)
			/* document.getElementById('imgDemo').onload = function() {
				infoWindow.redraw(); //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			} */
		});
		</c:forEach>
		//alert(array.length);

		//添加比例尺和控件
		var top_left_control = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_TOP_LEFT
		});// 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件
		map.addControl(top_left_control);
		map.addControl(top_left_navigation);
		//设置地图显示范围，拖动地图超过该范围会被弹回
		var b = new BMap.Bounds(new BMap.Point(64.560417, 52.052578),
				new BMap.Point(135.279627, 16.870004));
		try {
			//BMapLib.AreaRestriction.setBounds(map, b);
		} catch (e) {
			alert(e);
		}

		//单击获取点击的经纬度
		map.addEventListener("click", function(e) {
			//alert(e.point.lng + "," + e.point.lat);
			document.getElementById("x").value = e.point.lng;
			document.getElementById("y").value = e.point.lat;
		});
	}
	window.onload = loadJScript; //异步加载地图
</script>
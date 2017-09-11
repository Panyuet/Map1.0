<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>足迹</title>
	<style>
		*{padding:0;margin:0;}
		ul{list-style:none;}
		#banner{
			width:800px;height:400px;
			position:relative;
			overflow:hidden;
			/*border:5px solid black;*/
			cursor:pointer;
		 	margin-left: 15%;
		 	border-radius:20px;
		}
		#banner>img{
			width:100%;height:100%;
			position:absolute;
			top:0;left:100%;
			animation-duration:0.6s;
			animation-timing-function:ease;
			animation-fill-mode:forwards;
		}
		#banner>img:first-child{left:0%;}
		#banner>img.show{animation-name:show;}
		#banner>img.hide{animation-name:hide;}
		@keyframes hide{
			from{left:0;}
			to{left:-100%;}
		}
		@keyframes show{
			from{left:100%;}
			to{left:0;}
		}
		/*banner的title部分*/
		#banner>ul{
			position:absolute;
			right:20px;bottom:10px;
		}
		#banner>ul>li{
			display:inline-block;
			width:10px;height:10px;
			border-radius:50%;
			border:1px solid white;
			margin-right:6px;
		}
		#banner>ul>li:hover{border-color:#ccc;}
		#banner>ul>li.active{
			background-color:black;
		}
		#main{
		width:80%;
		height:80%;
		border-radius:20px;
		box-shadow:5px 0px 0px  #88888;
		float: inherit;
		margin-top:5%;margin-left: 10%;
		}
		a{
		font-size: 18px;color: #fff;border: thick;font-weight: bolder;
		}
	</style>
	<script src='js/util.js'></script>
	<script>
		var curIndex=0;
		var handler=null;
		function changeImg(nextIndex){
			var imgs=tag('img',id('banner'));
			var lis=tag('li',id('banner'));
			imgs[curIndex].className='hide';
			imgs[nextIndex].className='show';
			lis[curIndex].className='';
			lis[nextIndex].className='active';
			curIndex=nextIndex;
		}
		function autoChange(){
			var imgs=tag('img',id('banner'));
			var nextIndex=curIndex+1>=imgs.length
					?0:curIndex+1;
			changeImg(nextIndex);
		}
		window.onload=function(){
			handler=setInterval(autoChange,2000);
			id('banner').onmouseover=function(){
				clearInterval(handler);
			};
			id('banner').onmouseout=function(){
				handler=setInterval(autoChange,2000);
			};
			var lis=tag('li',id('banner'));
			for(var i=0;i<lis.length;i++){
				lis[i].index=i;
				lis[i].onclick=function(){
					changeImg(this.index);
				};
			}
		};
	</script>

</head>
<body style="background-image: url('images/bg.jpg');">

	<div class="top" style="height: 15%;background-color: #FCFCFA">
		<a href="index.jsp"><img alt="" src="images/logo.jpg" onclick="s" style="height: 65px"></a>
		<span style="font-size: 35px;color: #3B9EC5;padding-left:32%;">人生天地间，忽如远行客</span>
	</div>
	<div id="main" style="background-color: #55B8DF;">
	<div id='banner'>
		<img src="images/pic1.jpg" alt="">
		<img src="images/pic2.jpg" alt="">
		<img src="images/pic3.jpg" alt="">
		<img src="images/pic4.jpg" alt="">
		<ul class='title'>
			<li class='active'></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	</div>
	<br><br>
	<a href="login.jsp" style="margin-left: 30%">点击登录</a>
	<!-- <a href="service.do?command=loginPreparement">点击登录登录</a> -->
	<a href="regist.jsp" style="margin-left: 30%">点击注册</a>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../util/taglib.jsp"%>
<%@ page import="org.j2cms.model.user.User" %>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>顶部</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="script/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
	
	getDate01();
})	

/**获得当前日期**/
		function  getDate01(){
			var time = new Date();
			var myYear = time.getFullYear();
			var myMonth = time.getMonth()+1;
			var myDay = time.getDate();
			if(myMonth < 10){
				myMonth = "0" + myMonth;
			}
			//document.getElementById("yue_fen").innerHTML =  myYear + "." + myMonth;
			document.getElementById("day_day").innerHTML =  myYear + "." + myMonth + "." + myDay;
		}
</script>


</head>

<body style="background:url(images1/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><img src="images1/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <li><a href="<s:url action="list" namespace="manage/project"/>" target="rightFrame" class="selected"><img src="images1/icon01.png" title="项目列表" /><h2>项目列表</h2></a></li>
    <li><a href="<s:url action="add" namespace="manage/project"/>" target="rightFrame"><img src="images1/icon02.png" title="新建项目" /><h2>新建项目</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="images1/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="<s:url action="tools" namespace="manage"/>"  target="rightFrame"><img src="images1/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="" target="rightFrame"><img src="images1/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="<s:url action="sys" namespace="manage/user"/>"  target="rightFrame"><img src="images1/icon06.png" title="系统管理" /><h2>系统管理</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <!-- <li><span><img src="images1/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>-->
    <li><a href="javascript:void(0);" id="day_day">关于</a></li> 
    <li><a href="<s:url action="logout" namespace="user"></s:url>" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><%=user.getUsername() %></span>
     <i>欢迎使用&nbsp;</i>
    <!-- <b>5</b> -->
    </div>    
    
    </div>

</body>
</html>
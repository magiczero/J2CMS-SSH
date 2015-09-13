<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/jquery.js"></script>
<script src="script/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images1/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎使用试验系统</span>    
    <!-- <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul> -->    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       <c:if test="${message!=null}">
	<div style="text-align:center;color:red; font-size:12px; font-weight:bold;">
        ${message}
        </div>
        </c:if>
    <div class="loginbox">
    <form id="loginForm" name="loginForm" action="loginCheck" method="post">
    <ul>
    <li><input name="entity.username" type="text" class="loginuser" /></li>
    <li><input name="entity.password" type="password" class="loginpwd"/></li>
    <li><input value="登  录" type="submit" class="loginbtn" /><label><input name="" type="checkbox" value="" />记住密码</label></li>
    </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">版权所有  2013</div>
	
</body>

    
</html>

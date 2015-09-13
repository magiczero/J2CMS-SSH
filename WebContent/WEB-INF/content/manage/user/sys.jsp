<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统管理</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>常用功能</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="<s:url action="list" namespace="../../manage/box" />"><img src="../../images1/i03.png" /></a><h2>盒子管理</h2></li>
    <li><a href="<s:url action="list" namespace="../../manage/user" />"><img src="../../images1/i07.png" /></a><h2>用户管理</h2></li>
    </ul>
    
    </div>
    
    
    
    
    </div>


</body>

</html>
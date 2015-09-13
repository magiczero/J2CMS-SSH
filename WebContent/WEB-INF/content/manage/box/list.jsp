<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>盒子列表</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery.js"></script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="<s:url action="sys" namespace="../../manage/user" />">系统管理</a></li>
    <li><a href="#">盒子列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="<s:url action="add" namespace="../../manage/box" />"><span><img src="../../images1/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:35px;"><input name="" type="checkbox" value="" /></th>
        <th style="width:40px;">序号</th>
        <th style="width:240px;">名称</th>
        <th>备注</th>
        <th style="width:145px;">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator var="box" value="listBox" status="st">
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td><s:property value="#st.index+1" /></td>
        <td><s:property value="name" /></td>
        <td><s:property value="remark" /></td>
        <td><a href="#" class="tablelink">编辑</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        </s:iterator>
              
        </tbody>
    </table>
    
   
    
    
    
    
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>

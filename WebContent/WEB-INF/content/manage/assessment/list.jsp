<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>列表</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery.js"></script>



</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);"><s:property value="project1.box.name"></s:property></a></li>
    <li><a href="#"><s:property value="project1.name"></s:property></a></li>
    <li><a href="#">可靠性评估管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="<s:url action="add" namespace="../../manage/assessment" ><s:param name="projectid" value="projectid"></s:param></s:url>"><span><img src="../../images1/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>评估名称</th>
        <th>样本量</th>
        <th>试验总时间</th>
        <th>失效数</th>
        <th>评估值点估计</th>
        <th>置信水平</th>
        <th>置信上限</th>
        <th>置信下限</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator var="assessment" value="pageView.records" status="st">
        <tr>
        <td><s:property value="#st.index+1" /></td>
        <td><s:property value="name" /></td>
        <td><s:property value="sampleSize" /></td>
        <td><s:property value="totalTime"/></td>
        <td><s:property value="faultNum" /></td>
        <td><s:property value="point" /></td>
        <td><s:property value="fiducial" /></td>
        <td><s:property value="fiducialUpper" /></td>
        <td><s:property value="fiducialLower" /></td>
        <td><a href="edit?assessId=<s:property value="id" />" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(<s:property value="id" />);" class="tablelink"> 删除</a></td>
        </tr> 
        </s:iterator>
              
        </tbody>
    </table>
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	
	function del(id) {
		if(confirm('确定删除?')) {
			window.location = "del?assessId="+id;
			return true;
		} else {
			return false;
		}
	}
	
	<s:if test="update">
	window.parent.leftFrame.loadTree();
	</s:if>
	</script>

</body>

</html>

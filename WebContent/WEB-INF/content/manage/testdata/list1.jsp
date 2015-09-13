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

<script type="text/javascript">
function del(id) {
		if(confirm('确定删除?')) {
			window.location = 'del?dataid='+id;
			return true;
		} else {
			return false;
		}
	}
</script>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);"><s:property value="project1.box.name"></s:property></a></li>
    <li><a href="<s:url action="detail" namespace="../../manage/project" ><s:param name="projectid" value="project1.id"></s:param></s:url>"><s:property value="project1.name"></s:property></a></li>
    <li><a href="#">试验数据管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="<s:url action="add" namespace="../../manage/testdata" ><s:param name="projectid" value="projectid"></s:param></s:url>"><span><img src="../../images1/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>试验数据名称</th>
        <th>故障名称</th>
        <th>发生时间</th>
        <th>故障现象</th>
        <th>故障原因</th>
        <th>解决措施</th>
        <th>故障类型</th>
        <th>录入日期</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator var="project" value="pageView.records" status="st">
        <tr>
        <td><s:property value="#st.index+1" /></td>
        <td><s:property value="dataName" /></td>
        <td><s:property value="faultName" /></td>
        <td><s:property value="faultWhile.substring(0,10)"/></td>
        <td><s:property value="phenomenon" /></td>
        <td><s:property value="failureCause" /></td>
        <td><s:property value="solutions" /></td>
        <td><s:if test="faultType==1">AB</s:if><s:elseif test="faultType==2">ANB</s:elseif><s:elseif test="faultType==3">NAB</s:elseif><s:elseif test="faultType==4">NANB</s:elseif><s:else>AC</s:else></td>
        <td><s:date name="createTime" format="yyyy-MM-dd"/></td>
        <td><a href="edit?dataid=<s:property value="id" />" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(<s:property value="id" />);" class="tablelink"> 删除</a></td>
        </tr> 
        </s:iterator>
              
        </tbody>
    </table>
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	
	function del(id) {
		if(confirm('确定删除')) {
			window.location = 'del?dataid='+id;
			return true;
		} else {
			return false;
		}
	}
	</script>

</body>

</html>

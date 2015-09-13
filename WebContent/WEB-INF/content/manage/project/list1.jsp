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
    <li><a href="javascript:void(0);">项目管理</a></li>
    <li><a href="#">试验项目列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="<s:url action="add" namespace="../../manage/project" />"><span><img src="../../images1/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>试验项目名称</th>
        <th>试验对象</th>
        <th>可靠性指标</th>
        <th>试验类型</th>
        <th>试验方案</th>
        <th>试验数据</th>
        <th>评估结果</th>
        <th>日期</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator var="project" value="pageView.records" status="st">
        <tr>
        <td><s:property value="#st.index+1" /></td>
        <td><s:property value="name" /></td>
        <td><s:property value="productName" /></td>
        <td><s:property value="reliaIndex" /></td>
        <td><s:if test="testType">可靠性鉴定试验</s:if><s:else>可靠性验收试验</s:else></td>
        <td><s:if test="testScheme==1">指数分布试验方案</s:if><s:elseif test="testScheme==0">二项分布试验方案</s:elseif><s:else>威布尔分布试验方案</s:else></td>
        <td><s:property value="testData" /></td>
        <td><s:property value="review" /></td>
        <td><s:date name="createTime" format="yyyy-MM-dd"/></td>
        <td><a href="detail?projectid=<s:property value="id" />" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(<s:property value="id" />);" class="tablelink"> 删除</a></td>
        </tr> 
        </s:iterator>
              
        </tbody>
    </table>
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	<c:if test="${update}">
	window.parent.leftFrame.loadTree();
	</c:if>
	function del(id) {
		if(confirm('确定删除?')) {
			window.location = 'del?projectid='+id;
			return true;
		} else {
			return false;
		}
	}
	</script>

</body>

</html>

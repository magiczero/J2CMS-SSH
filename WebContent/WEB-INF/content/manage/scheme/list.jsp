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
			window.location = 'del?schemeid='+id;
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
    <li><a href="#">试验方案管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><a href="<s:url action="add3" namespace="../../manage/scheme" ><s:param name="projectid" value="projectid"></s:param></s:url>"><span><img src="../../images1/t01.png" /></span>添加</a></li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:40px;">序号</th>
        <th>方案名称</th>
        <th>方案类型</th>
        <th>截尾方式</th>
        
        <th>录入日期</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator var="scheme" value="pageView.records" status="st">
        <tr>
        <td><s:property value="#st.index+1" /></td>
        <td><s:property value="schemeName" /></td>
        <td><s:if test="type==1">指数分布试验方案</s:if><s:elseif test="type==2">二项分布试验方案</s:elseif><s:else>威布尔分布试验方案</s:else></td>
        <td><s:if test="schemeType==1">定时截尾</s:if><s:elseif test="schemeType==2">定数截尾</s:elseif><s:else>序贯截尾</s:else></td><!-- 方案类型 -->
        <td><s:date name="createTime" format="yyyy-MM-dd"/></td>
        <td><a href="edit?schemeid=<s:property value="id" />" class="tablelink">编辑</a>&nbsp;&nbsp;<a href="javascript:del(<s:property value="id" />);" class="tablelink"> 删除</a></td>
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
	</script>

</body>

</html>

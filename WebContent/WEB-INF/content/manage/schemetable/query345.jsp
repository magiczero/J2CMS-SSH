<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定时试验方案简表</title>
<link href="../../style/style3.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery.js"></script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">常用工具</a></li>
    <li><a href="#">使用方风险β=${subtype }%的定时试验方案</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    
    <table class="tablelist"><caption>使用方风险β=${subtype }%的定时试验方案</caption>
    	<thead>
    	<tr>
							<th rowspan="2">方案号</th>
							<th colspan="2">判决故障数</th>
							<th rowspan="2">总试验时间</th>
							<th rowspan="2">MTBF的观测值</th>
							<th colspan="3">鉴别比d</th>
						</tr>
					<tr>
							
							<th>接收</th>
							<th>拒收</th>
							<th>α=30%</th>
							<th>α=20%</th>
							<th>α=10%</th>
						</tr>
        </thead>
        <tbody>
        <s:iterator var="entity" value="pageView.records">
        <tr>
        <td><s:property value="schemeNum" /></td>
        <td><s:property value="receive" /></td>
        <td><s:property value="rejection" /></td>
        <td><s:property value="testTime" /></td>
        <td><s:property value="mtbf" /></td>
        <td><s:property value="productor3" /></td>
        <td><s:property value="productor2" /></td>
        <td><s:property value="productor1" /></td>
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

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
    <li><a href="#">定时试验方案简表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							<th rowspan="3">试验时间</th>
							<th colspan="2">判决故障数</th>
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							<th >拒收</th>
							<th >接收</th>
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							<th>（≥）</th>
							<th>（≤）</th>
						</tr>
        </thead>
        <tbody>
        <s:iterator var="project" value="pageView.records" status="st">
        <tr>
        <td><s:property value="schemeNum" /></td>
        <td><s:property value="productor1" /></td>
        <td><s:property value="use1" /></td>
        <td><s:property value="productor2" /></td>
        <td><s:property value="use2" /></td>
        <td><s:property value="diffRatio" /></td>
        <td><s:property value="testTime" /></td>
        <td><s:property value="rejection" /></td>
        <td><s:property value="receive"/></td>
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
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>定时截尾</title>
<script type="text/javascript" src="../../js/jquery-1.7.1.js"></script>
<link href="../../css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../../css/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/commonAll.js"></script>
</head>
<body>
<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
					<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							<th rowspan="3">试验时间</th>
							<th colspan="2">判决故障数</th>
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							<th >拒收</th>
							<th >接收</th>
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							<th>（≥）</th>
							<th>（≤）</th>
						</tr>
<c:forEach var="entity" items="${pageView.records}" varStatus="status">
<tr>
<td>${entity.schemeNum }</td>
<td>${entity.productor1}</td>
<td>${entity.use1 }</td>
<td>${entity.productor2 }</td>
<td>${entity.use2 }</td>
<td>${entity.diffRatio }</td>
<td>${entity.testTime }</td>
<td>${entity.rejection }</td>
<td>${entity.receive }</td>
</tr>
</c:forEach>
</table>
</div>
</div>
</body>
</html> --%>
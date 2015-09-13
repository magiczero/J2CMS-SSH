<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试验方案详细信息</title>
<link href="../../css/add_layout.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="container">
	<div class="ui_content">
		<table width="96%" align="center" class="table" border="0" cellspacing="0" cellpadding="4">
						<tbody>
						<tr >
								<th class="topth">产品名称</th>
								<td class="toptd"><s:text name="scheme.project.productName" ></s:text></td>
								<th class="topth">可靠性指标</th>
								<td class="toptd"><s:text name="scheme.project.reliaIndex" ></s:text></td>
							
								<th class="topth">试验方案</th>
								<td class="toptd"><c:choose><c:when test="${scheme.testScheme==true }">指数分布统计试验方案</c:when><c:otherwise>二项分布统计试验方案</c:otherwise></c:choose></td>
							
								<th class="topth">方案类型</th>
								<td class="toptd"><c:choose><c:when test="${scheme.schemeType==1 }">定数截尾统计试验方案</c:when>
								<c:when test="${scheme.schemeType==2 }">定时截尾统计试验方案</c:when>
								<c:when test="${scheme.schemeType==3 }">序贯截尾统计试验方案</c:when>
								</c:choose></td>
							</tr>
							<tr><td colspan="8">试验条件</td></tr>
							<tr >
								<td>试验样本量</td>
								<td>${scheme.sampleSize }</td>
							
								<td>试验总时间</td>
								<td colspan="2">${scheme.totalTime }&nbsp;&nbsp;<c:choose><c:when test="${scheme.unit==1 }">单位1</c:when><c:otherwise>单位2</c:otherwise></c:choose></td>
								<td colspan="2">检验下限（最低可接受值）</td>
								<td>${scheme.lowerLimit }</td>
							</tr>
							<tr >
								<th>生产方风险</th>
								<td>${scheme.producerRisk }</td>
								<th>使用方风险</th>
								<td colspan="2">${scheme.useRisk }</td>
							
								<th colspan="2">鉴别比</th>
								<td>${scheme.ratio }</td>
							</tr>
							<tr><td colspan="8"><input class="ui_input_btn02" type="button" value="生成试验方案"></td></tr>
							<tr>
							<td colspan="8"><textarea rows="7" cols="70"></textarea></td>
							</tr>
							<%-- <tr>
								<th>截尾时间数</th>
								<td>${scheme.truncTime }</td>
							</tr>
							<tr>
								<th>判决故障数</th>
								<td>${scheme.decisionFault }</td>
							</tr> --%>
							<tr>
								<th>备注</th>
								<td colspan="7">${scheme.remark }</td>
							</tr>
							<tr >
								<td colspan="8" style="text-align:center;"><input class="ui_input_btn01" id="submitbutton" type="button" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;<input class="ui_input_btn01" id="submitbutton" type="button" value="取消" /></td>
								
							</tr>
					</tbody></table>
					
	</div>
	
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var iWidth=900; //弹出窗口的宽度
	var iHeight=600; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	
	function viewSchemeTable(type) {
		window.open ('schemetable/queryScheme.action?typeid='+type,'newwindow'+type,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	
	function viewDingshu() {
		window.open ('schemetable/queryDingshuScheme.action','newwindowDingshu','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	
	function viewXuguan() {
		window.open ('schemetable/queryXuguanScheme.action','newwindowXuguan','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">常用工具</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>常用工具</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="javascript:viewSchemeTable(12);"><img src="../images1/i01.png"/></a><h2>定时截尾标准试验方案</h2></li>
    <li><a href="javascript:viewSchemeTable(31);"><img src="../images1/i02.png" /></a><h2>使用方风险β=10%的定时试验方案</h2></li>
    <li><a href="javascript:viewSchemeTable(32);"><img src="../images1/i02.png" /></a><h2>使用方风险β=20%的定时试验方案</h2></li>
    <li><a href="javascript:viewSchemeTable(33);"><img src="../images1/i02.png" /></a><h2>使用方风险β=30%的定时试验方案</h2></li>
    <li><a href="javascript:viewDingshu();"><img src="../images1/i03.png" /></a><h2>定数截尾标准试验方案</h2></li>
    <li><a href="javascript:viewXuguan();"><img src="../images1/i04.png" /></a><h2>序贯截尾标准试验方案</h2></li>
    <li><a href="#"><img src="../images1/i05.png" /></a><h2>信息统计</h2></li>
    </ul>
     
    </div>
    
    <div class="formtitle"><span>数据分析</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
    <li><a href="#"><img src="../images1/i06.png" /></a><h2>费用汇总</h2></li>
    <li><a href="#"><img src="../images1/i07.png" /></a><h2>合同利润</h2></li>
    <li><a href="#"><img src="../images1/i08.png" /></a><h2>收支明细</h2></li>
    <li><a href="#"><img src="../images1/i09.png" /></a><h2>通知公告</h2></li>      
    </ul>
    </div>
    
    
    
    </div>


</body>

</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>可靠性评估信息</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<link href="../../style/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../../script/jquery.validate.js"></script>
<script type="text/javascript" src="../../script/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#save").validate({
    	rules : {
    		"selector.name" : {required:true, maxlength:50},
    		"selector.sampleSize" : {required:true, digits : true},
    		"selector.totalTime" : {required:true, number:true},
    		"selector.faultNum" : {digits:true},
    		"save_selector_fiducialUpper" : {digits:true},
    		"save_selector_fiducialLower" : {digits:true}
    	},
    	messages : {
    		"selector.name" : {
    			required : "请输入评估名称",
    			maxlength : "不能超过 {0}个字"},
    		"selector.sampleSize" : {required:"请输入样本量", digits:"请输入整数"},
    		"selector.totalTime" : {required:"请输入试验总时间", number:"请输入数字"},
    		"selector.faultNum" : {digits:"请输入数字"},
    		"save_selector_fiducialUpper" : {digits:"请输入数字"},
    		"save_selector_fiducialLower" : {digits:"请输入数字"}
    	}
    });
    
    <c:if test="${message != null}">
    alert('<c:out value="${message }"></c:out>');
    </c:if>

});
</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">${selector.project.box.name }</a></li>
    <li><a href="javascript:void(0);">${selector.project.name }</a></li>
    <li><a href="<s:url action="list" namespace="../../manage/assessment" ><s:param name="projectid" value="projectid"></s:param></s:url>">可靠性评估管理管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <s:form action="save" namespace="manage/testdata" theme="simple">
    <s:hidden name="selector.id"></s:hidden>
    <s:hidden name="selector.project.id" ></s:hidden>
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label class="title" for="save_selector_name">评估名称<b>*</b></label>
    <s:textfield name="selector.name" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_sampleSize">样本量<b>*</b></label>
    <s:textfield name="selector.sampleSize" cssClass="dfinput"></s:textfield><i>请填入数字</i></li>
    <li><label class="title" for="save_selector_totalTime">试验总时间<b>*</b></label>
    <s:textfield name="selector.totalTime" cssClass="dfinput"></s:textfield><i>请输入数字</i></li>
    <li><label class="title" for="save_selector_faultNum">失效数</label>
    <s:textfield name="selector.faultNum" cssClass="dfinput"></s:textfield><i>请填入数字</i></li>
	<li><label class="title" for="save_selector_point">评估值点估计</label>
	<s:textfield name="selector.point" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_fiducial">置信水平</label>
    <s:textfield name="selector.fiducial" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_fiducialUpper">置信上限</label>
    <s:textfield name="selector.fiducialUpper" cssClass="dfinput"></s:textfield><i>请填入数字</i></li>
    <li><label class="title" for="save_selector_fiducialLower">置信下限</label>
    <s:textfield name="selector.fiducialLower" cssClass="dfinput"></s:textfield><i>请填入数字</i></li>
    <li><label class="title">&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    
    </s:form>
    </div>
    

</body>

</html>

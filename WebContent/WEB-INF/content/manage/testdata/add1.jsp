<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试验数据信息</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<link href="../../style/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../../script/jquery.validate.js"></script>
<script type="text/javascript" src="../../script/select-ui.min.js"></script>
<script src="../../js/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#save").validate({
    	rules : {
    		"selector.dataName" : {required:true, maxlength:50},
    		"selector.faultName" : {required:true, maxlength : 20},
    		"selector.faultWhile" : "required"
    	},
    	messages : {
    		"selector.dataName" : {
    			required : "请输入项目名称",
    			maxlength : "不能超过 {0}个字"},
    		"selector.faultName" : {required:"请输入故障名称",maxlength:"不能超过 {0}个字"},
    		"selector.faultWhile" : "请输入故障时间"
    	}
    });
    
    $(".select1").uedSelect({
		width : 245			  
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
    <li><a href="<s:url action="list" namespace="../../manage/testdata" ><s:param name="projectid" value="projectid"></s:param></s:url>">试验数据管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <s:form action="save" namespace="manage/testdata" theme="simple">
    <s:hidden name="selector.project.id" ></s:hidden>
    <s:hidden name="selector.id" ></s:hidden>
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label class="title" for="save_selector_dataName">试验数据名称<b>*</b></label>
    <s:textfield name="selector.dataName" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_faultName">故障名称<b>*</b></label>
    <s:textfield name="selector.faultName" cssClass="dfinput"></s:textfield><i>不能超过20个字</i></li>
    <li><label class="title" for="save_selector_faultWhile">故障发生时间<b>*</b></label>
    <s:textfield readonly="true" name="selector.faultWhile" onClick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss'})" cssClass="dfinput"></s:textfield></li>
    <li><label class="title" for="save_selector_phenmenon">故障现象</label>
    <s:textfield name="selector.phenomenon" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
	<li><label class="title" for="save_selector_failureCause">故障原因</label>
	<s:textfield name="selector.failureCause" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_solutions">解决措施</label>
    <s:textfield name="selector.solutions" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_faultType">故障类型</label>
    <div class="vocation"><s:select name="selector.faultType" value="selector.faultType" list="#{'1':'AB','2':'ANB','3':'NAB','4':'NANB','5':'AC' }" cssClass="select1"></s:select></div></li>
    <li><label class="title">&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    
    </s:form>
    </div>
    

</body>

</html>

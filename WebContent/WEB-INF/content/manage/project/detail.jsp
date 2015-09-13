<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试验详细信息</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<link href="../../style/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery-1.11.1.js"></script>
<!-- <script type="text/javascript" src="../../script/jquery.metadata.js"></script> -->
<script type="text/javascript" src="../../script/jquery.validate.js"></script>
<script type="text/javascript" src="../../script/select-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//$.metadata.setType("attr", "validate");
    $("#save").validate({
    	rules : {
    		"selector.name" : {required:true, maxlength:50},
    		"selector.productName" : {maxlength : 20},
    		"selector.reliaIndex" : {maxlength : 50}
    	},
    	messages : {
    		"selector.name" : {
    			required : "请输入项目名称",
    			maxlength : "不能超过 {0}个字"},
    		"selector.productName" : {maxlength:"不能超过 {0}个字"},
    		"selector.reliaIndex" : {maxlength:"不能超过 {0}个字"}
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
    <li><a href="#">系统</a></li>
    <li><a href="<s:url action="list" namespace="../../manage/project" />">项目管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <s:form action="save" namespace="manage/project" theme="simple">
    <s:hidden name="selector.box.id"></s:hidden>
    <s:hidden name="selector.id"></s:hidden>
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label class="title" for="save_selector_name">项目名称<b>*</b></label><s:textfield name="selector.name" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title" for="save_selector_productName">产品名称</label><s:textfield name="selector.productName" cssClass="dfinput"></s:textfield><i>不能超过20个字</i></li>
    <li><label class="title" for="save_selector_reliaIndex">可靠性指标</label><s:textfield name="selector.reliaIndex" cssClass="dfinput"></s:textfield><i>不能超过50个字</i></li>
    <li><label class="title">试验类型<b>*</b></label><div class="vocation"><s:select name="selector.testType" value="selector.testType" list="#{'true':'可靠性鉴定试验','false':'可靠性验收试验'}" cssClass="select1"></s:select></div></li>
	<li><label class="title">试验方案<b>*</b></label><div class="vocation"><s:select name="selector.testScheme" value="selector.testScheme" list="#{'1':'指数分布试验方案','0':'二项分布试验方案','2':'威布尔分布试验方案' }" cssClass="select1"></s:select></div></li>
    
    <li><label class="title">试验数据</label><s:textarea name="selector.testData" cssClass="textinput"></s:textarea></li>
    <li><label class="title">评估结果</label><s:textarea name="selector.review" cssClass="textinput"></s:textarea></li>
    <li><label class="title">&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    
    </s:form>
    </div>
    

</body>

</html>

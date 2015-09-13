<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写试验数据信息</title>
<script type="text/javascript" src="../../js/prototype.js"></script>
<script type="text/javascript" src="../../js/validation_cn.js"></script>
<link href="../../css/form_2.css" rel="stylesheet" type="text/css">
<script src="../../js/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>

</head>
<body>
<s:form id="submitForm"  action="save" namespace="manage/testdata" theme="simple">
<s:hidden name="selector.project.id" ></s:hidden>
<div class="form_content">

<fieldset>
        <legend>试验方案项目</legend>
	<div class="form-row">
            <div class="field-txt">产品信息：</div>
            <div class="field-txt"><s:text name="selector.project.productName"></s:text></div>
	    <div class="field-txt">可靠性指标：</div>
            <div class="field-txt"><s:text name="selector.project.reliaIndex"></s:text></div>
	    
        </div>
	</fieldset>
	<fieldset>
        <legend>试验数据信息</legend>
        
	<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_faultName">故障名称 * </label>：</div>
		<div class="field-widget"><s:textfield name="selector.faultName" cssClass="required " title="故障名称" ></s:textfield></div>
		</div>
		<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_faultWhile">故障发生时间* </label>:</div>
		<div class="field-widget"><s:textfield name="selector.faultWhile" cssClass="required"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss'})">
								<s:param name="value"><s:date name="selector.faultWhile" format="yyyy-MM-dd"/></s:param>
								</s:textfield></div>
		</div>
		<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_faultType">故障类型*</label>:</div>
		<div class="field-widget"><s:select list="#{'true':'可靠性故障','false':'非可靠性故障' }" headerKey="" headerValue="请选择……" name="selector.faultType" cssClass="validate-selection"></s:select></div>
	</div>
		<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_phenomenon">故障现象 </label>:</div>
		<div class="field-widget"><s:textarea name="selector.phenomenon" cssClass="optional max-length-199"></s:textarea></div>
	</div>
	<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_failureCause">故障原因</label>:</div>
		<div class="field-widget"><s:textarea name="selector.failureCause" cssClass="optional max-length-199"></s:textarea></div>
		</div>
		<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_solutions">解决措施 </label>:</div>
		<div class="field-widget"><s:textarea name="selector.solutions" cssClass="optional max-length-199"></s:textarea></div>
	</div>
	
	</fieldset>
	
	<input type="submit" class="ui_input_btn01" value="保存" />
	
</div>

</s:form>
<script type="text/javascript">
	
        var valid = new Validation('submitForm', {immediate : true});
        
	</script>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写试验数据信息</title>
<script type="text/javascript" src="../../js/prototype.js"></script>
<script type="text/javascript" src="../../js/validation_cn.js"></script>
<link href="../../css/form.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function pinggu() {
		var sample_size = $F("submitForm_selector_sampleSize");
		if(sample_size == "" || isNaN(sample_size)) {
			alert("试验样本量必须填写且必须是数字");
			return false;
		}
		
		var fault_num = $F("submitForm_selector_faultNum");
		if(fault_num == "" || isNaN(fault_num)) {
			alert("故障数必须填写且必须是数字");
			return false;
		}
		$("pinggu").innerHTML ='<br/>MTBF点估计值： '+sample_size / fault_num +'<br/>MTBF区间估计：';
	}
</script>
</head>
<body><s:debug></s:debug>
<s:form id="submitForm"  action="save" namespace="manage/testdata" theme="simple">
<s:hidden name="selector.project.id" ></s:hidden>
<s:hidden name="selector.id" ></s:hidden>
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
        <legend>可靠性评估</legend>
        
	<div class="form-row"><div><input class="reset" type="button" value="输 入"/></div>
		<div class="field-label"><label for="submitForm_selector_sampleSize">试验样本数 * </label>：</div>
		<div class="field-widget"><s:textfield name="selector.sampleSize" cssClass="required validate-number" title="试验样本数" ></s:textfield></div>
		<div class="field-label-1"><label for="submitForm_selector_totalTime">总试验时间* </label>:</div>
		<div class="field-widget"><s:textfield name="selector.totalTime" cssClass="required"></s:textfield></div>
	</div>
	<div>&nbsp;</div>
	<div class="form-row">
		<div class="field-label"><label for="submitForm_selector_sampleSize">生产方风险 * </label>：</div>
		<div class="field-widget"><s:textfield name="selector.productor"  value="%{selector.project.scheme.producerRisk}" cssClass="required validate-number" title="生产方风险" ></s:textfield></div>
		<div class="field-label-1"><label for="submitForm_selector_totalTime">使用方风险* </label>:</div>
		<div class="field-widget"><s:textfield name="selector.use" cssClass="required validate-number" value="%{selector.project.scheme.useRisk}"></s:textfield></div>
		<div class="field-label-1"><label for="submitForm_selector_faultNum">责任故障数 * </label>:</div>
		<div class="field-widget"><s:textfield name="selector.faultNum" cssClass="required validate-number"></s:textfield></div>
	</div>
	
	<div class="form-row"><input class="reset" type="button" value="评 估" onclick="javascript:pinggu();"/>
		<div id="pinggu" class="fangan"></div>
	</div>
	</fieldset>
	
	<input type="submit" class="ui_input_btn01" value="保存" />
	
</div>

</s:form>
<script type="text/javascript">
	
        
        var valid = new Validation('submitForm', {immediate : true});
        
        <c:if test="${update==true}">
        alert('保存成功');
        </c:if>
	</script>
</body>
</html>
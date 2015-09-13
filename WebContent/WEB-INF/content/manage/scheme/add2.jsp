<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写信息</title>

<script type="text/javascript" src="../../js/prototype.js"></script>
<script type="text/javascript" src="../../js/validation_cn.js"></script>
<script type="text/javascript" src="../../js/json.js"></script>
<link href="../../css/form.css" rel="stylesheet" type="text/css">

<style type="text/css">
.fangan{margin:10px 5px; color:#666; width:780px; 

text-overflow:ellipsis;  

-o-text-overflow:ellipsis;  
}
</style>
</head>
<body>
<s:form action="save" namespace="manage/scheme" theme="simple">
<s:hidden name="scheme.project.id" ></s:hidden>
<s:hidden name="scheme.id"></s:hidden>
<div class="form_content">

<fieldset>
        <legend>试验方案项目</legend>
	<div class="form-row">
            <div class="field-txt">产品信息：</div>
            <div class="field-txt"><s:text name="scheme.project.productName"></s:text></div>
	    <div class="field-txt">可靠性指标：</div>
            <div class="field-txt"><s:text name="scheme.project.reliaIndex"></s:text></div>
	    <div class="field-label"><label for="save_scheme_schemeType">方案类型</label>：</div>
            <div class="field-widget">
            <s:select list="#{'2':'定时截尾统计试验方案' ,'3':'序贯截尾统计试验方案'}" headerKey="" headerValue="请选择……" name="scheme.schemeType" cssClass="validate-selection"></s:select>
            </div>
        </div>
	</fieldset>
	<fieldset>
        <legend>试验条件</legend>
        <div class="form-row">
        <div class="field-label-1">试验方案：</div>
            <div class="field-txt-1"><s:if test="scheme.project.testScheme">指数分布统计试验方案</s:if><s:else>二项分布统计试验方案</s:else></div>
        </div>
	<div class="form-row">
		
		<div class="field-label-1"><label for="save_scheme_producerRisk">生产方风险* </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.producerRisk" cssClass="required validate-int-range-0-30"></s:textfield></div>
		<div class="field-label-1"><label for="save_scheme_useRisk">使用方风险 * </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.useRisk" cssClass="required validate-number"></s:textfield></div>
	</div>
	<div class="form-row">
			<div class="field-label-1"><label for="save_scheme_sampleSize">可靠度* </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.sampleSize" cssClass="validate-number"></s:textfield></div>
		<div class="field-label-1"><label for="save_scheme_ratio">鉴别比 * </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.ratio" cssClass="required validate-number"></s:textfield></div>
	</div>
	</fieldset>
	
	<fieldset>
        <legend>试验方案</legend>
	<div class="form-row"><input class="reset" type="button" value="生成试验方案" onclick="javascript:void(0);" />
	
	<div class="fangan" id="fangan1"></div>
	</div>
	</fieldset>
	<input type="submit" class="ui_input_btn01" value="保存" />
	
</div></s:form>
<script type="text/javascript">
        
        var valid = new Validation('save', {immediate : true});
        
        <c:if test="${update==true}">
        alert('保存成功');
        </c:if>
	</script>
</body>
</html>
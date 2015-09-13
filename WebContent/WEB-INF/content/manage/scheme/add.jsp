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
<script type="text/javascript">
	
	function viewSchemeTable(type) {
		var iWidth=800; //弹出窗口的宽度
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open ('../schemetable/queryScheme.action?typeid='+type,'newwindow','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	
	function viewDingshu() {
		var iWidth=800; //弹出窗口的宽度
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open ('../schemetable/queryDingshuScheme.action','newwindow','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	
	function viewXuguan() {
		var iWidth=800; //弹出窗口的宽度
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open ('../schemetable/queryXuguanScheme.action','newwindow','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
	}
	/*定时*/
	function loadDingshi() {
		var producer = $F("save_scheme_producerRisk");
		if(producer == "") {
			alert('请填写生产方风险');
			return false;
		}
		var use = $F("save_scheme_useRisk");
		if(use == "") {
			alert('请填写使用方风险');
			return false;
		}
		var ratio = $F("save_scheme_ratio");
		if(ratio == "") {
			alert('请填写鉴别比');
			return false;
		}
		
		
	new Ajax.Request("../schemetable/getDingshi.action?productor="+producer+"&use="+use+"&diffratio="+ratio, {
			method : "post",
			
			onSuccess : function(req) {
				var emps = req.responseText.parseJSON();
				var yangbenliang = '3 ~ 5';
				if ($F("save_scheme_sampleSize") != '')
					yangbenliang = $F("save_scheme_sampleSize");
				if(emps == null)
					$("fangan1").innerHTML ='未找到试验方案';
				else
					$("fangan1").innerHTML = "试验总时间T=" + emps.testTime + " 小时（里程），样本量是 "+yangbenliang+"个，生产方风险α，使用方风险β，接收责任故障数："+emps.receive+" 个，拒收责任故障数："+emps.rejection+"个。";
			}
		});

	}
	/*定数*/
	function loadDingshu() {
		var lower = $F("save_scheme_lowerLimit");
		if(lower == "") {
			alert('请填写最低可接受值');
			return false;
		}
		if(isNaN(lower)) {
			alert('最低可接受值必须是一个数字');
			return false;
		}
		var producer = $F("save_scheme_producerRisk");
		if(producer == "") {
			alert('请填写生产方风险');
			return false;
		}
		producer = parseInt(producer);
		if(producer!=5 && producer!=10) {
			alert("生产方风险请填入5或10");
			return false;
		}
		var use = $F("save_scheme_useRisk");
		if(use == "") {
			alert('请填写使用方风险');
			return false;
		}
		use = parseInt(use);
		if(use!=5 && use!=10) {
			alert("使用方风险请填入5或10");
			return false;
		}
		var ratio = $F("save_scheme_ratio");
		if(ratio == "") {
			alert('请填写鉴别比');
			return false;
		}
		
		producer = producer / 100;
		use = use/100;
		
	new Ajax.Request("../schemetable/getDingshu.action?productor="+producer+"&use="+use+"&diffratio="+ratio, {
			method : "post",
			
			onSuccess : function(req) {
				var emps = req.responseText.parseJSON();
				
				if(emps == null)
					$("fangan2").innerHTML ='未找到试验方案';
				else {
					var panding = emps.use2 * lower;
					$("fangan2").innerHTML = '截尾故障数r='+emps.productor2+'，合格判定数c='+panding+'(h)。即任取n个产品（无替换n>4），试验到r='+emps.productor2+'时，停止试验，计算 ，判断：若  ≥'+panding+'时，接收， <'+panding+'时，拒收。';
					
				}
			}
		});

	}
	/*序贯*/
	function loadXuguan() {
		var producer = $F("save_scheme_producerRisk");
		if(producer == "") {
			alert('请填写生产方风险');
			return false;
		}
		var use = $F("save_scheme_useRisk");
		if(use == "") {
			alert('请填写使用方风险');
			return false;
		}
		var ratio = $F("save_scheme_ratio");
		if(ratio == "") {
			alert('请填写鉴别比');
			return false;
		}
		
		
	new Ajax.Request("../schemetable/getXuguan.action?productor="+producer+"&use="+use+"&diffratio="+ratio, {
			method : "post",
			
			onSuccess : function(req) {
				var emps = req.responseText.parseJSON();
			
				if(emps == null)
					$("fangan3").innerHTML ='未找到试验方案';
				else
					$("fangan3").innerHTML = "方案号"+emps.schemeNum;
			}
		});

	}
	
	function selScheme() {
		var type = $F("save_scheme_schemeType");
		
		if(type == 1) {
			$("method_1").show();$("method_2").hide();$("method_3").hide();
		} else if(type == 2) {
			$("method_1").hide();$("method_2").show();$("method_3").hide();
		} else if(type == 3) {
			$("method_1").hide();$("method_2").hide();$("method_3").show();
		} else {
			$("method_1").hide();$("method_2").hide();$("method_3").hide();
		}
	}
	
	window.onload = function() {
		
		var type = $F("save_scheme_schemeType");
		if(type == 1) {
			$("method_1").show();$("method_2").hide();$("method_3").hide();
		} else if(type == 2) {
			$("method_1").hide();$("method_2").show();$("method_3").hide();
		} else if(type == 3) {
			$("method_1").hide();$("method_2").hide();$("method_3").show();
		} else {
			$("method_1").hide();$("method_2").hide();$("method_3").hide();
		}
	}
</script>
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
            <s:select list="#{'1':'定时截尾统计试验方案','2':'定数截尾统计试验方案' ,'3':'序贯截尾统计试验方案'}" headerKey="" headerValue="请选择……" onchange="javascript:selScheme();" name="scheme.schemeType" cssClass="validate-selection"></s:select>
            </div>
        </div>
	</fieldset>
	<fieldset>
        <legend>试验条件</legend>
        <div class="form-row">
        <div class="field-txt">试验方案：</div>
            <div class="field-txt-1"><s:if test="scheme.project.testScheme">指数分布统计试验方案</s:if><s:else>二项分布统计试验方案</s:else></div>
        </div>
	<div class="form-row">
		<div class="field-label"><label for="save_scheme_lowerLimit">最低可接受值 * </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.lowerLimit" cssClass="required validate-number" title="最低可接受值" ></s:textfield></div>
		<div class="field-label-1"><label for="save_scheme_producerRisk">生产方风险* </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.producerRisk" cssClass="required validate-int-range-0-30"></s:textfield></div>
		<div class="field-label-1"><label for="save_scheme_useRisk">使用方风险 * </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.useRisk" cssClass="required validate-number"></s:textfield></div>
	</div>
	<div class="form-row">
		<div class="field-label"><label for="save_scheme_ratio">鉴别比 * </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.ratio" cssClass="required validate-number"></s:textfield></div>
		<div class="field-label-1"><label for="save_scheme_sampleSize">试验样本量 </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.sampleSize" cssClass="validate-number"></s:textfield></div>
		<div class="field-label-1"><label for="save_scheme_totalTime">试验总时间 </label>：</div>
		<div class="field-widget"><s:textfield name="scheme.totalTime" cssClass="validate-number"></s:textfield><div class="field-txt">&nbsp;&nbsp;小时（里程）</div></div>
	</div>
	</fieldset>
	
	<fieldset id="method_1">
        <legend>定时截尾试验方法</legend>
	<div class="form-row"><input class="reset" type="button" value="生成试验方案" onclick="javascript:loadDingshi();" />
	<input class="reset" type="button" value="定时截尾标准试验方案查询" onclick="javascript:viewSchemeTable(12);" />
	<input class="reset" type="button" value="使用方风险β=10%的定时试验方案" onclick="javascript:viewSchemeTable(3);" />
	<div class="fangan" id="fangan1"></div>
	</div>
	</fieldset>
	<fieldset id="method_2">
        <legend>定数截尾试验方法</legend>
	<div class="form-row"><input class="reset" type="button" value="生成试验方案" onclick="javascript:loadDingshu();" />
	<input class="reset" type="button" value="定数截尾标准试验方案查询" onclick="javascript:viewDingshu();" />
	<div id="fangan2" class="fangan"></div>
	</div>
	</fieldset>
	<fieldset id="method_3">
        <legend>序贯截尾试验方法</legend>
	<div class="form-row"><input class="reset" type="button" value="生成试验方案" onclick="javascript:loadXuguan();" />
	<input class="reset" type="button" value="序贯截尾标准试验方案查询" onclick="javascript:viewXuguan();" />
	<div id="fangan3" class="fangan"></div>
	</div>
	</fieldset>
	<input type="submit" class="ui_input_btn01" value="保存" />
	
</div></s:form>
<script type="text/javascript">
	 function formCallback(result, form) {
            window.status = "valiation callback for form '" + form.id + "': result = " + result;
        }
        
        var valid = new Validation('save', {immediate : true, onFormValidate : formCallback});
        
        <c:if test="${update==true}">
        alert('保存成功');
        </c:if>
	</script>
</body>
</html>
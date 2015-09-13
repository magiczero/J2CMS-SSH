<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加项目信息</title>
<script type="text/javascript" src="../../js/jquery-1.7.1.js"></script>
<link href="../../css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../../css/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/commonAll.js"></script>
<script type="text/javascript" src="../../js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			if(validateForm()){
				$("#submitForm").submit();
				window.parent.$.fancybox.close();
			}
		});
		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});
	});
	
	/** 表单验证  **/
	function validateForm(){
		if($("#projectname").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写项目名称', ok:true,});
			return false;
		}
		if($("#productname").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写产品名称', ok:true,});
			return false;
		}
		
		return true;
	}
</script>
<style type="text/css">
fieldset {
 color:#333; 
 border:#06c dashed 1px;
} 
legend {
 color:#06c;
 font-weight:800; 
 background:#fff;
} 
</style>
</head>
<body>


<div id="container">
		<div id="nav_links">
			当前位置：基础数据&nbsp;>&nbsp;<span style="color: #1A5CC6;">试验项目信息</span>
			<div id="page_close">
				<a href="javascript:parent.$.fancybox.close();">
					<img src="../../images/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<fieldset><legend>新建项目</legend>
<form id="submitForm" action="save" method="post">
		<div class="ui_content">
<table  cellspacing="3" cellpadding="0" width="100%" align="left" border="0"> 
<tr>
<td class="ui_text_rt">项目名称</td>
<td class="ui_text_lt"><input class="ui_input_txt02" id="projectname" name="entity.name" type="text" /><span style="color:red;">&nbsp;*&nbsp;${message1}</span></td>

<td class="ui_text_rt">产品名称</td>
<td class="ui_text_lt"><input class="ui_input_txt02" id="productname" name="entity.productName" type="text" /><span style="color:red;">&nbsp;*&nbsp;${message2}</span></td>
</tr>
<tr>
<td class="ui_text_rt">可靠性指标</td>
<td colspan="3" class="ui_text_lt"><input class="ui_input_txt02" name="entity.reliaIndex" type="text" /></td>
</tr>
<tr>
<td class="ui_text_rt">试验类型</td>
<td colspan="3" class="ui_text_lt"><select name="entity.testType" class="ui_select01">
				<option value="1" >可靠性鉴定试验</option>
				<option value="0" >可靠性验收试验</option>
		</select></td>
</tr>
<tr>
<td class="ui_text_rt">试验方案</td>
<td colspan="3" class="ui_text_lt"><select name="entity.testScheme" class="ui_select01">
				<option value="1" >指数分布试验方案</option>
				<option value="0" >二项分布试验方案</option>
				<option value="2" >威布尔分布试验方案</option>
		</select></td>
</tr>
<tr>
<td class="ui_text_rt">试验数据</td>
<td colspan="3" class="ui_text_lt"><input class="ui_input_txt02" name="entity.testData" type="text" /></td>
</tr>
<tr>
<td class="ui_text_rt">评估结果</td>
<td colspan="3" class="ui_text_lt"><input class="ui_input_txt02" name="entity.review" type="text" /></td>
</tr>
<tr>
<td>&nbsp;</td><td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/>
					</td>
</tr>
</table>
</div></form></fieldset>
</div>

</body>
</html>
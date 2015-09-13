<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加盒子</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../../script/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function() {

    $("#save").validate({
    	rules : {
    		"entity.name" : {required:true, maxlength:20},
    		"entity.remark" : {maxlength:100}
    	},
    	messages : {
    		"entity.name" : {
    			required : "请输入项目名称",
    			maxlength : "不能超过 {0}个字"},
    		"entity.remark" : {maxlength : "不能超过 {0}个字"}
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
    <li><a href="<s:url action="sys" namespace="../../manage/user" />">系统管理</a></li>
    <li><a href="<s:url action="list" namespace="../../manage/box" />">项目管理</a></li>
    <li><a href="javascript:void(0);">添加/编辑基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <s:form action="save" namespace="manage/box" theme="simple">
    <s:hidden name="entity.id" />
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label class="title" for="save_entity_name">名称<b>*</b></label><s:textfield name="entity.name" cssClass="dfinput"></s:textfield><i>不能超过20个字</i></li>
   	<li><label class="title" for="save_entity_remark">备注</label><textarea name="entity.remark" class="textinput"></textarea><i>不能超过100个字</i></li>
    <li><label class="title">&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    
    </s:form>
    </div>
    

</body>

</html>

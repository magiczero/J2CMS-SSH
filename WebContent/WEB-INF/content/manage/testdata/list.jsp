<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试验数据列表</title>
<script type="text/javascript" src="../../js/jquery-1.7.1.js"></script>
<link href="../../css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../../css/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/commonAll.js"></script>
<script type="text/javascript" src="../../js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addBtn').click(function(){
		window.location.href = "add?projectid="+${projectid};
	});
});

function del(id) {
	if(confirm('确认要删除？'))
		window.location.href="del?id="+id;
}
</script>
</head>
<body>
<div id="container">
<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							名称
							<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                                <option value=""
                                >--请选择--</option>
                                <option value="6">名称1</option>
                                <option value="77">名称2</option>
                                <option value="83">名称3</option>
                            </select>

							分类
							<select name="fangyuanEntity.fyDhCode" id="fyDh" class="ui_select01">
                                <option value="">--请选择--</option>
                            </select>
							类型
							<select name="fangyuanEntity.fyHxCode" id="fyHx" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="76">类型1</option>
                                <option value="10">类型2</option>
                                <option value="14">类型3</option>
                                <option value="71">类型4</option>
                            </select>
							状态
							<select name="fangyuanEntity.fyStatus" id="fyStatus" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="26">状态1</option>
                                <option value="25">状态2</option>
                                <option value="13">状态3</option>
                                <option value="12">状态4</option>
                                <option value="24">状态5</option>
                                <option value="23">状态6</option>
                                <option value="27">状态7</option>
                            </select>

							判定&nbsp;&nbsp;<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
						</div>
					</div>
				</div>
			</div>
<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>							
							<th>序号</th>
							<th>项目名称</th>
							<th>故障名称</th>
							<th>故障发生时间</th>
							<th>故障现象</th>
							<th>故障原因</th>
							<th>解决措施</th>
							<th>故障类型</th>
							<th>操作</th>
						</tr>
<c:forEach var="entity" items="${pageView.records}" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${entity.project.name }</td>
								<td>${entity.faultName }</td>
								<td><c:out value="${fn:substring(entity.faultWhile,0,19) }" /></td>
								<td>${entity.phenomenon }</td>
								<td>${entity.failureCause }</td>
								<td>${entity.solutions }</td>
								<td><s:if test="entity.faultType ">可靠性故障</s:if><s:else>非可靠性故障</s:else></td>
								<td><a href="javascript:void(0);" onclick="javascript:del(${entity.id});">删除</a></td>
								</tr>
								</c:forEach>
								</table>
								</div>
								</div>
								</div>
</body>
</html>
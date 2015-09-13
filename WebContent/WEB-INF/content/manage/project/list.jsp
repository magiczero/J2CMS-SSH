<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目列表</title>
<script type="text/javascript" src="../../js/jquery-1.7.1.js"></script>
<link href="../../css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../../css/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/commonAll.js"></script>
<script type="text/javascript" src="../../js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="../../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="../../js/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
$(document).ready(function(){
	/** 新增   **/
    $("#addBtn").fancybox({
    	'href'  : 'add',
    	'width' : 733,
        'height' : 530,
        'type' : 'iframe',
        'hideOnOverlayClick' : false,
        'showCloseButton' : false,
        'onClosed' : function() { 
        	window.location.href = 'list';
        }
    });
});
function parent1(pid) {
	
	window.parent.inScheme(pid);
}

function del(id) {
	if(confirm('确定删除？')) {window.location='del?projectid='+id;}
}
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
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
							<!-- <input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" /> -->
							<input type="button" value="导出" class="ui_input_btn01" onclick="parent1();" />
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
							<th>产品名称</th>
							<th>试验类型</th>
							<th>试验方案</th>
							<th>试验数据</th>
							<th>评估结果</th>
							<th>日期</th>
							<th>备注</th>
						</tr>
						<c:forEach var="entity" items="${pageView.records}" varStatus="status">
							<tr>
								
								<td>${status.index+1 }</td>
								<td><a title="点击查看试验方案" href="javascript:parent1(${entity.id});" class="edit">${entity.name}</a></td>
								<td>${entity.productName}</td>
								<td><c:choose><c:when test="${entity.testType}">可靠性鉴定试验</c:when><c:otherwise>可靠性验收试验</c:otherwise></c:choose></td>
								<td>
								<c:choose>
											<c:when test="${entity.testScheme }">指数分布统计试验方案</c:when>
											<c:otherwise>二项分布统计试验方案</c:otherwise>
								</c:choose>
								</td>
								<td>${entity.testData}</td>
								<td>${entity.review }</td>
								<td><s:date name="entity.createTime" format="yyyy-MM-dd" /></td>
								<td>
									<a href="#" class="edit">编辑</a> 
									<a href="javascript:del(${entity.id });">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04">90</span>
						条记录，当前第
						<span class="ui_txt_bold04">1
						/
						9</span>
						页
					</div>
					<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
						
							<input type="button" value="首页" class="ui_input_btn01" />
							<input type="button" value="上一页" class="ui_input_btn01" />
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(2);" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(9);" />
						
						
						
						<!--     如果是最后一页，则只显示首页、上一页 -->
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onclick="jumpInputPage(9);" />
					</div>
				</div>
			</div>
		</div>
	</form>


</body>
</html>
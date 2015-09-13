<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="../../css/new_style.css" rel="stylesheet" type="text/css" />
<script src="../../js/entity.js" language="javascript" type="text/javascript"></script>
<style type="text/css">
ul{display:block;margin:0;padding:0;list-style:none;}
li{display:block;margin:0;padding:0;list-style: none;}
a,a:focus{text-decoration:none;color:#000;outline:none;blr:expression(this.onFocus=this.blur());}
.place{position:fixed; top:0; left:0;width:100%;height:40px; background:url(../../images1/righttop.gif) repeat-x;}
.place span{line-height:40px; font-weight:bold;float:left; margin-left:12px;}
.placeul li{float:left; line-height:40px; padding-left:7px; padding-right:12px; background:url(../../images1/rlist.gif) no-repeat right;}
.placeul li:last-child{background:none;}
</style>
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
	<form name="frmAction" id="frmAction" method="post" action="list">
		<input name="id" type="hidden" id="id" value="0" />

		<div id="main_frame">
			<div id="main_column">

				<div>
					<div class="mainbox-title-container">
						<div class="mainbox-title">用户管理</div>
					</div>

					<div class="mainbox-body">
						<table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
							<tr>
								<td>
									<div class="statistics-box-order">
										<div class="statistics-body-order">


											<table width="100%">
												<tr>
													<td width="100%"><input type="button" onclick="add()" value=" 增 加 " />&nbsp;&nbsp; <input type="button" onclick="edit()" value=" 修 改 " />&nbsp;&nbsp; <input type="button" onclick="del()" value=" 删 除 " />&nbsp;&nbsp;</td>
												</tr>
											</table>

											<table width="100%" border="0" cellpadding="3" cellspacing="1">
												<tr style="font-size:16px; text-align:center; font-weight:bold;">
													<td width="5%" ><input type="checkbox" name="selall" onclick="selectAll(this)" /></td>
													<td>用户名</td>
													
													<td>真实姓名</td>
													<td>电子邮箱</td>
													<td>电话</td>
													<td>单位</td>
													<td>职务</td>
													<td>性别</td>
													<td>状态</td>
													<td >操作</td>
												</tr>
												

												<c:forEach var="entity" items="${pageView.records}" varStatus="status">
													<tr class="vieworder_row">
														<td align="center"><input type='checkbox' name='ids' value="${entity.id}" /></td>
														<td align="center"><c:out value="${entity.username}" /></td>
														
														<td align="center"><c:out value="${entity.realName}" /></td>
														<td align="center"><c:out value="${entity.email}" /></td>
														<td align="center"><c:out value="${entity.telephone}" /></td>
														<td align="center"><c:out value="${entity.address}" /></td>
														<td align="center"><c:out value="${entity.zipCode}" /></td>
														<td align="center"><c:if test="${entity.gender=='unknown'}"></c:if> <c:if test="${entity.gender=='man'}">男</c:if> <c:if test="${entity.gender=='woman'}">女</c:if></td>
														<td align="center"><c:if test="${entity.checkState=='pass'}">
																<img src="../../images/yes.gif" title="已审核" />
															</c:if> <c:if test="${entity.checkState=='noCheck'}">
																<img src="../../images/noCheck.gif" title="待审核" />
															</c:if> <c:if test="${entity.checkState=='noPass'}">
																<img src="../..../../images/no.gif" title="未通过" />
															</c:if> <c:if test="${entity.checkState=='recycle'}">
																<img src="../../images/recycle.gif" title="回收站" />
															</c:if></td>
														<td align="center"><input type="button" onclick="editSingle(${entity.id})" value=" 修 改 " /> <input type="button" onclick="delSingle(${entity.id},'${entity.checkState}')" value=" 删 除 " /></td>
													</tr>
												</c:forEach>

											</table>
											<%@ include file="../util/paging.jsp"%>

										</div>
									</div>
								</td>
							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>

	</form>
</body>
</html>

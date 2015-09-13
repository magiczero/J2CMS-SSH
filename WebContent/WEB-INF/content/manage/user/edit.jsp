<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../css/new_style.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<form name="frmAction" id="frmAction" method="post" action="update">
	<input name="selector.id" type="hidden" id="selector.id" value="${selector.id}" /> 
	<input name="selector.username" type="hidden" id="selector.username" value="${selector.username}" /> 
	<input name="selector.group.id" type="hidden" id="selector.group.id" value="${selector.group.id}" /> 
	<input name="selector.gender" type="hidden" id="selector.gender" value="${selector.gender}" /> 
	<input name="selector.realName" type="hidden" id="selector.realName" value="${selector.realName}" /> 
	<input name="selector.birthday" type="hidden" id="selector.birthday" value="${selector.birthday}" /> 
	<input name="selector.email" type="hidden" id="selector.email" value="${selector.email}" /> 
	<input name="selector.telephone" type="hidden" id="selector.telephone" value="${selector.telephone}" /> 
	<input name="selector.QQ" type="hidden" id="selector.QQ" value="${selector.QQ}" /> 
	<input name="selector.address" type="hidden" id="selector.address" value="${selector.address}" /> 
	<input name="selector.zipCode" type="hidden" id="selector.zipCode" value="${selector.zipCode}" /> 
	<input name="selector.checkState" type="hidden" id="selector.checkState" value="${selector.checkState}" />

	<input name="entity.id" type="hidden" id="entity.id" value="${entity.id}" />

	<input name="entity.group.id"" type="hidden" id="entity.group.id"" value="${group.id}" />
		<input name="entity.checkState" type="hidden" id="entity.checkState"" value="pass" />
		<div id="main_frame">
			<div id="main_column">

				<div>
					<div class="mainbox-title-container">
						<div class="mainbox-title">修改用户</div>
					</div>

					<div class="mainbox-body">
						<table cellpadding="0" cellspacing="0" border="0" class="table-fixed">
							<tr>
								<td>

									<div class="statistics-box-order">
										<div class="statistics-body-order">

											<table width="100%" border="0px;" cellpadding="0px;" cellspacing="2px;">

												<tr>
													<td height="25px" align="right">用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td colspan="2"><input name="entity.username" type="text" id="entity.username" value="${entity.username}"  size="30"/> <span class="info1">&nbsp;*&nbsp;${message1}</span></td>
												</tr>
												<tr>
													<td height="25px" align="right">密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td colspan="2"><input name="entity.password" type="password" id="entity.password" value=""  size="30"/> <span class="info1">&nbsp;*&nbsp;留空为不修改&nbsp;${message2}</span></td>
												</tr>
												<!--  
	<tr>
		<td height="25px" align="right" nowrap >再次输入密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td colspan="2"><input name="password" type="password" id="password" value="" /></td>
	</tr>
	-->
												<tr>
													<td height="25px" align="right">真实姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td colspan="2"><input name="entity.realName" type="text" id="entity.realName" value="${entity.realName}"  size="30"/></td>
												</tr>
												<tr>
													<td height="25px" align="right">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><select name="entity.gender" id="gender">
															<!-- <option value="unknown"<c:if test="${entity.gender=='unknown'}"> selected="selected"</c:if>>未知</option>		     -->
															<option value="man">男</option>
															<option value="woman">女</option>
													</select> <script>
														document
																.getElementById("entity.gender").value = '${entity.gender}';
													</script></td>
												</tr>
												<tr>
													<td height="25px" align="right">电子邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input name="entity.email" type="text" id="entity.email" value="${entity.email}" size="30"/></td>
												</tr>
												<tr>
													<td height="25px" align="right">电话&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input name="entity.telephone" type="text" id="entity.telephone" value="${entity.telephone}"  size="30"/></td>
												</tr>
												<tr>
													<td height="25px" align="right">单位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input name="entity.address" type="text" id="entity.address" value="${entity.address}" size="30" /></td>
												</tr>
												<tr>
													<td height="25px" align="right">职务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td colspan="2"><input name="entity.zipCode" type="text" id="entity.zipCode" value="${entity.zipCode}"  size="30"/></td>
												</tr>

												<tr>
													<td colspan="3">
														<p align="center" /> <br /> <input type="submit" value=" 保 存 " /> <input type="button" value=" 返 回 " onclick='javascript: history.go(-1)' />
													</td>
												</tr>
											</table>
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
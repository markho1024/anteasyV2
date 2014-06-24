<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'user_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/UsrE_listC.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/UsrE_editC";
		});
	});
</script>

</head>

<body>
 <div id="page">
	<div id="header">
		<s:include value="../main/header.jsp" />
	</div>
	<div id="context">
		<div id="leftbar" class="left"><jsp:include
				page="../main/nav/${loginUser.userType}th.jsp" /></div>
		<div id="rightpane" class="right">
			<div class="navTittle">
				<h2>用户综合管理—> 用户管理—> 查看用户</h2>
			</div>
			<div class="loadtable">
				<form action="UsrE_updateC">
					<p class="title">用户资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								用户号：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="user.loginID"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								用户名称：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="user.userName"/></span>
								</div>
							</div></li>
						<li>
							<div class="mainth">
								用户密码：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="user.password"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								用户类型：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="user_type" code="user.userType"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								状态：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="status" code="${user.status }"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="user.remark"/></span>
								</div>
							</div></li>
					</ul>

					<div class="loadButton">
						<input type="button" class="buttons" id="ctrledit" value="修改">
						<input type="button" class="buttonlt" id="ctrlBack" value="返回">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<br>
		<s:include value="../main/footer.jsp" />
	</div>
	</div>
</body>
</html>
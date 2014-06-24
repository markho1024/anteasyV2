<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'message_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/Msg_listAll.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Msg_edit";
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
				<h2>站内信综合管理—> 站内信管理—> 查看站内信</h2>
			</div>
			<div class="loadtable">
				<form action="Msg_update">
					<p class="title">站内信资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								寄信人：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="message.setter"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								收信人：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="message.getter"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								创建日期：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:date name="message.createDate" format="yyyy-MM-dd"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								标题：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="message.tittle"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								内容：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="message.remark"/></span>
								</div>
							</div></li>
					</ul>

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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'college_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/Clg_listAll.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Clg_edit";
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
				<h2>院系综合管理—> 院系管理—> 查看院系</h2>
			</div>
			<div class="loadtable">
				<form action="Clg_update">
					<p class="title">院系资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								院系号：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="college.collegeID"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								院系名称：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="college.collegeName"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								创建日期：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:date name="college.createDate" format="yyyy-MM-dd"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								状态：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="status" code="${college.status }"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="college.remark"/></span>
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
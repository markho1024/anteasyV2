<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'course_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/Crs_listAll.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Crs_edit";
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
				<h2>课程综合管理—> 课程管理—> 查看课程</h2>
			</div>
			<div class="loadtable">
				<form action="Crs_update">
					<p class="title">课程资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								课程号：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="course.courseID"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								课程名称：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="course.courseName"/></span>
								</div>
							</div></li>
						<li>
							<div class="mainth">
								所属学院：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="course.collegeID"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:map type="collegeName" name="college" code="course.collegeID"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								课程类别：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="course_kind" code="course.courseKind"/></span>
								</div>
							</div></li>
							
						<li>
							<div class="mainth">
								创建日期：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:date name="course.createDate" format="yyyy-MM-dd"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								状态：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="status" code="${course.status }"/></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="course.remark"/></span>
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
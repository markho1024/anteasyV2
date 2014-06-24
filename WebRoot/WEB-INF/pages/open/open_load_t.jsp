<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'open_list.jsp' starting page</title>
<<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/Opn_listAll.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Opn_edit";
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
				<h2>开课综合管理—> 开课管理—> 查看开课</h2>
			</div>
			<div class="loadtable">
				<form action="open_update">
					<p class="title">开课资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">课程号：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.courseID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">课序号：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.orderID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">课程名称：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:map type="courseName" name="course"
											code="open.courseID" />
									</span>
								</div>
							</div>
						</li>
					</ul>
					<p class="title">附属资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">开课学院：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.collegeID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth"></div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:map type="collegeName" name="college"
											code="open.collegeID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">开课教师：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.teacherID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth"></div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:map type="teacherName" name="teacher"
											code="open.teacherID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">课程类型：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="course_type"
											code="open.courseType" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">考试类型：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="score_kind"
											code="open.scoreKind" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">学分：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.credit" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">课程类型：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="period_type"
											code="open.periodType" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">学时：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.period" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">人数：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.countLimit" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">已有人数：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.countNow" />
									</span>
								</div>
							</div>
						</li>

					</ul>
					<p class="title">附属资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">上课星期：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="table_week"
											code="open.tableWeek" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">上课时间：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="table_day"
											code="open.tableDay" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">上课地点：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.address" />
									</span>
								</div>
							</div>
						</li>

					</ul>
					<p class="title">其他资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">状态：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:dict type="status"
											code="open.status" /> </span>
								</div>
							</div></li>

						<li>
							<div class="mainth">备注：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="open.remark" />
									</span>
								</div>
							</div>
						</li>
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'pick_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/Scr_listAll.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Scr_edit";
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
				<h2>选课综合管理—> 成绩管理—> 查看成绩</h2>
			</div>
			<div class="loadtable">
				<form action="Scr_update">
					<p class="title">选课资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">学生号：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="pick.studentID" />
									</span>
								</div>
							</div>
						</li>
						<div class="mainth"></div>
						<div class="maintd">
							<div class="playbox">
								<span class="words"><a:map type="studentName"
										name="student" code="pick.studentID" />
								</span>
							</div>
						</div>
						</li>

						<li>
							<div class="mainth">课程号：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"> <a:map name="open" type="courseID"
											code="pick.openID" /> </span>
								</div>
							</div>
						</li>
						<li>
							<div class="mainth"></div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:deep name="open|course"
											type="courseID|courseName" code="pick.openID" />
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">课序号：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><a:map name="open" type="orderID"
											code="pick.openID" />
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">选课日期：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:date name="pick.createDate"
											format="yyyy-MM-dd" />
									</span>
								</div>
							</div>
						</li>

					</ul>
					<p class="title">成绩资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">成绩：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words">
                                 <s:if test="open.scoreKind==1">									
									<s:property value="pick.score" />
                                 </s:if>
                                 <s:if test="open.scoreKind==2">
                                    <a:dict type="score" code="pick.score"></a:dict>
                                 </s:if>
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">考试日期：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:date name="pick.examDate"
											format="yyyy-MM-dd" />
									</span>
								</div>
							</div>
						</li>

					</ul>

					<p class="title">其他资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">备注：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="pick.remark" />
									</span>
								</div>
							</div>
						</li>
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'student_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/StdE_listC.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/StdE_editC";
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
				<h2>用户综合管理—> 学生管理—> 查看学生</h2>
			</div>
			<div class="loadtable">
				<form action="Std_updateC">
					<div>
						<p class="title">学生资料</p>
						<ul class="maintable">
							<li>
								<div class="mainth">学生号：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property
												value="student.studentID" /> </span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">学生名称：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property
												value="student.studentName" /> </span>
									</div>
								</div>
							</li>
							
							
							<li>
								<div class="mainth">学生类型：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:dict type="student_type"
												code="student.studentType" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">所属院系：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.collegeID"/></span>
									</div>
								</div>
							</li>
							<li>
								<div class="mainth"></div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:map type="collegeName" name="college"
												code="student.collegeID" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">所属专业：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.majorID"/></span>
									</div>
								</div>
							</li>
							<li>
								<div class="mainth"></div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:map type="majorName" name="major"
												code="student.majorID" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">所属班级：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.clazzID"/></span>
									</div>
								</div>
							</li>
							<li>
								<div class="mainth"></div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:map type="clazzName" name="clazz"
												code="student.clazzID" /></span>
									</div>
								</div>
							</li>


							<li>
								<div class="mainth">入学日期：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:date name="student.createDate"
												format="yyyy-MM-dd" /> </span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">毕业学校：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property
												value="student.graSchool" /></span>
									</div>
								</div>
							</li>
						</ul>

						<p class="title">个人资料</p>
						<ul class="maintable">
							<li>
								<div class="mainth">性别：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:dict type="sex" code="student.sex" /> </span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">身份证号：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.idCard" /></span>
									</div>
								</div>
							</li>


							<li>
								<div class="mainth">生日日期：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:date name="student.birthday"
												format="yyyy-MM-dd" /> </span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">民族：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.nation" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">籍贯：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property
												value="student.hometown" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">政治面貌：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:dict type="party"
												code="student.party" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">加入时间：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:date name="student.jionDate"
												format="yyyy-MM-dd" /> </span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">联系电话：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.phone" /></span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">电子邮箱：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.email" /></span>
									</div>
								</div>
							</li>
						</ul>

						<p class="title">家庭资料</p>
						<ul class="maintable">
							<li>
								<div class="mainth">监护人名字：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property
												value="student.parentName" /></span>
									</div>
								</div>
							</li>

							<div class="mainth">监护人电话：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property
											value="student.parentPhone" /></span>
								</div>
							</div>
							</li>

							<div class="mainth">家庭地址：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property
											value="student.homeAddress" /></span>
								</div>
							</div>
							</li>

							<div class="mainth">地址邮编：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property value="student.mailCode" /></span>
								</div>
							</div>
							</li>

							<div class="mainth">家庭电话：</div>
							<div class="maintd">
								<div class="playbox">
									<span class="words"><s:property
											value="student.homePhone" /></span>
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
												code="student.status" /> </span>
									</div>
								</div>
							</li>

							<li>
								<div class="mainth">备注：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="student.remark" />
										</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'teacher_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
	        window.location.href = "<%=request.getContextPath()%>/Tcr_listAll.action?currentPage=1";
						});
		$("#ctrledit").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Tcr_edit";
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
				<h2>用户综合管理—> 教师管理—> 查看教师</h2>
			</div>
			<div class="loadtable">
				<form action="Tcr_update">
					<div>
					    <p class="title">教师资料</p>
						<ul class="maintable">
							<li>
								<div class="mainth">教师号：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="teacher.teacherID" />
										</span>
									</div>
								</div></li>

							<li>
								<div class="mainth">教师名称：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="teacher.teacherName" />
										</span>
									</div>
								</div></li>

							<li>
								<div class="mainth">所属院系：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="teacher.collegeID" />
									</div>
								</div></li>

							<li>
								<div class="mainth"></div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:map type="collegeName" name="college"
												code="teacher.collegeID" />
									</div>
								</div></li>

						
							<li>
								<div class="mainth">入职日期：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:date
												name="teacher.createDate" format="yyyy-MM-dd"/> </span>
									</div>
								</div></li>

							<li>
								<div class="mainth">状态：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><a:dict type="status"
												code="teacher.status" /> </span>
									</div>
								</div></li>
						</ul>
	
						<p class="title">个人资料</p>
						<ul class="maintable">				
							<li>
								<div class="mainth">联系电话：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="teacher.phone"/>
									</div>
								</div></li>
								
							<li>
								<div class="mainth">电子邮箱：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="teacher.email"/>
									</div>
								</div></li>
                       </ul>
								
						<p class="title">其他资料</p>
						<ul class="maintable">	
							<li>
								<div class="mainth">备注：</div>
								<div class="maintd">
									<div class="playbox">
										<span class="words"><s:property value="teacher.remark" />
										</span>
									</div>
								</div></li>
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
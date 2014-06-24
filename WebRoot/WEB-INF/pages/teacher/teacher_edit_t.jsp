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
		$("#saveForm").validate({
			rules : {
				"teacher.phone" : {
				    phone:true,
					required:true
				},
				"teacher.email" : {
				    email:true,
					required:true
				}
			},
			errorPlacement: function(error, element) {  
		        error.appendTo(element.parent().parent().children("span.errs"));  
			}
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
				<h2>学院综合管理—> 教师管理—> 修改教师</h2>
			</div>
			<div class="addtable">
				<form action="TcrE_updateT" id="saveForm">
					<p class="title">个人资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>联系电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="teacher.phone" id="PHONE" maxlength="64"
										value="${teacher.phone}"> </span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div>
						</li>
						
						<li>
							<div class="mainth">
								<span class="red">*</span>电子邮箱：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="teacher.email" id="EMAIL" maxlength="64"
										value="${teacher.email}"> </span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">4-30位字母、数字或汉字（汉字算一位）组成，格式如“360@qq.com”</div>
							</div>
						</li>
					</ul>
					
					<div class="editButton">
						<input type="submit" class="buttons" id="ctrlLoad" value="提交">
						<input type="reset" class="buttonlt" id="ctrlBack" value="恢复">
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
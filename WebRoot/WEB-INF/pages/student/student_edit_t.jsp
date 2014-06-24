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
		$("#CREATE_DATE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		
		$("#BIRTHDAY").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		
		$("#JION_DATE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/std_listAll.action?currentPage=1";
						});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID").blur(function(){
             setMajor();
		});
		$("#MAJOE_ID").blur(function(){
             setClazz();
		});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
                 "phone" : {
					phone:true,
					required:true
				},
				"student.email" : {
					email: true,
					required:true
				},
				"student.parentName" : {
					rangelength : [ 2, 20 ],
					required:true
				},
				"student.parentPhone" : {
					phone:true,
					required:true
				},
				"student.homeAddress" : {
					rangelength : [ 4, 60 ],
					required:true
				},
				"student.mailCode" : {
					mailcode:true,
					rangelenth:[4,30],
					required:true
				},
				"student.homePhone" : {
					phone:true,
					required:true
				},
				"student.remark" : {
					maxlength : 60
				},

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
				<h2>学院综合管理—> 学生管理—> 增加学生</h2>
			</div>
			<div class="addtable">
				<form action="StdE_updateT" id="saveForm">
					<p class="title">个人资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>联系电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.phone" id="PHONE"
											maxlength="64" value="${student.phone}">
									</span>
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
									<span class="input">
										<input type="text" name="student.email" id="EMAIL"
											maxlength="64" value="${student.email}">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">4-30位字母、数字或汉字（汉字算一位）组成，格式如“360@qq.com”</div>
							</div>
						</li>

					</ul>

<!-- 
					<p class="title">家庭资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>监护人名字：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.parentName" id="PARENT_NAME"
											maxlength="64" value="${student.parentName}">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">2-20位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>监护人电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.parentPhone"
											id="PARENT_PHONE" maxlength="64" value="${student.parentPhone}">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>家庭地址：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.homeAddress"
											id="HOME_ADDRESS" maxlength="64" value="${student.homeAddress}">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">4-60位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>地址邮编：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.mailCode" id="MAILCODE"
											maxlength="64" value="${student.mailCode}">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">6位纯数字组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>家庭电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.homePhone" id="HOME_PHONE"
											maxlength="64" value="${student.homePhone}">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div>
						</li>
					</ul>
	 -->				
					<div class="editButton">
						<input type="submit" class="buttons" id="ctrlLoad" value="提交">
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
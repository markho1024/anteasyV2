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

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"college.collegeName" : {
					rangelength : [ 3, 20 ],
					required:true
				},
				"college.createDate" : {
				    required:true,
					date:true
				},
				"college.remark" : {
					maxlength : 60
				}
			},
			errorPlacement: function(error, element) {  
		        error.appendTo(element.parent().parent().children("span.errs"));  
			}
		});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#CREATE_DATE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true,
		});
	});
</script>

</head>


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
				<h2>院系综合管理—> 院系管理—> 增加院系</h2>
			</div>
			<div class="addtable">
				<form action="Clg_save" id="saveForm">
					<p class="title">院系资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="grad">*</span>院系号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="college.collegeID" id="COLLEGE_ID" maxlength="64"
										value="${college.collegeID }" readonly="readonly"
										class="disinput"></span>
								</div>
								<div class="inputtxt">院系号不可改</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>院系名称：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="college.collegeName"
											id="COLLEGE_NAME" maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">3-20位小写字母、数字或汉字（汉字算一位）组成</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>创建日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="college.createDate" id="CREATE_DATE" maxlength="64"
										value="${nowDate}">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div></li>

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="college.remark" id="REMARK" rows="7" cols="32"></textarea>
									</span>
									<span class="errs"></span>
								</div>
								<div class="textareatxt">4-60位小写字母、数字或汉字（汉字算两位）组成</div>
							</div></li>
					</ul>

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
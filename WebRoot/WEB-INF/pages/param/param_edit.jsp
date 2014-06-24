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
		$("#CHOICE_ONE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		$("#CHOICE_TWO").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		$("#LOG_ONE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		$("#LOG_TWO").datepicker({
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
		$("#saveForm").validate({
			rules : {
				"params.choiceOne" : {
					required:true,
					date:true
				},
				"params.choiceTwo" : {
					required:true,
					date:true
				},
				"params.logOne" : {
					required:true,
					date:true
				},
				"params.logTwo" : {
					required:true,
					date:true
				},
				"params.pageCount" : {
					required:true,
					range:[5,500]
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
				<h2>选课管理—> 修改参数</h2>
			</div>
			<div class="addtable">
				<form action="Prm_update" id="saveForm">
					<p class="title">院系资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>搜索结果显示个数：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="params.pageCount" id="PAGE_COUNT" maxlength="64"
										value="${params.pageCount}" > </span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">5-500内的数字</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>上学期选课时间：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="params.choiceOne" id="CHOICE_ONE" maxlength="64"
										value="${params.choiceOne}">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>下学期选课时间：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="params.choiceTwo" id="CHOICE_TWO" maxlength="64"
										value="${params.choiceTwo}">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>上学期考试时间：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="params.logOne" id="LOG_ONE" maxlength="64"
										value="${params.logOne}">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>下学期考试时间：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="params.logTwo" id="LOG_TWO" maxlength="64"
										value="${params.logTwo}">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div></li>

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
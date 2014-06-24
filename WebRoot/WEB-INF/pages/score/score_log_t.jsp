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
			window.location.href = "<%=request.getContextPath()%>/ScrE_scoreT.action?currentPage=1";
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"pick.score":{
				    required:true,
				    range:[0,100]
				},
				"pick.examDate" : {
					required:true,
					date:true,
					betweendate:"#CREATE_DATE"
				},
				"pick,remark":{
				    maxlength:60
				}
			},
			messages:{
				"pick.examDate" : {
					betweendate:"考试时间必须大于创建时间"
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
		$("#EXAM_DATE").datepicker({
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
		$("#SCORE_S").combotree({
			url : "./DctJ_json?type=score",
			width : 164,
			editable : false
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
				<h2>选课综合管理—> 选课管理—> 修改选课</h2>
			</div>
			<div class="addtable">
				<form action="ScrE_logedT" id="saveForm">
					<p class="title">选课资料</p>
					<ul class="maintable">
				
						<li>
							<div class="mainth">
								<span class="grad">*</span>学生号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="pick.studentID" id="STUDENT_ID"
											maxlength="64" value="${pick.studentID}" readonly="readonly" class="disinput">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="grad">*</span>课程号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="pick.courseID" id="COURSE_ID"
											maxlength="64" value="${open.courseID}" readonly="readonly" class="disinput">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="grad">*</span>课序号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" id="ORDER_ID"
											maxlength="64" name="pick.orderID" value="${open.orderID}" readonly="readonly" class="disinput">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>选课日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="pick.createDate" id="CREATE_DATE" maxlength="64"
										value="${pick.createDate}" readonly="readonly" class="disinput">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt"></div>
							</div></li>

					</ul>
					<p class="title">考试资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>成绩：
							</div>
							
						<s:if test="open.scoreKind==1">
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="pick.score" id="SCORE"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">成绩</div>
							</div></li>		
						</s:if>
						
						<s:if test="open.scoreKind==2">
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="pick.score" id="SCORE_S"
											maxlength="64" value="A">
									</span>
									<span class="errs"></span>
								</div>
							</div></li>		
						</s:if>
	
						
						<li>
							<div class="mainth">
								<span class="red">*</span>考试日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="pick.examDate" id="EXAM_DATE" maxlength="64"
										value="${nowDate}">
										</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div></li>
							</ul>
							
					<p class="title">其他资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="pick.remark" id="REMARK" rows="7" cols="32"></textarea>
									</span>
									<span class="errs"></span>
								</div>
								<div class="textareatxt">4-60位小写字母、数字或汉字（汉字算一位）组成</div>
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
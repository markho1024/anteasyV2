<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'plan_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/PlnE_listC.action?currentPage=1";
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#STUDENT_TYPE").combotree({
			url : "./DctJ_json?type=student_type",
			width:164,
			editable : false,
	        onChange:function(){
				    var vo = $("#STUDENT_TYPE").combotree('getValue');
					var url= "./PlnJ_comboGP?jsonType=&jsonValue="+vo;
					$("#GRADE_ID").combotree('setValue','');
			        $("#GRADE_ID").combotree('reload',url);
			  }
		});
		
		$("#GRADE_ID").combotree({
		    url : "./PlnJ_comboGP?jsonType=&jsonValue="+ $("#STUDENT_TYPE").combotree('getValue'),
			width:164,
			editable : false
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"plan.remark" : {
					maxlength : 60
				},
				"plan.majorID" : {
					required:true,
					digits : true,
					remote:{
							type:"post",
							url:"./MjrJ_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#MAJOR_ID").val(); }
							}
							
					}
				},
				"plan.courseID" : {
					required:true,
					digits : true,
					remote:{
							type:"post",
							url:"./Crs_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#COURSE_ID").val(); }
							}
							
					}
				}
			},
			messages:{
				"plan.majorID" : {
					remote:"专业号不存在"
				},
				"plan.courseID" : {
					remote:"课程号不存在"
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
			changeYear: true
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
				<h2>课程综合管理—> 专业授课计划管理—> 修改计划</h2>
			</div>
			<div class="addtable">
				<form action="PlnE_updateC" id="saveForm">
					<p class="title">计划资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">
								<span class="red">*</span>计划专业：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="plan.majorID" id="MAJOR_ID"
											maxlength="64" value="${plan.majorID}">
									</span>
									<span class="errs"></span>
								</div>
                            <div class="inputtxt">请输入合格的专业号（四位纯数字）<a href="<%=request.getContextPath()%>/MjrE_listC.action?soMajor=&startDate=&endDate=" target="_blank">查找专业</a></div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>计划课程：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="plan.courseID" id="COURSE_ID"
											maxlength="64" value="${plan.courseID}">
									</span>
									<span class="errs"></span>
								</div>
                                <div class="inputtxt">请输入合格的课程号（纯数字）<a href="<%=request.getContextPath()%>/CrsE_listC.action?soMajor=&startDate=&endDate=" target="_blank">查找课程</a></div>
							</div></li>

						<li>
							<div class="mainth">
								学生类型：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" id="STUDENT_TYPE"
											maxlength="64" name="plan.studentType" value="${plan.studentType}">
									</span>
									<span class="errs"></span>
								</div>
							</div></li>
							
							
						<li>
							<div class="mainth">
								所属年级：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="plan.gradeID" id="GRADE_ID"
											maxlength="64" value="${plan.gradeID}">
									</span>
									<span class="errs"></span>
								</div>
							</div></li>
							

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="plan.remark" id="REMARK" rows="7" cols="32">${plan.remark}</textarea>
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
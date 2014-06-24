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
			window.location.href = "<%=request.getContextPath()%>/Chc_listAll.action?currentPage=1";
						});
       	$("#ctrlLoad").bind("click",function(){
			var voc = $("#COURSE_ID").val();
			var voo = $("#ORDER_ID").val();
			var vos = $("#STUDENT_ID").val();
			var errWords=null;
			if(voc!=null&&voo!=null&&voc!=''&&voo!=''){
			     $.ajax({ 
				       type: "post", 
				       url: "./ChcJ_isSaveS?open.courseID="+voc+"&open.orderID="+voo+"&pick.studentID="+vos,
				       dataType: "json", 
				       success: function (data) { 
				            errWords=data[0].ew;
				            if(errWords==null||errWords==''||errWords=="null"){
                  				$("#navForm").submit();
							}else{
                  				alert(errWords);
							}
				   		}, 
				   	  error: function (XMLHttpRequest, textStatus, errorThrown) { 
				             alert(errorThrown); 
				        }
				   });
			}
	    });
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"pick.studentID" : {
					required:true,
					digits:true,
					remote:{
							type:"post",
							url:"./SdtJ_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#STUDENT_ID").val(); }
							}
							
					}
				},
				"open.courseID" : {
					required:true,
					digits:true,
					remote:{
							type:"post",
							url:"./OpnJ_hasCourse",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#COURSE_ID").val(); }
							}
							
					}
				},
				"open.orderID" : {
					required:true,
					digits:true,
					remote:{
							type:"post",
							url:"./OpnJ_hasOrder",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#COURSE_ID").val(); },
							    order: function() { return $("#ORDER_ID").val(); }
							}
							
					}
				}
			},
			messages:{
				"pick.studentID" : {
					remote:"学生号不存在"
				},
				"open.courseID" : {
					remote:"课程号不存在"
				},
				"open.orderID" : {
					remote:"课序号不存在"
				}
			},
			errorPlacement: function(error, element) {  
		        error.appendTo(element.parent().parent().children("span.errs"));  
			}
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
				<h2>选课综合管理—> 选课管理—> 增加选课</h2>
			</div>
			<div class="addtable">
				<form action="Chc_save" id="saveForm">
					<p class="title">选课资料</p>
					<ul class="maintable">
				
						<li>
							<div class="mainth">
								<span class="red">*</span>学生号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="pick.studentID" id="STUDENT_ID"
											maxlength="64">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的学生号（十位纯数字）<a href="<%=request.getContextPath()%>/Std_listAll.action?soStudent=&startDate=&endDate=" target="_blank">查找学生</a></div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>课程号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="open.courseID" id="COURSE_ID"
											maxlength="64">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的课程号（七位纯数字）<a href="<%=request.getContextPath()%>/Crs_listAll.action?soCourse=&startDate=&endDate=" target="_blank">查找课程</a></div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>课序号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" id="ORDER_ID"
											maxlength="64" name="open.orderID">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的课序号（小于四位纯数字）<a href="<%=request.getContextPath()%>/Opn_listAll.action?soOpen=&startDate=&endDate=&lowCredit=&highCredit="" target="_blank">查找开课</a></div>
							</div></li>

					</ul>

					<div class="editButton">
						<input type="button" class="buttons" id="ctrlLoad" value="提交">
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
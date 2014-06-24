<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'course_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Crs_listAll.action?currentPage=1";
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"course.courseName" : {
					rangelength : [ 4, 20 ],
					required:true
				},
				"course.createDate" : {
					required:true,
					date:true
				},
				"course.remark" : {
					maxlength : 60
				},
				"count" : {
				required:true,
					range:[1,8]
				},
				"course.collegeID" : {
				    required:true,
				    digits : true,
					remote:{
							type:"post",
							url:"./ClgJ_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id : function() { return $("#COLLEGE_ID").val(); }
							}
					}
				}
			},
			messages:{
					"course.collegeID" : {
					remote:"院系号不存在"
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


<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID_S").combotree({
			url : "./ClgJ_combo?jsonType=ing",
			width:164,
			editable : false,
			onChange:function(){
		           var vo = $("#COLLEGE_ID_S").combotree('getValue');
                   $("#COLLEGE_ID").val(vo);
	               $("#COLLEGE_ID")[0].focus();
	               $("#COLLEGE_ID")[0].blur();
			}
		});
		$("#COURSE_KIND").combotree({
			url : "./DctJ_json?type=course_kind",
			width:164,
			editable : false,
			onChange:function(){
                  setNext();
			}
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID").blur(function(){
             setNext();
		});
	});
</script>

<script type="text/javascript">
function setNext() {
   var voc =  $("#COLLEGE_ID").val();
   var vot = $("#COURSE_KIND").combotree('getValue');

   if(voc!=null&&vot!=null&&voc!=''&&vot!=''){
	   $.ajax({ 
	       type: "post", 
	       url: "./CrsJ_next?jsonValue="+voc+"&jsonKind="+vot, 
	       dataType: "json", 
	       success: function (data) { 
		       var no=parseInt(data[0].next/10)%1000+1;
		       var college = parseInt(voc);
		       var type = parseInt(vot);
		       var v =(college*10+type)*1000+no+'0';
		       $("#COURSE_ID").val(v);
		       $("#COURSE_ID")[0].focus();
	   		}, 
	   	  error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                 //     alert(errorThrown); 
	        } 
	   });
   }
};
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
				<h2>课程综合管理—> 课程管理—> 增加课程</h2>
			</div>
			<div class="addtable">
				<form action="Crs_save" id="saveForm">
					<p class="title">课程资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>课程号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="course.courseID" id="COURSE_ID" maxlength="64"
										readonly="readonly"
										class="disinput"></span>
								</div>
								<div class="inputtxt">课程号不可改</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>课程名称：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="course.courseName"
											id="COURSE_NAME" maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">4-20位小写字母、数字或汉字（汉字算一位）组成</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>所属院系：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text"  id="COLLEGE_ID_S"
											maxlength="64">
									</span>
									<span class="errs"></span>
								</div>
							</div></li>
						<li>
							<div class="mainth">
								
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="course.collegeID" id="COLLEGE_ID"
											maxlength="64">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的学院号（两位纯数字）<a href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate=" target="_blank">查找学院</a></div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>课程类别：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"  id="COURSE_KIND" name="course.courseKind"  maxlength="64"
										value="1"></span>
								</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>课程学期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"  id="COUNT" name="count"  maxlength="64"
										value="1"></span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">1-8的数字</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>创建日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="course.createDate" id="CREATE_DATE" maxlength="64"
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
										<textarea name="course.remark" id="REMARK" rows="7" cols="32"></textarea>
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
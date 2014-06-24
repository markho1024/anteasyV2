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
			window.location.href = "<%=request.getContextPath()%>/CrsE_listC.action?currentPage=1";
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
function setNext() {
   var voc = ${loginUser.collegeID};
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

<script type="text/javascript">
	$(function() {
		$("#COURSE_KIND").combotree({
			url : "./DctJ_json?type=course_kind",
			width:164,
			editable : false,
			onChange:function(){
                  setNext();
			}
		});
		setNext()
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
				<h2>课程综合管理—> 课程管理—> 增加课程</h2>
			</div>
			<div class="addtable">
				<form action="CrsE_saveC" id="saveForm">
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
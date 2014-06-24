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
			window.location.href = "<%=request.getContextPath()%>/TcrE_listC.action?currentPage=1";
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"teacher.teacherName" : {
					rangelength : [ 2, 20 ],
					required:true
				},
				"teacher.createDate" : {
					required:true,
					date:true
				},
				"teacher.remark" : {
					maxlength : 60
				},
				"teacher.teacherID" : {
					required:true
				},
				"teacher.phone" : {
				    phone:true,
					required:true
				},
				"teacher.email" : {
				    email:true,
				    rangelenth:[4,30],
					required:true
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
   $.ajax({ 
       type: "post", 
       url: "./TcrJ_next.action?jsonValue="+${loginUser.collegeID}, 
       dataType: "json", 
       success: function (data) { 
	       var no=data[0].next%1000+1;
	       var myDate = new Date();
	       var date =  myDate.getFullYear()%100; 
	       var college = ${loginUser.collegeID};
	       var v = date*100000 + college*1000 +no;
	       $("#TEACHER_ID").val(v);
	       $("#TEACHER_ID")[0].focus();
   		}, 
   	  error: function (XMLHttpRequest, textStatus, errorThrown) { 
                 //     alert(errorThrown); 
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
				<h2>用户综合管理—> 教师管理—> 增加教师</h2>
			</div>
			<div class="addtable">
				<form action="TcrE_saveC" id="saveForm">
					<p class="title">教师资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="grad">*</span>教师号
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="teacher.teacherID" id="TEACHER_ID" maxlength="64"
										readonly="readonly" class="disinput">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">教师号不可改</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>教师姓名：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="teacher.teacherName" id="TEACHER_NAME"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">2-20位字母、数字或汉字（汉字算一位）组成</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>入职日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="teacher.createDate" id="CREATE_DATE" maxlength="64"
										value="${nowDate}"></span>
										<span class="errs"></span>
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div>
						</li>	
					</ul>
					
					<p class="title">个人资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>联系电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="teacher.phone" id="PHONE"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>电子邮箱：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="teacher.email" id="EMAIL"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
									<div class="inputtxt">4-30位字母、数字或汉字（汉字算一位）组成，格式如“360@qq.com”</div>
								</div>
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
										<textarea name="teacher.remark" id="REMARK" rows="7" cols="32"></textarea>
									</span>
									<span class="errs"></span>
								</div>
								<div class="textareatxt">不多于60位的小写字母、数字或汉字（汉字算一位）组成</div>
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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'user_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/UsrE_listC.action?currentPage=1";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"user.loginID" : {
					rangelength : [ 2, 16 ],
					required:true
				},
				"user.userName" : {
					rangelength : [ 2, 20 ],
					required:true
				},
				"user.password" : {
					rangelength : [ 4, 20 ],
					required:true
				},
				"user.remark" : {
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
  		$("#USER_TYPE").combotree({
			url : "./DctJ_jsonLimit?type=user_type",
			editable : false,
			width:164
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
				<h2>用户综合管理—> 用户管理—> 修改用户</h2>
			</div>
			<div class="addtable">
				<form action="UsrE_updateC" id="saveForm">
					<p class="title">用户资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="grad">*</span>用户号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="user.loginID" id="LOGIN_ID" maxlength="64"
										value="${user.loginID }" readonly="readonly"
										class="disinput"> </span>
								</div>
								<div class="inputtxt">用户号不可改</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>用户名称：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="user.userName"
											id="USER_NAME" maxlength="64" value="${user.userName}">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">2-20位小写字母、数字或汉字（汉字算一位）组成</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>用户密码：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="user.password" id="PASSWORD" maxlength="64" value="${user.password}"></span>
								</div>
								<div class="inputtxt">2-20位小写字母、数字或汉字（汉字算一位）组成</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>用户类型：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="user.userType"
											id="USER_TYPE" maxlength="64" value="${user.userType}">
									</span>
									<span class="errs"></span>
								</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>状态：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="radio"><s:radio list="#{'1':'正常','97':'已锁定'}" name="user.status" theme="simple" value="#{user.status}" /> </span>
								</div>
								<div class="inputtxt"></div>
							</div></li>


						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="user.remark" id="REMARK" rows="7" cols="32">${user.remark}</textarea>
									</span>
									<span class="errs"></span>
								</div>
								<div class="textareatxt">不大于60位小写字母、数字或汉字（汉字算两位）组成</div>
							</div></li>
					</ul>
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
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
			window.location.href = "<%=request.getContextPath()%>/main";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"newpw" : {
					equalTo:"#USER_PASSWORD",
					rangelength:[3,16]
				},
				"oldpw":{
				    rangelength:[3,16],
                   	remote:{
							type:"post",
							url:"./UsrJ_isPw",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    pw: function() { return $("#OLDPW").val(); }
							}
							
					}
                    			
				},
				"user.password":{
				    rangelength:[4,16],
                    equalnoto:"#OLDPW"	
				}
			},
		  	messages : {
				"newpw" : {
					equalTo:"密码必须一致",
					
				},
				"oldpw":{
                    remote:"密码错误"		
				},
				"user.password":{
                    equalno:"新旧密码不能一样"		
				}
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
				<h2>用户综合管理—> 修改密码</h2>
			</div>
			<div class="addtable">
				<form action="UsrE_updateT" id="saveForm">
					<p class="title">密码资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>旧密码：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="password"
										name="oldpw" id="OLDPW" maxlength="64"> </span>
							     	<span class="errs"></span>
								</div>
								<div class="inputtxt">4-16位小写字母、数字组成</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>新密码：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="password" name="user.password"
											id="USER_PASSWORD" maxlength="64" >
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">4-16位小写字母、数字组成</div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>确认新密码：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="password"
										name="newpw" id="NEWPS" maxlength="64"></span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">4-16位小写字母、数字组成</div>
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
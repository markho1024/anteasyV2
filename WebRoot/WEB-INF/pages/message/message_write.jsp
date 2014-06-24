<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'message_list.jsp' starting page</title>

<s:include value="../main/meta.jsp" />

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate(
				{
					rules : {
						"message.getter" : {
							required : true,
							remote : {
								type : "post",
								url : "./UsrJ_isExist",
								ignoreSameValue : true,
								cache : false,
								dataType : "json",
								data : {
									loginID : function() {
										return $("#GETTER").val();
									}
								}

							}
						},
						"message.remark" : {
							maxlength : 120,
							required : true

						},
						"message.tittle" : {
							maxlength : 12,
							required : true
						}
					},
					messages : {
						"message.getter" : {
							remote : "用户号不存在"
						}
					},
					errorPlacement : function(error, element) {
						error.appendTo(element.parent().parent().children(
								"span.errs"));
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
					<h2>站内信管理—> 发送站内信</h2>
				</div>
				<div class="addtable">
					<form action="MsgE_set" id="saveForm">
						<p class="title">站内信资料</p>
						<ul class="maintable">
							<li>
								<div class="mainth">
									<span class="red">*</span>收信人：
								</div>
								<div class="maintd">
									<div class="inputbox">
										<span class="input"> <input type="text"
											name="message.getter" id="GETTER" maxlength="64" value="" />
										</span> <span class="errs"></span>
									</div>
									<div class="inputtxt">请输入合格的用户号（少于16位的字符 ）</div>
								</div>
							</li>


							<li>
								<div class="mainth">
									<span class="red">*</span>标题：
								</div>
								<div class="maintd">
									<div class="inputbox">
										<span class="input"> <input type="text"
											name="message.tittle" id="TITTLE" maxlength="64" value="" />
										</span> <span class="errs"></span>
									</div>
									<div class="inputtxt">不多于12位小写字母、数字或汉字（汉字算一位）组成</div>
								</div>
							</li>


							<li>
								<div class="mainth">内容：</div>
								<div class="maintd">
									<div class="inputbox">
										<span class="input"> <textarea name="message.remark"
												id="REMARK" rows="7" cols="32"></textarea> </span> <span
											class="errs"></span>
									</div>
									<div class="textareatxt">不多于120位小写字母、数字或汉字（汉字算一位）组成</div>
								</div>
							</li>
						</ul>

						<div class="editButton">
							<input type="submit" class="buttons" id="ctrlLoad" value="发送">
							<input type="reset" class="buttonlt" id="ctrlBack" value="重置">
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
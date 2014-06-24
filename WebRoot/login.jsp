<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'logino.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="./css/base.css">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<link rel="stylesheet" type="text/css" href="./css/validation.css">

<link rel="stylesheet" href="styles/skin/skin_0.css" type="text/css" id="cssfile" />

<script type="text/javascript" src="./js/jquery-1.7.1.js">
	
</script>
<script type="text/javascript"
	src="./tool/jquery-validation-1.9.0/jquery.validate.js">
</script>

<script type="text/javascript" src="./js/util.js">
</script>

<script type="text/javascript" src="./js/jquery.cookie.js">
</script>
<script type="text/javascript" src="./js/changeSkin.js">
</script>

<script type="text/javascript">
	$(function() {
		$("#loginForm").validate(
				{
					rules : {
						"loginID" : {
							required : true,
							remote : {
								type : "post",
								url : "./lgnJ_hasUser",
								ignoreSameValue : true,
								cache : false,
								dataType : "json",
								data : {
									loginID : function() {
										return $("#LOGIN_ID").val();
									}
								}
							}
						},
						"password" : {
							required : true,
							remote : {
								type : "post",
								url : "./lgnJ_isLogin",
								ignoreSameValue : true,
								cache : false,
								dataType : "json",
								data : {
									loginID : function() {
										return $("#LOGIN_ID").val();
									},
									password : function() {
										return $("#PASSWORD").val();
									}
								}

							}
						}
					},
					messages : {
						"loginID" : {
							remote : "账号不存在"
						},
						"password" : {
							remote : "密码错误"
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
	<div id="loginGo">
		<form action="login" id="loginForm">
			<div class="loginTitle">
				<ul id="skin">
					<li id="skin_0" title="蓝色" class="selected">蓝色</li>
					<li id="skin_1" title="紫色">紫色</li>
					<li id="skin_2" title="红色">红色</li>
					<li id="skin_3" title="天蓝色">天蓝色</li>
					<li id="skin_4" title="橙色">橙色</li>
					<li id="skin_5" title="淡绿色">淡绿色</li>
				</ul>
				<div class="logo">乐易学生管理系统</div>
			</div>
			<div class="loginBody">
				<ul>
					<li>
						<div class="loginTh">
							<div class="span">用户名：</div>
						</div>
						<div class="loginTd">
							<span><input type="text" name="loginID" id="LOGIN_ID">
							</span> <span class="errs"></span>
						</div>
						<div class="loginerr"></div>
					</li>
					<li>
						<div class="loginTh">
							<div class="span">用户密码：</div>
						</div>
						<div class="loginTd">
							<span><input type="password" name="password" id="PASSWORD">
							</span> <span class="errs"></span>
						</div>
						<div class="loginerr"></div>
					</li>
					<li>
						<div class="LoginButton">
							<input type="submit" class="submit" value="登陆"> <input
								type="reset" class="reset" value="重置">
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>

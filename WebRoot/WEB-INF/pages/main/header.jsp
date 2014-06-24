<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<div id="logo" href="login.jsp">&nbsp;&nbsp;&nbsp;乐易学生管理系统</div>
<ul id="skin">
	<li id="skin_0" title="蓝色" class="selected">
		蓝色
	</li>
	<li id="skin_1" title="紫色">
		紫色
	</li>
	<li id="skin_2" title="红色">
		红色
	</li>
	<li id="skin_3" title="天蓝色">
		天蓝色
	</li>
	<li id="skin_4" title="橙色">
		橙色
	</li>
	<li id="skin_5" title="淡绿色">
		淡绿色
	</li>
</ul>
<div id="loginUser">
	<span>你好：${loginUser.userName}  <a:dict type="user_type" code="${loginUser.userType}"/>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/logout.action" class="outlink">退出</a>
	
</div>

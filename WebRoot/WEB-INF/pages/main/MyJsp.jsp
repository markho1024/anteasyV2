<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title>My JSP 'main.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="Hine">
<link rel="stylesheet" type="text/css" href="./css/astyle.css">
<link rel="stylesheet" type="text/css"
	href="./tool/jquery-ui-1.8.17.custom/css/smoothness/jquery-ui-1.8.17.custom.css">
<link rel="stylesheet" type="text/css"
	href="./tool/jquery-easyui-1.2.5/themes/default/easyui.css">
<script type="text/javascript" src="./js/jquery-1.7.1.js">
	
</script>
<script type="text/javascript"
	src="./tool/jquery-ui-1.8.17.custom/js/jquery-ui-1.8.17.custom.min.js">
	
</script>
<script type="text/javascript"
	src="./tool/jquery-easyui-1.2.5/jquery.easyui.min.js">
	
</script>
	

</head>

<body>
	<div id="header">
		<s:include value="../main/header.jsp" />
	</div>
	<div id="context">
		<div id="leftbar" class="left"><jsp:include
				page="../main/nav/${loginUser.userTypeID}th.jsp" /></div>
		<div id="rightpane" class="right">
			<div class="navTittle">
				<h2>学院综合管理—> 学院管理</h2>
			</div>
		</div>
	</div>
	<div id="footer">
		<br>
		<s:include value="../main/footer.jsp" />
	</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'major_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />

<script type="text/javascript"
	src="./tool/jquery-ui-1.8.17.custom/js/jquery-ui-1.8.17.custom.min.js">
	
</script>
<script type="text/javascript"
	src="./tool/jquery-easyui-1.2.5/jquery.easyui.min.js">
	
</script>


<script type="text/javascript"
	src="./tool/jquery-validation-1.9.0/jquery.validate.js">
</script>

<script type="text/javascript" src="./js/util.js">
</script>

<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Mjr_listAll.action?currentPage=1";
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
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"major.majorName" : {
					rangelength : [ 4, 20 ],
					required:true
				},
				"major.createDate" : {
					required:true,
					date:true
				},
				"major.remark" : {
					maxlength : 60
				},
				"major.collegeID" : {
				    required:true,
				    digits : true,
					remote:{
							type:"post",
							url:"./ClgJ_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#COLLEGE_ID").val(); }
							}
							
					}
				}
			},
			messages:{
					"major.collegeID" : {
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
		$("#COLLEGE_ID").blur(function(){
             setNext();
		});
	});
</script>

<script type="text/javascript">
function setNext() {
    var vo= $("#COLLEGE_ID").val();
    if(vo!=null&vo!=''){
   $.ajax({ 
       type: "post", 
       url: "./MjrJ_next.action?jsonValue="+vo, 
       dataType: "json", 
       success: function (data) { 
	       var no=data[0].next%100;
	       var college = parseInt(vo);
	       var v =college*100 +no;
	       $("#MAJOR_ID").val(v);
	       $("#MAJOR_ID")[0].focus();
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
				<h2>学院综合管理—> 专业管理—> 增加专业</h2>
			</div>
			<div class="addtable">
				<form action="Mjr_save" id="saveForm">
					<p class="title">专业资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="grad">*</span>专业号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="major.majorID" id="MAJOR_ID" maxlength="64" readonly="readonly" class="disinput">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">专业号不可改</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>专业名称：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="major.majorName" id="MAJOR_NAME"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">4-20位小写字母、数字或汉字（汉字算两位）组成</div>
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
										<input type="text" name="major.collegeID" id="COLLEGE_ID"
											maxlength="64">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的学院号（两位纯数字）<a href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate=" target="_blank">查找学院</a></div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>创建日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="major.createDate" id="CREATE_DATE" maxlength="64"
										value="${nowDate}"> </span>
									<span class="errs"></span>		
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								备注：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="major.remark" id="REMARK" rows="7" cols="32"></textarea>
									</span>
								<span class="errs"></span>	
								</div>
								<div class="textareatxt">4-60位小写字母、数字或汉字（汉字算一位）组成</div>
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
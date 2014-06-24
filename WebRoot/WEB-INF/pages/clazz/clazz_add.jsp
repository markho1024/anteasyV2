<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'clazz_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Clz_listAll.action?currentPage=1";
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"clazz.clazzName" : {
					rangelength : [ 4, 20 ],
					required:true
				},
				"clazz.remark" : {
					maxlength : 60
				},
				"clazz.createDate" : {
					required:true,
					date:true
				},
				"clazz.collegeID":{
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
				},
				"clazz.majorID":{
				    required:true,
				    digits : true,
					remote:{
							type:"post",
							url:"./Mjr_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#MAJOR_ID").val(); }
							}
							
					}
				}
			},
			messages : {
				"clazz.collegeID" : {
					remote:"院系号不存在"
				},
				"clazz.majorID" : {
					remote:"专业号不存在"
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
		$("#COLLEGE_ID_S").combotree({
			url : "./ClgJ_combo?jsonType=ing",
			editable : false,
			width:164,
			onChange:function(){
			        var voc = $("#COLLEGE_ID_S").combotree('getValue');
					var url= "./MjrJ_comboP?jsonType=ing&jsonValue="+voc;
			        $("#MAJOR_ID_S").combotree('setValue','');
			        $("#MAJOR_ID_S").combotree('reload',url);
			        $("#COLLEGE_ID").val(voc);
	                $("#COLLEGE_ID")[0].focus();
	                $("#COLLEGE_ID")[0].blur();
			}
		});
  		$("#MAJOR_ID_S").combotree({
			url : "./MjrJ_combo?jsonType=ing",
			editable : false,
			width:164,
			onChange:function(){
			var vom = $("#MAJOR_ID_S").combotree('getValue');
			 $("#MAJOR_ID").val(vom);
             $("#MAJOR_ID")[0].focus();
             $("#MAJOR_ID")[0].blur();
			}
	    }); 
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID").blur(function(){
             setNext();
             setMajor();
		});
		$("#MAJOR_ID").blur(function(){
             setNext();
		});
	});
</script>

<script type="text/javascript">
function setNext(){
	var voc= $("#COLLEGE_ID").val();
	var vom= $("#MAJOR_ID").val();
	var myDate = new Date();
    var date =  myDate.getFullYear();
	if(voc!=null&&vom!=null&&voc!=''&&vom!=''){
	   $.ajax({ 
       type: "post", 
       url: "./ClzJ_next?jsonValue="+vom+"&jsonDate="+date,
       dataType: "json", 
       success: function (data) { 
               var no=data[0].next%100;
			   var major = parseInt(vom);
			   var next = date*1000000 + major*100 +no;
			   $("#CLAZZ_ID").val(next);
   		}, 
   	  error: function (XMLHttpRequest, textStatus, errorThrown) { 
                 //     alert(errorThrown); 
        } 
     });
   }
};
</script>


<script type="text/javascript">
function setMajor(){
    var voc = $("#COLLEGE_ID").val();
    var urlc= "./MjrJ_comboP?jsonType=ing&jsonValue="+voc;
   	$("#MAJOR_ID_S").combotree('setValue','');
	$("#MAJOR_ID_S").combotree('reload',urlc);
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
				<h2>学院综合管理—> 班级管理—> 增加班级</h2>
			</div>
			<div class="addtable">
				<form action="Clz_save" id="saveForm">
					<p class="title">班级资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="grad">*</span>班级号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="clazz.clazzID" id="CLAZZ_ID" maxlength="64" readonly="readonly" class="disinput">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">班级号不可改</div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>班级名称：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="clazz.clazzName" id="CLAZZ_NAME"
											maxlength="64" value="">
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
											maxlength="64" value="">
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
										<input type="text" name="clazz.collegeID" id="COLLEGE_ID"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的学院号（2位纯数字）<a href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate=" target="_blank">查找学院</a></div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>所属专业：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text"  id="MAJOR_ID_S"
											maxlength="64" value="">
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
										<input type="text" name="clazz.majorID" id="MAJOR_ID"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>
								</div>
								<div class="inputtxt">请输入合格的专业号（4位纯数字）<a href="<%=request.getContextPath()%>/Mjr_listAll.action?soMajor=&startDate=&endDate=" target="_blank">查找专业</a></div>
							</div></li>
							
						<li>
							<div class="mainth">
								<span class="red">*</span>创建日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="clazz.createDate" id="CREATE_DATE" maxlength="64"
										value="${nowDate}"> </span>
										<span class="errs"></span>
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>备注：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="clazz.remark" id="REMARK" rows="7" cols="32"></textarea>
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
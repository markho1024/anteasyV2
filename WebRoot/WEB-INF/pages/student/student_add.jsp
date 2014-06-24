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
		$("#CREATE_DATE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		
		$("#BIRTHDAY").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		
		$("#JION_DATE").datepicker({
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
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Std_listAll.action?currentPage=1";
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
             setClazz();
		});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#saveForm").validate({
			rules : {
				"student.studentName" : {
					rangelength : [ 2, 20 ],
					required:true
				},
				"student.collegeID":{
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
				"student.majorID":{
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
				},
				"student.clazzID":{
				    required:true,
				    digits : true,
					remote:{
							type:"post",
							url:"./Clz_isExist",
							ignoreSameValue:true,
							cache:false,
							dataType:"json",
							data:{
							    id: function() { return $("#CLAZZ_ID").val(); }
							}
							
					}
				},
				"student.createDate" : {
					required:true,
					date:true,
					betweendate:"#BIRTHDAY"
				},
				"student.graSchool" : {
					rangelength : [ 4, 20 ],
					required:true
				},
				"student.idCard" : {
					idcard :true,
					required:true
				},
				"student.birthday" : {
					required:true,
					date:true
				},
				"student.nation" : {
					rangelength : [ 1, 20 ],
					required:true
				},
				"student.sex" : {
					required:true
				},
				"student.hometown" : {
					rangelength : [ 2, 12 ],
					required:true
				},
				"student.jionDate" : {
					required:true,
					date:true,
					betweendate:"#BIRTHDAY"
				},
				"student.phone" : {
					phone:true,
					required:true
				},
				"student.email" : {
					email: true,
					required:true
				},
				"student.parentName" : {
					rangelength : [ 2, 20 ],
					required:true
				},
				"student.parentPhone" : {
					phone:true,
					required:true
				},
				"student.homeAddress" : {
					rangelength : [ 4, 60 ],
					required:true
				},
				"student.mailCode" : {
					mailcode:true,
					required:true
				},
				"student.homePhone" : {
					phone:true,
					required:true
				},
				"student.remark" : {
					maxlength : 60
				},

			},
			messages : {
				"student.collegeID" : {
					remote:"院系号不存在"
				},
				"student.majorID" : {
					remote:"专业号不存在"
				},
				"student.clazzID" : {
					remote:"班级号不存在"
				},
				"student.jionDate":{
				   betweendate:"加入日期必须大于出生日期"
				},
				"student.createDate":{
				   betweendate:"入学日期必须大于出生日期"
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
		$("#STUDENT_TYPE").combotree({
			url : "./DctJ_json?type=student_type",
			editable : false,
			width:164,
			onChange:function(){
			setNext();
			}
		});
		
		$("#PARTY").combotree({
			url : "./DctJ_json?type=party",
			editable : false,
			width:164
		});

	});
</script>

<script type="text/javascript">
function setMajor(){
    var voc = $("#COLLEGE_ID").val();
    var urlc= "./MjrJ_comboP?jsonType=ing&jsonValue="+voc;
   	$("#MAJOR_ID_S").combotree('setValue','');
	$("#MAJOR_ID_S").combotree('reload',urlc);
};
function setClazz(){
    var vom = $("#MAJOR_ID").val();
    var urlm= "./ClzJ_comboP?jsonType=ing&jsonValue="+vom;
   	$("#CLAZZ_ID_S").combotree('setValue','');
	$("#CLAZZ_ID_S").combotree('reload',urlm);
};

</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID_S").combotree({
			url : "./ClgJ_combo?jsonType=ing",
			editable : false,
			width:164,
			onChange:function(){
			        var voc = $("#COLLEGE_ID_S").combotree('getValue');
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
		
		$("#CLAZZ_ID_S").combotree({
			url : "./ClzJ_combo?jsonType=ing",
			editable : false,
			width:164,
			onChange:function(){
			        var vol = $("#CLAZZ_ID_S").combotree('getValue');
			        $("#CLAZZ_ID").val(vol);
			}
		});
		

	});
</script>


<script type="text/javascript">
function setNext() {
	     var vo = $("#COLLEGE_ID").val();
         var myDate = new Date();
         var date =  myDate.getFullYear(); 
         var kindV =$("#STUDENT_TYPE").combotree('getValue');
         if(vo!=null&&kindV!=null)
         {
              $.ajax({ 
                    type: "post", 
                    url: "./SdtJ_next?jsonValue="+vo+"&jsonDate="+date+"&jsonKind="+kindV, 
                    dataType: "json", 
                    success: function (data) { 
                               var no=data[0].next%100+1;
				               var college = parseInt(vo);
				               var kind = parseInt(kindV);
				               var next = date*1000000 + college*10000 +kind*1000 +no;
		                         $("#STUDENT_ID").val(next);
		                         $("#STUDENT_ID")[0].focus();
                    }, 
                    error: function (XMLHttpRequest, textStatus, errorThrown) { 
                    } 
              });
        }
}
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
				<h2>用户综合管理—> 学生管理—> 增加学生</h2>
			</div>
			<div class="addtable">
				<form action="Std_save" id="saveForm">
					<p class="title">学籍资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>学生号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="student.studentID" id="STUDENT_ID" maxlength="64"
										readonly="readonly"
										class="disinput"> </span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">学生号不可改</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>学生名称：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.studentName"
											id="STUDENT_NAME" maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">2-20位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>学生类型：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.studentType"
											id="STUDENT_TYPE" maxlength="64" value="">
									</span>
								</div>
							</div>
						</li>
						
						<li>
							<div class="mainth">
								<span class="red">*</span>所属院系：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" id="COLLEGE_ID_S"
											maxlength="64" value="">
									</span>
								</div>
							</div>
						</li>
						
						<li>
							<div class="mainth">
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.collegeID" id="COLLEGE_ID"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">请输入合格的学院号（2位纯数字）<a href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate=" target="_blank">查找学院</a></div>
							</div>
						</li>
						
						<li>
							<div class="mainth">
								<span class="red">*</span>所属专业：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" id="MAJOR_ID_S"
											maxlength="64" value="">
									</span>
							</div>
						</li>
						<li>
							<div class="mainth">
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.majorID" id="MAJOR_ID"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
							</div>
							<div class="inputtxt">请输入合格的专业号（4位纯数字）<a href="<%=request.getContextPath()%>/Mjr_listAll.action?soMajor=&startDate=&endDate=" target="_blank">查找专业</a></div>
						</li>
						
						<li>
							<div class="mainth">
								<span class="red">*</span>所属班级：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" id="CLAZZ_ID_S"
											maxlength="64" value="">
									</span>
								</div>
								
							</div>
						</li>
						<li>
							<div class="mainth">
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.clazzID" id="CLAZZ_ID"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">请输入合格的班级号（10位纯数字）<a href="<%=request.getContextPath()%>/Clz_listAll.action?soClazz=&startDate=&endDate=" target="_blank">查找班级</a></div>
							</div>
						</li>
												
						<li>
							<div class="mainth">
								<span class="red">*</span>入学日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"><input type="text"
										name="student.createDate" id="CREATE_DATE" maxlength="64"> </span>
										<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div>
						</li>	

						<li>
							<div class="mainth">
								<span class="red">*</span>毕业学校：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.graSchool" id="GRA_SCHOOL"
											maxlength="64" value="">
									</span>
								 <span class="errs"></span>	
								</div>
								<div class="inputtxt">4-20位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

					</ul>


					<p class="title">个人资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>性别：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="radio"><s:radio list="#{'1':'男','0':'女'}"
											name="student.sex" theme="simple" value="1"/>
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt"></div>
							</div></li>

						<li>
							<div class="mainth">
								<span class="red">*</span>身份证号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.idCard" id="ID_CARD"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">18位符合格式的字符串</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>生日日期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.birthday" id="BIRTHDAY"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div>
						</li>
						<li>
							<div class="mainth">
								<span class="red">*</span>民族：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.nation" id="NATION"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">1-20位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>籍贯：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.hometown" id="HOMETOWN"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">2-20位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>政治面貌：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.party" id="PARTY"
											maxlength="64" value="0">
									</span>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>加入时间：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.jionDate" id="JION_DATE"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">日期格式为“XXXX-XX-XX”</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>联系电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.phone" id="PHONE"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>电子邮箱：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.email" id="EMAIL"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">4-30位字母、数字或汉字（汉字算一位）组成，格式如“360@qq.com”</div>
							</div>
						</li>

					</ul>

					<p class="title">家庭资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>监护人名字：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.parentName" id="PARENT_NAME"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">2-20位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>监护人电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.parentPhone"
											id="PARENT_PHONE" maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>家庭地址：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.homeAddress"
											id="HOME_ADDRESS" maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">4-60位字母、数字或汉字（汉字算一位）组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>地址邮编：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.mailCode" id="MAILCODE"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">6位纯数字组成</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>家庭电话：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<input type="text" name="student.homePhone" id="HOME_PHONE"
											maxlength="64" value="">
									</span>
									<span class="errs"></span>	
								</div>
								<div class="inputtxt">手机号码与电话号码都可（必须加区号，区号与号码之间可用 - 隔开）</div>
							</div>
						</li>

					</ul>

					<p class="title">其他资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								备注
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input">
										<textarea name="student.remark" id="REMARK" rows="7" cols="32"></textarea>
									</span>
									<span class="errs"></span>	
								</div>
								<div class="textareatxt">4-60位字母、数字或汉字（汉字算两位）组成</div>
							</div>
						</li>
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
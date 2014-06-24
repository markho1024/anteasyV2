<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>My JSP 'open_list.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#ctrlBack").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Opn_listAll.action?currentPage=1";
						});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#saveForm").validate(
				{
					rules : {
						"open.remark" : {
							maxlength : 60
						},
						"open.collegeID" : {
							required : true,
							digits : true,
							remote : {
								type : "post",
								url : "./ClgJ_isExist",
								ignoreSameValue : true,
								cache : false,
								dataType : "json",
								data : {
									id : function() {
										return $("#COLLEGE_ID").val();
									}
								}

							}
						},
						"open.teacherID" : {
							required : true,
							digits : true,
							remote : {
								type : "post",
								url : "./TcrJ_isExist",
								ignoreSameValue : true,
								cache : false,
								dataType : "json",
								data : {
									id : function() {
										return $("#TEACHER_ID").val();
									}
								}

							}
						},
						"open.courseID" : {
							required : true,
							digits : true,
							remote : {
								type : "post",
								url : "./CrsJ_isExist",
								ignoreSameValue : true,
								cache : false,
								dataType : "json",
								data : {
									id : function() {
										return $("#COURSE_ID").val();
									}
								}

							}
						},
						"open.credit" : {
							required : true,
							number : true,
							range : [ 0, 50 ]
						},
						"open.period" : {
							required : true,
							range : [ 0, 1000 ]
						},
						"open.countLimit" : {
							required : true,
							range : [ 0, 1000 ]
						},
						"open.address" : {
							required : true,
							rangelength : [ 0, 20 ]
						}
					},
					messages : {
						"open.collegeID" : {
							remote : "学院号不存在"
						},
						"open.teacherID" : {
							remote : "教师号不存在"
						},
						"open.courseID" : {
							remote : "课程号不存在"
						}
					},
					errorPlacement : function(error, element) {
						error.appendTo(element.parent().parent().children(
								"span.errs"));
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
			changeMonth : true,
			changeYear : true
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#TABLE_WEEK").combotree({
			url : "./DctJ_json?type=table_week",
			width : 164,
			editable : false
		});
		$("#TABLE_DAY").combotree({
			url : "./DctJ_json?type=table_day",
			width : 164,
			editable : false
		});
		$("#COURSE_TYPE").combotree({
			url : "./DctJ_json?type=course_type",
			width : 164,
			editable : false
		});
		$("#SCORE_KIND").combotree({
			url : "./DctJ_json?type=score_kind",
			width : 164,
			editable : false
		});
		$("#PERIOD_TYPE").combotree({
			url : "./DctJ_json?type=period_type",
			width : 164,
			editable : false
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COURSE_ID").blur(function() {
			setNext();
		});
	});
</script>

<script type="text/javascript">
	function setNext() {
		var voc = $("#COURSE_ID").val();
		if (voc != null & voc != '') {
			$.ajax({
				type : "post",
				url : "./OpnJ_next?jsonValue=" + voc,
				dataType : "json",
				success : function(data) {
					var no = data[0].next;
					$("#ORDER_ID").val(no);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
				}
			});
		}
	}
</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID_S").combotree({
			url : "./ClgJ_combo?jsonType=ing",
			width : 164,
			editable : false,
			onChange : function() {
				var vo = $("#COLLEGE_ID_S").combotree('getValue');
				$("#COLLEGE_ID").val(vo);
				$("#COLLEGE_ID")[0].focus();
				$("#COLLEGE_ID")[0].blur();
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
				<h2>开课综合管理—> 开课管理—> 增加开课</h2>
			</div>
			<div class="addtable">
				<form action="Opn_save" id="saveForm">
					<p class="title">开课资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">
								<span class="red">*</span>课程号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.courseID" id="COURSE_ID" maxlength="64"> </span> <span
										class="errs"></span>
								</div>
								<div class="inputtxt">
									请输入合格的课程号（七位纯数字）<a
										href="<%=request.getContextPath()%>/Crs_listAll.action?soMajor=&startDate=&endDate="
										target="_blank">查找课程</a>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>课序号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.orderID" id="ORDER_ID" maxlength="64"
										class="disinput" readonly="readonly"> </span> <span
										class="errs"></span>
								</div>
								<div class="inputtxt">自动生成，可在修改页面修改</div>
							</div>
						</li>
					</ul>

					<p class="title">附属资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">
								<span class="red">*</span>学院号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										id="COLLEGE_ID_S" maxlength="64"> </span> <span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div>
						</li>
						<li>
							<div class="mainth"></div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.collegeID" id="COLLEGE_ID" maxlength="64">
									</span> <span class="errs"></span>
								</div>
								<div class="inputtxt">
									请输入合格的学院号（两位纯数字）<a
										href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate="
										target="_blank">查找学院</a>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>教师号：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.teacherID" id="TEACHER_ID" maxlength="64">
									</span> <span class="errs"></span>
								</div>
								<div class="inputtxt">
									请输入合格的教师号（七位纯数字）<a
										href="<%=request.getContextPath()%>/Tcr_listAll.action?soTeacher=&startDate=&endDate="
										target="_blank">查找教师</a>
								</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>课程类型：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.courseType" id="COURSE_TYPE" maxlength="64"
										value="1"> </span> <span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>考试类型：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.scoreKind" id="SCORE_KIND" maxlength="64"
										value="1"> </span> <span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div>
						</li>


						<li>
							<div class="mainth">
								<span class="red">*</span>学分：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.credit" id="CREDIT" maxlength="64"> </span> <span
										class="errs"></span>
								</div>
								<div class="inputtxt">请输入大于0，小于1000的纯数字（可小数）</div>
							</div>
						</li>


						<li>
							<div class="mainth">
								<span class="red">*</span>上课类型：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.periodType" id="PERIOD_TYPE" maxlength="64"
										value="1"> </span> <span class="errs"></span>
								</div>
								<div class="inputtxt">请输入大于0，小于1000的纯数字（可小数）</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>学时：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.period" id="PEROID" maxlength="64"> </span> <span
										class="errs"></span>
								</div>
								<div class="inputtxt">请输入大于0，小于1000的纯数字（可小数）</div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>人数：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.countLimit" id="COUNT_LIMIT" maxlength="64"> </span> <span
										class="errs"></span>
								</div>
								<div class="inputtxt">请输入大于0，小于1000的纯数字</div>
							</div>
						</li>


					</ul>

					<p class="title">上课资料</p>
					<ul class="maintable">

						<li>
							<div class="mainth">
								<span class="red">*</span>上课星期：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.tableWeek" id="TABLE_WEEK" maxlength="64" value="1">
									</span> <span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>上课时间：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.tableDay" id="TABLE_DAY" maxlength="64" value="1">
									</span> <span class="errs"></span>
								</div>
								<div class="inputtxt"></div>
							</div>
						</li>

						<li>
							<div class="mainth">
								<span class="red">*</span>上课地址：
							</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <input type="text"
										name="open.address" id="ADDRESS" maxlength="64"> </span> <span
										class="errs"></span>
								</div>
								<div class="inputtxt">不多于位小写字母、数字或汉字（汉字算两位）组成</div>
							</div>
						</li>

					</ul>
					<p class="title">其他资料</p>
					<ul class="maintable">
						<li>
							<div class="mainth">备注：</div>
							<div class="maintd">
								<div class="inputbox">
									<span class="input"> <textarea name="open.remark"
											id="REMARK" rows="7" cols="32"></textarea> </span> <span
										class="errs"></span>
								</div>
								<div class="textareatxt">4-60位小写字母、数字或汉字（汉字算两位）组成</div>
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
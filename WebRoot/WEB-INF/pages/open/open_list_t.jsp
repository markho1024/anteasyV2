<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/ant-tags" prefix="a"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title>My JSP 'main.jsp' starting page</title>
<s:include value="../main/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$("#navForm").validate({
			rules : {
				"soOpen.courseID" : {
					digits : true,
					rangelength  : [ 6, 7 ]
				},
				"soOpen.teacherID" : {
					digits : true,
					rangelength  : [ 7, 7 ]
				}
			},
			messages : {
				"soOpen.courseID" : {
					rangelength  :  "课程号为六到七位长度的数字"
				},
				"soOpen.teacherID" : {
					rangelength  :  "教师号为七位长度的数字"
				}
			},
			errorPlacement: function(error, element) {  
		        error.appendTo(element.parent().parent().children(".errs"));  
			}
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#updown").toggle(function() {
			$("table.navSearch").show();
		}, function() {
			$("table.navSearch").hide();
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COURSE_TYPE").combotree({
			url : "./DctJ_jsonAll?type=course_type",
			width:155,
			editable : false
		});
		$("#SCORE_KIND").combotree({
			url : "./DctJ_jsonAll?type=score_kind",
			width : 164,
			editable : false
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#navReset").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/OpnE_listT.action?soOpen=&startDate=&endDate=";
		});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID").combotree({
			url : "./ClgJ_combo?jsonType=all",
			width:155,
			editable : false,
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
				<h2>开课综合管理—> 开课管理</h2>
			</div>
			<div class="navSearch">
				<form action="OpnE_listT" id="navForm">
					<fieldset>
						<legend>
							<span> 检索条件<span id="updown" target="targetTable">[隐藏]</span>
							</span>
						</legend>

						<table cellpadding="0" cellspacing="0" class="navSearch"
							id="targetTable">

							<tr>
					    		<th>课程号</th>
								<td><p>
										<input type="text" id="COURSE_ID" 
											name="soOpen.courseID"
											value="${soOpen.courseID}" />
									</p>
									<p class="errs"></p>
								</td>
							
								<th>教师号</th>
								<td><p>
										<input type="text" id="TEACHER_ID" name="soOpen.teacherID"
											value="${soOpen.teacherID}" />
									</p>
									 <p class="errs"></p>
								</td>
							</tr>
							
							<tr>
								<th>所属院系</th>
								<td><p>
										<input type="text" id="COLLEGE_ID" name="soOpen.collegeID"
											value="${soOpen.collegeID}" />
									</p></td>
								<th>课程类型</th>
								<td><p>
									<input type="text" id="COURSE_TYPE" name="soOpen.courseType" 
											value="${soOpen.courseType}" />
									</p></td>
							</tr>
							<tr>
								<th>考试类型</th>
								<td><p>
									<input type="text" id="SCORE_KIND" name="soOpen.scoreKind" 
											value="${soOpen.scoreKind}" />
									</p></td>
								<th></th>
								<td><p></p></td>
							</tr>
						</table>

					</fieldset>
					<div class="ctrlButton">
						<input type="submit" class="buttons" id="navSubmit" value="检索">
						<input type="button" class="buttons" id="navReset" value="重置">
					</div>
					<s:hidden name="currentPage" value="1"/>
				</form>
			</div>
			<div class="resList">
				<table cellpadding="0" cellspacing="0"  class="listTable">
					<thead>
						<tr>
							<th class="no">序号</th>
							<th>课程号</th>
							<th>课序号</th>
							<th>课程名称</th>
							<th>开课学院</th>
							<th>开课教师</th>
							<th>课程类型</th>
							<th>考试类型</th>
							<th>学分</th>
							<th>备注</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
			                    <td><s:property value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" /> </td>
								<td><s:property value="#bean.courseID" />
								</td>
								<td><s:property value="#bean.orderID" /></td>
								<td><a:map type="courseName" name="course" code="#bean.courseID"/></td>
								<td><a:map type="collegeName" name="college" code="#bean.collegeID"/></td>
								<td><a:map type="teacherName" name="teacher" code="#bean.teacherID"/></td>
								<td><a:dict type="course_type"
										code="#bean.courseType" /></td>								
								<td><a:dict type="score_kind" code="#bean.scoreKind" /></td>
								<td><s:property value="#bean.credit" /></td>
								<td><s:property value="#bean.remark" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<div class="resPage">
				共
				<s:property value="pageBean.allRow" />
				条记录 共
				<s:property value="pageBean.totalPage" />
				页 <s:if test="%{pageBean.allRow!=0}">当前第
				<s:property value="pageBean.currentPage" />
				页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<s:if test="%{pageBean.currentPage == 1}">第一页 上一页 </s:if>

				<s:else>
					<a
						href="<%=request.getContextPath()%>/opn_listAll.action?currentPage=1">第一页</a>
					<a
						href="<%=request.getContextPath()%>/opn_listAll.action?currentPage=${pageBean.currentPage-1}">上一页</a>
				</s:else>

				<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
					<a
						href="<%=request.getContextPath()%>/opn_listAll.action?currentPage=${pageBean.currentPage+1}">下一页</a>
					<a
						href="<%=request.getContextPath()%>/opn_listAll.action?currentPage=${pageBean.totalPage}">最后一页</a>
				</s:if>

				<s:else>下一页 最后一页</s:else></s:if>
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

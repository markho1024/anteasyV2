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
		$("#navAdd").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/pln_add.action";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#navForm").validate({
			rules : {
				"soPlan.courseID" : {
				    digits : true,
					rangelength  : [ 5, 6 ]
				},
			},
			messages : {
				"soPlan.courseID" : {
					rangelength  :  "课程号为五到六位长度的数字"
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
		$("#navReset").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/PlnE_listT.action?soPlan=&startDate=&endDate=";
		});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#GRADE_ID").combotree({
		    url : "./PlnJ_comboGP?jsonType=all&jsonValue="+${loginStudent.studentType},
			width:154,
			editable : false
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
				<h2>课程综合管理—> 专业授课计划管理</h2>
			</div>
			<div class="navSearch">
				<form action="PlnE_listT" id="navForm">
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
										<input type="text" id="COURSE_ID" name="soPlan.courseID"
											value="${soPlan.courseID}" />
									</p>
									<p class="errs">
									</p>
								</td>
								<th>所属年级</th>
								<td><p>
										<input type="text" id="GRADE_ID" name="soPlan.gradeID"
											value="${soPlan.gradeID}" />
									</p></td>
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
				<table cellpadding="0" cellspacing="0"
					class="listTable">
					<thead>
						<tr>
							<th class="no">序号</th>

							<th>专业号</th>
							<th>专业名称</th>
							<th>课程号</th>
							<th>课程名称</th>
							<th>所属年级</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
								<td><s:property value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" /> </td>		
								<td><s:property value="#bean.majorID" /></td>
								<td><a:map type="majorName" name="major" code="#bean.majorID" /></td>
								<td><s:property value="#bean.courseID" /></td>
								<td><a:map type="courseName" name="course" code="#bean.courseID" />
								</td>
								<td><a:map type="gradeName" name="grade"
										code="#bean.gradeID" />
								</td>
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
						href="<%=request.getContextPath()%>/pln_listAll.action?currentPage=1">第一页</a>
					<a
						href="<%=request.getContextPath()%>/pln_listAll.action?currentPage=${pageBean.currentPage-1}">上一页</a>
				</s:else>

				<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
					<a
						href="<%=request.getContextPath()%>/pln_listAll.action?currentPage=${pageBean.currentPage+1}">下一页</a>
					<a
						href="<%=request.getContextPath()%>/pln_listAll.action?currentPage=${pageBean.totalPage}">最后一页</a>
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

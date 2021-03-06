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
			window.location.href = "<%=request.getContextPath()%>/ChcE_addC.action";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#navForm").validate({
			rules : {
				"soPick.studentID" : {
					digits : true,
					rangelength  : [ 10, 10 ]
				},
				"soOpen.courseID" : {
					digits : true,
					rangelength  : [ 7, 7]
				},
				"soOpen.orderID" : {
					digits : true,
					rangelength  : [ 0, 4]
				}
			},
			messages : {
				"soPick.studentID" : {
					rangelength  : "学生号必须为十位纯数字"
				},
				"soOpen.courseID" : {
					rangelength  :"课程号必须为七位纯数字"
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
			window.location.href = "<%=request.getContextPath()%>/ChcE_listC.action?soPick=&soOpen=&startDate=&endDate=";
		});

	});
</script>


<script type="text/javascript">
	function doDel(id, name) {
		$.messager.confirm('删除确认','你确认删除" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/ChcE_delC?pick.pickID="+id;
			};
		});
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
				<h2>选课综合管理—> 选课管理</h2>
			</div>
			<div class="navSearch">
				<form action="ChcE_listC" id="navForm">
					<fieldset>
						<legend>
							<span> 检索条件<span id="updown" target="targetTable">[隐藏]</span>
							</span>
						</legend>

						<table cellpadding="0" cellspacing="0" class="navSearch"
							id="targetTable">

							<tr>
								<th>学生号</th>
								<td><p>
										<input type="text" id="STUDENT_ID" name="soPick.studentID"
											value="${soPick.studentID}" />
									</p>
									 <p class="errs"></p>
								</td>
								<th>课程号</th>
								<td><p>
										<input type="text" id="COURSE_ID" 
											name="soOpen.courseID"
											value="${soOpen.courseID}" />
									</p>
									<p class="errs"></p>
								</td>
							</tr>
						</table>

					</fieldset>
					<div class="ctrlButton">
						<input type="submit" class="buttons" id="navSubmit" value="检索">
						<input type="button" class="buttons" id="navReset" value="重置">
						<input type="button" class="buttonlt" id="navAdd" value="增加">
					</div>
					<s:hidden name="currentPage" value="1"/>
				</form>
			</div>
			<div class="resList">
				<table cellpadding="0" cellspacing="0"  class="listTable">
					<thead>
						<tr>
							<th class="no">序号</th>
							<th>学生号</th>
							<th>课程号</th>
							<th>课序号</th>
							<th>教师</th>
							<th>教师名称</th>
							<th>上课人数</th>
							<th>已有人数</th>
							<th>操作</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
                               <td><s:property
										value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" />
								</td>
								<td><s:property value="#bean.studentID" />
								</td>
								<td>
								    <a:map type="courseID" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="orderID" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="teacherID" name="open" code="#bean.openID"/>
								</td>
								<td><a:deep type="teacherID|teacherName" name="open|teacher" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="countLimit" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="countNow" name="open" code="#bean.openID"/>
								</td>
								<td>
									<a href="javascript:doDel('<s:property value="#bean.pickID"/>','');">删除</a> 
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
						href="<%=request.getContextPath()%>/ChcE_listC.action?currentPage=1">第一页</a>
					<a
						href="<%=request.getContextPath()%>/ChcE_listC.action?currentPage=${pageBean.currentPage-1}">上一页</a>
				</s:else>

				<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
					<a
						href="<%=request.getContextPath()%>/ChcE_listC.action?currentPage=${pageBean.currentPage+1}">下一页</a>
					<a
						href="<%=request.getContextPath()%>/ChcE_listC.action?currentPage=${pageBean.totalPage}">最后一页</a>
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

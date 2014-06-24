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
			window.location.href = "<%=request.getContextPath()%>/ScrE_addC.action";
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
				"soPick.courseID" : {
					digits : true,
					rangelength  : [ 7, 7]
				},
				"startDate":{
			        date:true	
				},
				"endDate":{
			        date:true,
			        betweendate:"#START_DATE"
				}
			},
			messages : {
				"soPick.studentID" : {
					rangelength  : "学生号必须为十位纯数字"
				},
				"soPick.courseID" : {
					rangelength  :"课程号必须为七位纯数字"
				},
				"endDate":{
				    betweendate:"结束日期必须大于开始日期"
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
		$("#START_DATE").datepicker({
			showOn : "button",
			buttonImage : "./images/calendar.gif",
			buttonImageOnly : true,
			dateFormat : "yy-mm-dd",
			changeMonth: true,
			changeYear: true
		});
		$("#END_DATE").datepicker({
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
		$("#SCORE_TYPE").combotree({
			url : "./DctJ_jsonAll?type=score_type",
			width:155,
			editable : false
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#navReset").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/ScrE_listC.action?soPick=&isPass=&soOpen=&startDate=&endDate=";
		});

	});
</script>


<script type="text/javascript">
	function doDel(id, name) {
		$.messager.confirm('删除确认','你确认删除" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/ScrE_delC?pick.id="+id;
			};
		});
	  }
</script>

<script type="text/javascript">
	function doOff(id, name) {
		$.messager.confirm('取消确认','你确认取消" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/ScrE_offC?pick.id="+ id + "&offID=91";
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
				<h2>选课综合管理—> 成绩管理</h2>
			</div>
			<div class="navSearch">
				<form action="ScrE_listC" id="navForm">
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
									<p class="errs"></p></td>
								<th>课程号</th>
								<td><p>
										<input type="text" id="COURSE_ID" name="soOpen.courseID"
											value="${soOpen.courseID}" />
									</p>
									<p class="errs"></p></td>
							</tr>
							<tr>
								<th>开始日期</th>
								<td><p>
										<input type="text" id="START_DATE" name="startDate"
											value="${startDate}" />
									</p>
									<p class="errs"></p>
								</td>
								<th>结束日期</th>
								<td><p>
										<input type="text" id="END_DATE" name="endDate"
											value="${endDate}" />
									</p>
									<p class="errs"></p></td>
							</tr>
							<tr>
								<th>考试类型</th>
								<td><p>
										<input type="text" id="SCORE_TYPE" name="soPick.scoreType"
											value="${soPick.scoreType}" />
									</p>
								</td>
								<th>考试成绩</th>
								<td><p>
										<s:radio list="#{'1':'通过','9':'未通过','':'不限'}" name="isPass"
											theme="simple" value="#{isPass}" />
									</p></td>
							</tr>
							<tr>
								<th>是否录入成绩</th>
								<td><p>
										<s:radio list="#{'1':'未录','9':'已录','':'不限'}"
											name="soPick.logStatus" theme="simple"
											value="#{soPick.logStatus}" />
									</p></td>
								<th></th>
								<th><p></p>
								</th>
							</tr>
						</table>

					</fieldset>
					<div class="ctrlButton">
						<input type="submit" class="buttons" id="navSubmit" value="检索">
						<input type="button" class="buttonlt" id="navReset" value="重置">
					</div>
					<s:hidden name="currentPage" value="1"/>
				</form>
			</div>
			<div class="resList">
				<table cellpadding="0" cellspacing="0" class="listTable">
					<thead>
						<tr>
							<th class="no">序号</th>
							<th>学生号</th>
							<th>课程号</th>
							<th>课序号</th>
							<th>课程名称</th>
							<th>学分</th>
							<th>成绩</th>
							<th>考试日期</th>
							<th>操作</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
								<td><s:property
										value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" />
								</td>
								<td><s:property value="#bean.studentID" /></td>
								<td><a:map name="open" type="courseID" code="#bean.openID" />
								</td>
								<td><a:map name="open" type="orderID" code="#bean.openID" />
								</td>
								<td><a:deep name="open|course" type="courseID|courseName"
										code="#bean.openID" />
								</td>
								<td><a:map name="open" type="credit" code="#bean.openID" />
								</td>

								<td><s:if test="#bean.logStatus==9">
									    <a:dict type="score" code="#bean.score"/>
									</s:if> <s:if test="#bean.logStatus==1">
										<a:dict type="log_status" code="#bean.logStatus" />
									</s:if></td>

								<td><s:date name="#bean.examDate" format="yyyy-MM-dd" />
								</td>

								<td><a
									href="<%=request.getContextPath()%>/ScrE_loadC.action?id=${bean.pickID}">查看</a>
									<a
									href="<%=request.getContextPath()%>/ScrE_editC.action?id=${bean.pickID}">修改</a>
									<!-- 	<a href="javascript:doDel('<s:property value="#bean.pickID"/>','');">删除</a> 
								    <s:if test="#bean.status==1">
								    <a href="javascript:doOff('<s:property value="#bean.pickID"/>','<s:property value="#bean.pickID"/>');">取消</a> 
								    </s:if>--> <s:if test="#bean.logStatus==1">
										<a
											href="<%=request.getContextPath()%>/ScrE_logC.action?id=${bean.pickID}">录入成绩</a>
									</s:if></td>
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
				页
				<s:if test="%{pageBean.allRow!=0}">当前第
				<s:property value="pageBean.currentPage" />
				页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<s:if test="%{pageBean.currentPage == 1}">第一页 上一页 </s:if>

					<s:else>
						<a
							href="<%=request.getContextPath()%>/ScrE_listC.action?currentPage=1">第一页</a>
						<a
							href="<%=request.getContextPath()%>/ScrE_listC.action?currentPage=${pageBean.currentPage-1}">上一页</a>
					</s:else>

					<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
						<a
							href="<%=request.getContextPath()%>/ScrE_listC.action?currentPage=${pageBean.currentPage+1}">下一页</a>
						<a
							href="<%=request.getContextPath()%>/ScrE_listC.action?currentPage=${pageBean.totalPage}">最后一页</a>
					</s:if>

					<s:else>下一页 最后一页</s:else>
				</s:if>
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

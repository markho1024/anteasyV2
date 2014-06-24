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
			window.location.href = "<%=request.getContextPath()%>/OpnE_addC.action";
						});
	});
</script>


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
				},
				"lowCredit" : {
					range  : [ 0, 1000 ]
				},
				"highCredit" : {
					range  : [ 0, 1000 ]
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
		$("#TABLE_WEEK").combotree({
			url : "./DctJ_jsonAll?type=table_week",
			width:155,
			editable : false
		});
		$("#TABLE_DAY").combotree({
			url : "./DctJ_jsonAll?type=table_day",
			width:155,
			editable : false
		});
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
			window.location.href = "<%=request.getContextPath()%>/OpnE_listC.action?soOpen=&startDate=&endDate=&lowCredit=&highCredit=";
		});

	});
</script>


<script type="text/javascript">
	function doDel(id, name) {
		$.messager.confirm('删除确认','你确认删除" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/OpnE_delC?open.id="+id;
			};
		});
	  }
</script>

<script type="text/javascript">
	function doOff(id, name) {
		$.messager.confirm('取消确认','你确认取消" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/OpnE_offC?id="+id+"&offID=91";
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
				<h2>开课综合管理—> 开课管理</h2>
			</div>
			<div class="navSearch">
				<form action="OpnE_listC" id="navForm">
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
					    		<th>上课星期</th>
								<td><p>
										<input type="text" id="TABLE_WEEK" 
											name="soOpen.tableWeek"
											value="${soOpen.tableWeek}" />
									</p>
									<p class="errs"></p>
								</td>
							
								<th>上课时间</th>
								<td><p>
										<input type="text" id="TABLE_DAY" name="soOpen.tableDay"
											value="${soOpen.tableDay}" />
									</p>
									 <p class="errs"></p>
								</td>
							</tr>
							
							
							<tr>
								<th>最低分数</th>
								<td><p>
										<input type="text" id="LOW_OPEN" name="lowCredit" 
											value="${lowCredit}" />
									</p>
									 <p class="errs"></p></td>
								<th>最高分数</th>
								<td><p>
										<input type="text" id="HIGH_OPEN" name="highCredit" 
											value="${highCredit}" />
									</p>
									 <p class="errs"></p>
								</td>
							</tr>
							<tr>
								<th>学分类型</th>
								<td><p>
									<input type="text" id="COURSE_TYPE" name="soOpen.courseType" 
											value="${soOpen.courseType}" />
									</p></td>
								<th>考试类型</th>
								<td><p>
									<input type="text" id="SCORE_KIND" name="soOpen.scoreKind" 
											value="${soOpen.scoreKind}" />
									</p></td>
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
							<th>课程号</th>
							<th>课序号</th>
							<th>课程名称</th>
							<th>开课教师</th>
							<th>课程类型</th>
							<th>考试类型</th>
							<th>学分</th>
							<th>上课时间</th>
							<th>状态</th>
							<th>操作</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
								<td><s:property value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" /> </td>
								<td><s:property value="#bean.courseID" />
								</td>
								<td><s:property value="#bean.orderID" /></td>
								<td><a:map type="courseName" name="course" code="#bean.courseID"/></td>
								<td><a:map type="teacherName" name="teacher" code="#bean.teacherID"/></td>
								<td><a:dict type="score_kind" code="#bean.scoreKind" /></td>								
								<td><a:dict type="course_type" code="#bean.courseType" /></td>								
								
								<td><s:property value="#bean.credit" /></td>
								<td><s:property value="#bean.tableWeek"/>-<s:property value="#bean.tableDay"/></td>
								<td><a:dict type="status"
										code="#bean.status" />
								
								<td><a
									href="<%=request.getContextPath()%>/OpnE_loadC.action?id=${bean.openID}">查看</a>
									<a
									href="<%=request.getContextPath()%>/OpnE_editC.action?id=${bean.openID}">修改</a>
								<!-- 	<a href="javascript:doDel('<s:property value="#bean.openID"/>','');">删除</a>  -->
								    <s:if test="#bean.status==1">
								    <a href="javascript:doOff('<s:property value="#bean.openID"/>','<s:property value="#bean.openID"/>');">取消</a> 
								    </s:if>
								
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
						href="<%=request.getContextPath()%>/OpnE_listC.action?currentPage=1">第一页</a>
					<a
						href="<%=request.getContextPath()%>/OpnE_listC.action?currentPage=${pageBean.currentPage-1}">上一页</a>
				</s:else>

				<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
					<a
						href="<%=request.getContextPath()%>/OpnE_listC.action?currentPage=${pageBean.currentPage+1}">下一页</a>
					<a
						href="<%=request.getContextPath()%>/OpnE_listC.action?currentPage=${pageBean.totalPage}">最后一页</a>
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

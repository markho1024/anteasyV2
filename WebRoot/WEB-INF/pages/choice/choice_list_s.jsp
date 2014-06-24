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
			window.location.href = "<%=request.getContextPath()%>/pck_add.action";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#navForm").validate({
			rules : {
				"soOpen.studentID" : {
					digits : true,
					rangelength  : [ 10, 10 ]
				},
				"soOpen.courseID" : {
					digits : true,
					rangelength  : [ 6, 7]
				},
				"soOpen.orderID" : {
					digits : true,
					rangelength  : [ 0, 4]
				}
			},
			messages : {
				"soOpen.studentID" : {
					rangelength  : "学生号必须为十位纯数字"
				},
				"soOpen.courseID" : {
					rangelength  :"课程号必须为六到七位纯数字"
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
			window.location.href = "<%=request.getContextPath()%>/ChcE_choiceS.action?soPick=&soOpen=&startDate=&endDate=";
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
				<h2>选课综合管理—> 查看本学期选课</h2>
			</div>
		   <div id="timetables">
			<table class="timetable"  cellspacing="1" cellpadding="1">
		       <tr class="tabletitle">
		           <td></td>
		           <td>星期一</td>
		           <td>星期二</td>
		           <td>星期三</td>
		           <td>星期四</td>
		           <td>星期五</td>
		           <td>星期六</td>
		           <td>星期日</td>
		       </tr>
		       <s:iterator value="timeTable.day" status="sd" id="dNo">
			       <tr class="tablev">
			           <td class="ths">第<s:property value="#sd.index+1"/>大节</td>
			           <s:iterator value="#dNo.week" status="sw" id="wNo">
		               <td class="tds"> 
		               <s:if test="#dNo!=null">
		                <s:iterator value="#wNo.course" status="sd" id="cNo"><p>
				               <a:deep type="courseID|courseName" name="open|course" code="#cNo.openID"/>
				               (<a:deep type="courseType|course_type" name="open|@" code="#cNo.openID"/>)
				               <a:deep type="teacherID|teacherName" name="open|teacher" code="#cNo.openID"/></p>
		               </s:iterator>
                        </s:if>
		               </td>
			           </s:iterator>
			       </tr>
		       </s:iterator>
		     </table>
		     </div>
			<div class="navSearch">
				<form action="ChcE_choiceS" id="navForm">
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
								
								<th>课序号</th>
								<td><p>
										<input type="text" id="ORDER_ID" 
											name="soOpen.orderID"
											value="${soOpen.orderID}" />
									</p>
									<p class="errs"></p>
								</td>
							</tr>
							
							<tr>
								<th>课程类型</th>
								<td><p>
									<input type="text" id="COURSE_TYPE" name="soOpen.courseType" 
											value="${soOpen.courseType}" />
									</p></td>

								<th>是否录入成绩</th>
								<td><p>
										<s:radio list="#{'1':'未录','9':'已录','':'不限'}"
											name="soPick.logStatus" theme="simple"
											value="#{soPick.logStatus}" />
									</p>
								</td>
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
				<table cellpadding="0" cellspacing="0"  class="listTable">
					<thead>
						<tr>
							<th class="no">序号</th>
							<th>课程名称</th>
							<th>课程号</th>
							<th>课序号</th>
							<th>课程属性</th>
							<th>上课地址</th>
							<th>上课时间</th>
							<th>上课周次</th>
							<th>操作</th>
					</thead>
					<tbody>
		 				<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
                                <td><s:property value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" /> </td>
								<td><a:deep type="courseID|courseName" name="open|course" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="courseID" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="orderID" name="open" code="#bean.openID"/>
								</td>
								<td><a:deep type="courseType|course_type" name="open|@" code="#bean.openID"/>
								</td>
								
								<td>
								    <a:map type="address" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="tableWeek" name="open" code="#bean.openID"/>-
								    <a:map type="tableDay" name="open" code="#bean.openID"/>
								</td>
								<td><a:deep type="periodType|period_type" name="open|@" code="#bean.openID"/>
								</td>
								<td><a
									href="<%=request.getContextPath()%>/OpnE_loadT.action?id=${bean.pickID}" target="_blank">查看</a>
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
						href="<%=request.getContextPath()%>/pck_listAll.action?currentPage=1">第一页</a>
					<a
						href="<%=request.getContextPath()%>/pck_listAll.action?currentPage=${pageBean.currentPage-1}">上一页</a>
				</s:else>

				<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
					<a
						href="<%=request.getContextPath()%>/pck_listAll.action?currentPage=${pageBean.currentPage+1}">下一页</a>
					<a
						href="<%=request.getContextPath()%>/pck_listAll.action?currentPage=${pageBean.totalPage}">最后一页</a>
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

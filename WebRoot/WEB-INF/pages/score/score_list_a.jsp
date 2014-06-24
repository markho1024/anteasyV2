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
			window.location.href = "<%=request.getContextPath()%>/ScrE_scoreAll.action?soPick=&soOpen=&isPass=";
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
				<h2>成绩管理—> 查看所有成绩</h2>
			</div>
			<div class="navSearch">
				<form action="ScrE_scoreAll" id="navForm">
					<fieldset>
						<legend>
							<span> 检索条件<span id="updown" target="targetTable">[隐藏]</span>
							</span>
						</legend>

						<table cellpadding="0" cellspacing="0" class="navSearch"
							id="targetTable">
							<tr>
								<th>课程属性</th>
								<td><p>
									<input type="text" id="COURSE_TYPE" name="soOpen.courseType" 
											value="${soOpen.courseType}" />
									</p></td>
							
								<th>是否通过</th>
								<td><p>
										<s:radio list="#{'1':'已通过','9':'尚未过','':'不限'}"
											name="isPass" theme="simple"
											value="#{isPass}" />
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
							<th>课程号</th>
							<th>课序号</th>
							<th>课程名称</th>
							<th>学分</th>
							<th>课程属性</th>
							<th>考试成绩</th>
							<th>录入时间</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
                              <td><s:property value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" /> </td>
								<td>
								    <a:map type="courseID" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="orderID" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:deep type="courseID|courseName" name="open|course" code="#bean.openID"/>
								</td>
								<td>
								    <a:map type="credit" name="open" code="#bean.openID"/>
								</td>
								<td>
								    <a:deep type="courseType|course_type" name="open|@" code="#bean.openID"/>
								</td>
								<td><s:if test="#bean.logStatus==9">
									    <a:dict type="score" code="#bean.score"/>
									</s:if> <s:if test="#bean.logStatus==1">
										<a:dict type="log_status" code="#bean.logStatus" />
									</s:if></td>
								<td><s:date name="#bean.examDate" format="yyyy-MM-dd" /></td>
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

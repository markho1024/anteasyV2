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
			window.location.href = "<%=request.getContextPath()%>/Mjr_add.action";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#navForm").validate({
			rules : {
				"soMajor.majorID" : {
					digits : true,
					rangelength  : [ 0, 4 ]
				},
				"soMajor.majorName" : {
					maxlength : 20
				},
				"soMajor.collegeID" : {
					digits:true,
					rangelength:[0,2]
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
		$("#navReset").bind("click", function() {
			window.location.href = "<%=request.getContextPath()%>/Mjr_listAll.action?soMajor=&startDate=&endDate=";
		});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#COLLEGE_ID_S").combotree({
			url : "./ClgJ_combo?jsonType=all",
			width:155,
			editable : false,
			onChange:function(){
		           var vo = $("#COLLEGE_ID_S").combotree('getValue');
                   $("#COLLEGE_ID").val(vo);
			}
		});
	});
</script>

<script type="text/javascript">
	function doDel(id, name) {
		$.messager.confirm('删除确认','你确认删除" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/Mjr_del?major.majorID="+id;
							};
						});
	}
</script>
<script type="text/javascript">
	function doOff(id, name) {
		$.messager.confirm('取消确认','你确认取消" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/Mjr_off?id="+id+"&offID=91";
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
				<h2>学院综合管理—> 专业管理</h2>
			</div>
			<div class="navSearch">
				<form action="Mjr_query" id="navForm">
					<fieldset>
						<legend>
							<span> 检索条件<span id="updown" target="targetTable">[隐藏]</span>
							</span>
						</legend>

						<table cellpadding="0" cellspacing="0" class="navSearch"
							id="targetTable">

							<tr>
								<th>专业号</th>
								<td><p>
										<input type="text" id="MAJOR_ID" name="soMajor.majorID"
											value="${soMajor.majorID}" />
									</p>
									<p class="errs">
									</p>
								</td>
								<th>专业名称</th>
								<td><p>
										<input type="text" id="MAJOR_NAME" name="soMajor.majorName"
											value="${soMajor.majorName}" />
									</p>
									<p class="errs">
									</p>
								</td>
							</tr>

							<tr>
								<th>所属院系</th>
								<td><p>
										<input type="text" id="COLLEGE_ID_S"
											value="${soMajor.collegeID}" />
									</p></td>
								<th>所属院系号</th>
								<td><p>
										<input type="text" id="COLLEGE_ID" name="soMajor.collegeID"
											value="${soMajor.collegeID}" />
									</p>
									<p class="errs">
								</td>
							</tr>
							
							<tr>
								<th>开始日期</th>
								<td><p>
										<input type="text" id="START_DATE" name="startDate"
											value="${startDate}" />
									</p>
									<p class="errs">
									</p>
								</td>
								<th>结束日期</th>
								<td><p>
										<input type="text" id="END_DATE" name="endDate"
											value="${endDate}" />
									</p>
									<p class="errs">
									</p>
								</td>
							</tr>
							
							
							<tr>
								<th>状态</th>
								<td><p>
										<s:radio list="#{'1':'正常','91':'取消','':'不限'}"
											name="soMajor.status" theme="simple"
											value="#{soMajor.status}" />
									</p>
								</td>
								<th></th>
								<td></td>
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
				<table cellpadding="0" cellspacing="0"
					class="listTable">
					<thead>
						<tr>
							<th class="no">序号</th>

							<th>专业号</th>
							<th>专业名称</th>
							<th>所属院系号</th>
							<th>所属院系</th>
							<th>创建日期</th>
							<th>状态</th>
							<th>操作</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
								<td><s:property
										value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" />
								</td>
								<td><s:property value="#bean.majorID" /></td>
								<td><s:property value="#bean.majorName" /></td>
								<td><s:property value="#bean.collegeID" /></td>
								<td><a:map type="collegeName" name="college" code="#bean.collegeID" />
								</td>
								<td><s:date name="#bean.createDate"
										format="yyyy-MM-dd" />
								</td>
								<td><a:dict type="status"
										code="#bean.status" />
								</td>
								<td><a
									href="<%=request.getContextPath()%>/Mjr_load.action?id=${bean.majorID}">查看</a>
									<a
									href="<%=request.getContextPath()%>/Mjr_edit.action?id=${bean.majorID}">修改</a>
									<!-- <a href="javascript:doDel('<s:property value="#bean.majorID"/>','<s:property value="#bean.collegeID"/>');">删除</a> -->
									<s:if test="#bean.status==1">
								    <a href="javascript:doOff('<s:property value="#bean.majorID"/>','<s:property value="#bean.majorID"/>');">取消</a> 
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
						href="<%=request.getContextPath()%>/Mjr_listAll.action?currentPage=1">第一页</a>
					<a
						href="<%=request.getContextPath()%>/Mjr_listAll.action?currentPage=${pageBean.currentPage-1}">上一页</a>
				</s:else>

				<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
					<a
						href="<%=request.getContextPath()%>/Mjr_listAll.action?currentPage=${pageBean.currentPage+1}">下一页</a>
					<a
						href="<%=request.getContextPath()%>/Mjr_listAll.action?currentPage=${pageBean.totalPage}">最后一页</a>
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

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
			window.location.href = "<%=request.getContextPath()%>/StdE_addC.action";
						});
	});
</script>


<script type="text/javascript">
	$(function() {
		$("#navForm").validate({
			rules : {
				"soStudent.studentID" : {
					digits : true,
					rangelength : [10 , 10 ]
				},
				"soStudent.studentName" : {
					rangelength : [ 0, 20 ]
				},
				"startDate":{
			        date:true	
				},
				"endDate":{
			        date:true,
			        betweendate:"#START_DATE"
				},
				"soStudent.majorID" : {
					digits : true,
					rangelength : [ 0, 4 ]
				},
				"soStudent.clazzID" : {
					digits : true,
					rangelength : [ 0, 10 ]
				}
			},
			messages : {
				"soStudent.studentID" : {
					rangelength : "学生号为十位长度的数字"
				},
				"endDate":{
				    betweendate:"结束日期必须大于开始日期"
				}
			},
			errorPlacement: function(error, element) {
	             error.appendTo( element.parent().next() );
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
			window.location.href = "<%=request.getContextPath()%>/StdE_listC.action?soStudent=&startDate=&endDate=";
		});

	});
</script>

<script type="text/javascript">
	$(function() {
  		$("#MAJOR_ID_S").combotree({
			url : "./MjrJ_comboP?jsonType=all&jsonValue="+${loginUser.collegeID},
			editable : false,
			width:155,
			onChange:function(){
			        var vo = $("#MAJOR_ID_S").combotree('getValue');
			         $("#MAJOR_ID").val(vo);
					var url= "./ClzJ_comboP?jsonType=all&jsonValue="+vo;
			        $("#CLAZZ_ID_S").combotree('setValue','');
			        $("#CLAZZ_ID_S").combotree('reload',url);
			}
	    }); 
  		$("#CLAZZ_ID_S").combotree({
			url : "./ClzJ_comboC?jsonType=all&jsonValue="+${loginUser.collegeID},
			editable : false,
			width:155,
			onChange:function(){
			        var vo = $("#CLAZZ_ID_S").combotree('getValue');
			         $("#CLAZZ_ID").val(vo);
            }
	    }); 
  		$("#STUDENT_TYPE").combotree({
			url : "./DctJ_jsonAll?type=student_type",
			editable : false,
			width:155
	    }); 
	});
</script>

<script type="text/javascript">
	function doDel(id, name) {
		$.messager.confirm('删除确认','你确认删除" ' + name + ' "吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%>/StdE_delC?student.id="+id;
			};
		});
	  }
</script>

<script type="text/javascript">
	function doOff(id, name) {
		$.messager.confirm('退学确认','你确认" ' + name + ' "退学吗?',function(bt) {
			if (bt) {
				window.location.href = "<%=request.getContextPath()%> /StdE_offC?student.id=" + id + "&offID=96";
							}
							;
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
				<h2>用户综合管理—> 学生管理</h2>
			</div>
			<div class="navSearch">
				<form action="StdE_listC" id="navForm">
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
										<input type="text" id="STUDENT_ID" name="soStudent.studentID"
											value="${soStudent.studentID}" />
									</p>
									<p id="error">
									</p>
								</td>
								<th>学生名称</th>
								<td><p>
										<input type="text" id="STUDENT_NAME"
											name="soStudent.studentName" value="${soStudent.studentName}" />
									</p>
									<p id="error">
									</p>
								</td>
							</tr>

							<tr>
								<th>所属专业</th>
								<td><p>
										<input type="text" id="MAJOR_ID_S"
											value="${soStudent.majorID}" />
									</p></td>
								<th>所属专业号</th>
								<td><p>
										<input type="text" id="MAJOR_ID" name="soStudent.majorID"
											value="${soStudent.majorID}" />
									</p>
									<p id="error">
									</p>
								</td>
							</tr>

							<tr>
								<th>所属班级</th>
								<td><p>
										<input type="text" id="CLAZZ_ID_S"
											value="${soStudent.clazzID}" />
									</p></td>
								<th>所属班级号</th>
								<td><p>
										<input type="text" name="soStudent.clazzID" id="CLAZZ_ID"
											value="${soStudent.clazzID}" />
									</p>
									<p id="error">
									</p>
								</td>
							</tr>

							<tr>
								<th>开始日期</th>
								<td><p>
										<input type="text" id="START_DATE" name="startDate"
											value="${startDate}" />
									</p>
									<p id="error">
									</p>
								</td>
								<th>结束日期</th>
								<td><p>
										<input type="text" id="END_DATE" name="endDate"
											value="${endDate}" />
									</p>
									<p id="error">
									</p>
								</td>
							</tr>
							
							<tr>
								<th>学生类型</th>
								<td><p>
										<input type="text" id="STUDENT_TYPE"
											name="soStudent.studentType"
											value="${soStudent.studentType}" />
									</p></td>
								<th>状态</th>
								<td><p>
										<s:radio list="#{'1':'正常','96':'已退学','':'不限'}"
											name="soStudent.status" theme="simple"
											value="#{soStudent.status}" />
									</p>
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
				<table cellpadding="0" cellspacing="0" class="listTable">
					<thead>
						<tr>
							<th align="center">序号</th>

							<th>学生号</th>
							<th>学生姓名</th>
						<!-- 			<th>所属院系</th>
										<th>所属专业</th>
							<th>所属班级</th>
	 -->
							<th>学生类型</th>
							<th>入学日期</th>
							<th>状态</th>
							<th>操作</th>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list" status="st" id="bean">
							<tr <s:if test="!#st.odd">class="trodd"</s:if>>
								<td><s:property
										value="%{(pageBean.currentPage-1)*pageCount+#st.index+1}" />
								</td>
								<td><s:property value="#bean.studentID" /></td>
								<td><s:property value="#bean.studentName" /></td>
							<!-- 			<td><a:map type="collegeName" name="college"
										code="#bean.collegeID" />
								</td>
												<td><a:map type="majorID" name="major" 
										code="#bean.majorID" /></td>
								<td><a:map type="clazzID" name="clazz"
										code="#bean.clazzID" /></td>
		 -->
								<td><a:dict type="student_type" code="#bean.studentType" />
								</td>

								<td><s:date name="#bean.createDate" format="yyyy-MM-dd" />
								</td>
								<td><a:dict type="status" code="#bean.status" />
								</td>
								<td><a
									href="<%=request.getContextPath()%>/StdE_loadC.action?id=${bean.studentID}">查看</a>
									<a
									href="<%=request.getContextPath()%>/StdE_editC.action?id=${bean.studentID}">修改</a>
									<!-- <a
									href="javascript:doDel('<s:property value="#bean.studentID"/>','<s:property value="#bean.studentID"/>');">删除</a>
								    --> <s:if test="#bean.status==1">
										<a
											href="javascript:doOff('<s:property value="#bean.studentID"/>','<s:property value="#bean.studentID"/>');">退学</a>
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
							href="<%=request.getContextPath()%>/StdE_listAll.action?currentPage=1">第一页</a>
						<a
							href="<%=request.getContextPath()%>/StdE_listAll.action?currentPage=${pageBean.currentPage-1}">上一页</a>
					</s:else>

					<s:if test="%{pageBean.currentPage !=pageBean.totalPage}">
						<a
							href="<%=request.getContextPath()%>/StdE_listAll.action?currentPage=${pageBean.currentPage+1}">下一页</a>
						<a
							href="<%=request.getContextPath()%>/StdE_listAll.action?currentPage=${pageBean.totalPage}">最后一页</a>
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

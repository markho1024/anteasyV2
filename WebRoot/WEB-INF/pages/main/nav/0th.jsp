<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="branch"><p class="title">用户综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Usr_listAll.action?soUser=&startDate=&endDate=">账号管理</a>
			</div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Tcr_listAll.action?soTeacher=&startDate=&endDate=">教师管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Std_listAll.action?soStudent=&startDate=&endDate=">学生管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">学院综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate=">学院管理</a>
			</div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Mjr_listAll.action?soMajor=&startDate=&endDate=">专业管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Clz_listAll.action?soClazz=&startDate=&endDate=">班级管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">课程综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Crs_listAll.action?soCourse=&startDate=&endDate=">课程管理</a>
			</div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Pln_listAll.action?soPlan=&startDate=&endDate=">专业计划管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Opn_listAll.action?soOpen=&startDate=&endDate=&lowCredit=&highCredit=">开课管理</a>
			</div></li>

		</ul>
	</div>

	<div class="branch"><p class="title">选课综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Chc_listAll.action?soPick=&startDate=&endDate=">选课管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Scr_listAll.action?soPick=&pass=&soOpen=&startDate=&endDate=">成绩管理</a>
			</div></li>

		</ul>
	</div>

	<div class="branch"><p class="title">其他扩展管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/Msg_listAll.action?soMessage=&startDate=&endDate=">站内信管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Hlp_help.action">帮助</a>
			</div></li>
		</ul>
	</div>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="branch"><p class="title">用户综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/UsrE_listC.action?soUser=&startDate=&endDate=">账号管理</a>
			</div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/TcrE_listC.action?soTeacher=&startDate=&endDate=">教师管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/StdE_listC.action?soStudent=&startDate=&endDate=">学生管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">学院综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/MjrE_listC.action?soMajor=&startDate=&endDate=">专业管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/ClzE_listC.action?soClazz=&startDate=&endDate=">班级管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">课程综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/CrsE_listC.action?soCourse=&startDate=&endDate=">课程管理</a>
			</div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/PlnE_listC.action?soPlan=&startDate=&endDate=">专业计划管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/OpnE_listC.action?soOpen=&startDate=&endDate=&lowCredit=&highCredit=">开课管理</a>
			</div></li>

		</ul>
	</div>

	<div class="branch"><p class="title">选课综合管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/ChcE_listC.action?soPick=&soOpen=&startDate=&endDate=">选课管理</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/ScrE_listC.action?soPick=&soOpen=&pass=&soOpen=&startDate=&endDate=">成绩管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">站内信管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/MsgE_write.action?message=">写信</a></div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/MsgE_listS.action?soMessage=&startDate=&endDate=">发件箱</a></div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/MsgE_listG.action?soMessage=&startDate=&endDate=">收件箱</a></div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">其他扩展管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Hlp_help.action">帮助</a>
			</div></li>
		</ul>
	</div>

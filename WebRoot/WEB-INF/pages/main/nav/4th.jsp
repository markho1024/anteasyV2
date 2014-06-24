<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<ul class="tree">
	<li class="branch"><p class="title">用户账号管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/UsrE_editPw.action">修改密码信息</a></div></li>
		</ul>
	</li>
	<li class="branch"><p class="title">学生信息管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/StdE_loadT.action">查看个人信息</a></div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/StdE_editT.action">修改个人信息</a></div></li>
		</ul>
	</li>
	
	<li class="branch"><p class="title">选课管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/ChcE_choose.action">增加选课信息</a></div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/ChcE_choiceS.action?soOpen=&soPick=&startDate=&endDate=">查看本学期选课</a></div></li>
		 	<li><div class="cell"><a href="<%=request.getContextPath()%>/OpnE_listT.action?soOpen=&startDate=&endDate=">所有开课信息</a></div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/PlnE_listT.action?soPlan=&startDate=&endDate=">专业计划</a></div></li>
		</ul>
	</li>
	
	<li class="branch"><p class="title">成绩管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/ScrE_scoreS.action?soPick=&soOpen=&isPass=">查看本学期成绩</a></div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/ScrE_scoreAll.action?soPick=&soOpen=&isPass=">查看所有成绩</a></div></li>
		</ul>
	</li>
	
	<li class="branch"><p class="title">站内信管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/MsgE_write.action?message=">写信</a></div></li>
			<li><div class="cell"><a href="<%=request.getContextPath()%>/MsgE_listS.action?soMessage=&startDate=&endDate=">发件箱</a></div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/MsgE_listG.action?soMessage=&startDate=&endDate=">收件箱</a></div></li>
		</ul>
	</li>
	
	<li class="branch"><p class="title">其他管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Hlp_help.action">帮助</a>
			</div></li>
		</ul>
	</li>
	
</ul>

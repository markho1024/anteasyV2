<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="branch"><p class="title">用户账号管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/UsrE_editPw.action">修改密码信息</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">教师信息管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/TcrE_loadT.action">查看个人信息</a></div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/TcrE_editT.action">修改个人信息</a></div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">选课管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/ChcE_choiceT.action?soPick=&soOpen=&startDate=&endDate=">查看选课信息</a>
		</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">成绩管理</p>
		<ul class="shelf">
			<li><div class="cell"><a href="<%=request.getContextPath()%>/ScrE_scoreT.action?soPick=&soOpen=&startDate=&endDate=&isPass=">查看成绩信息</a>
			</div></li>
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/OpnE_listB.action?soOpen=&startDate=&endDate=">批量录入成绩</a>
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

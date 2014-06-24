<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="branch"><p class="title">用户综合管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Usr_listAll.action?soUser=&startDate=&endDate=">账号管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">学院综合管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Clg_listAll.action?soCollege=&startDate=&endDate=">学院管理</a>
			</div></li>
		</ul>
	</div>

	<div class="branch"><p class="title">选课综合管理</p>
		<ul class="shelf">
			<li><div class="cellt"><a href="<%=request.getContextPath()%>/Prm_edit?pageCount=&choiceOne=&choiceTwo=&logOne=&logTwo=">参数管理</a>
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

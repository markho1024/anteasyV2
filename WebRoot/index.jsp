<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% 
	if (request.getSession().getAttribute("loginUser") == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp"); 
	} else {
		response.sendRedirect(request.getContextPath() + "/logined.action"); 
	}
%>

package com.anteasy.struts2.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class DictTag extends ComponentTagSupport {
	private static final long serialVersionUID = 1L;
	private String type;
	private String code;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Component getBean(ValueStack stack, HttpServletRequest req,
			HttpServletResponse res) {
		return new Dicts(stack, req, res);
	}

	protected void populateParams() {
		super.populateParams();
		Dicts dicts = (Dicts) this.component;
		dicts.setType(type);
		dicts.setCode(code);
	}

}

package com.anteasy.struts2.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class DeepTag extends ComponentTagSupport {
	private static final long serialVersionUID = 1L;
	private String type;
	private String code;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Component getBean(ValueStack stack, HttpServletRequest req,
			HttpServletResponse res) {
		return new Deeps(stack, req, res);
	}

	protected void populateParams() {
		super.populateParams();
		Deeps deeps = (Deeps) this.component;
		deeps.setType(type);
		deeps.setCode(code);
		deeps.setName(name);
	}

}

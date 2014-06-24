package com.app.expand.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.app.expand.service.ParamService;
import com.app.util.Params;
import com.opensymphony.xwork2.ActionSupport;

@Controller("paramAction")
public class ParamAction extends ActionSupport {

	private Params params;

	private ParamService paramService;

	public Params getParams() {
		return params;
	}

	public ParamService getParamService() {
		return paramService;
	}

	@Autowired
	public void setParamService(ParamService paramService) {
		this.paramService = paramService;
	}

	public void setParams(Params params) {
		this.params = params;
	}

	public String edit() {
		this.params = this.paramService.load();
		return "edit";
	}

	public String update() {
		this.paramService.update(this.params);
		return "update";
	}

	public Params loadParams() {
		return this.paramService.load();
	}

}

package com.app.expand.action;

import org.springframework.stereotype.Controller;

import com.anteasy.struts2.BaseAction;

@Controller("helpAction")
public class HelpAction extends BaseAction {
	public String help() {
		return "help";
	}
}

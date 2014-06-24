package com.app.expand.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.SqlUtil;
import com.orm.pojo.User;
import com.anteasy.struts2.BaseAction;
import com.app.expand.service.MessageService;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Message;

@Controller("messageAction")
public class MessageAction extends BaseAction {
	private Message message;

	private MessageService messageService;
	private Message soMessage;

	private String jsonType;
	private String jsonValue;

	/* getter和setter */

	@Autowired
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public String getJsonValue() {
		return jsonValue;
	}

	public void setJsonValue(String jsonValue) {
		this.jsonValue = jsonValue;
	}

	public String getJsonType() {
		return jsonType;
	}

	public void setJsonType(String jsonType) {
		this.jsonType = jsonType;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Message getSoMessage() {
		return soMessage;
	}

	public void setSoMessage(Message soMessage) {
		this.soMessage = soMessage;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.message = (Message) this.messageService.load(new Message(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.messageService.delete(this.message);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.message = (Message) this.messageService.load(new Message(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.message.setCreateDate(this.getNowDate());
		this.message.setIsRead("1");
		this.message.setIsReply("2");
		this.message.setStatus("1");
		this.messageService.save(this.message);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.messageService.update(this.message);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Message messageLoad = (Message) this.messageService.load(new Message(), this.id);
		messageLoad.setStatus(offID);
		this.messageService.update(messageLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.messageService.queryForPage(this.getPageCount(),
				this.currentPage, new Message(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getMessageService().queryForPage(
				this.getPageCount(), this.currentPage, this.soMessage, list);
		return LIST;
	}

	/*======================================*/
	
	
	/* 写信 */
	public String write() {
		return "write";
	}
	/* 读信 */
	public String read() {
		this.message = (Message) this.messageService.load(
				new Message(), this.id);
		this.message.setIsRead("5");
		this.message.setReadDate(this.getNowDate());
		this.messageService.update(this.message);
		return "read";
	}
	/* 看信 */
	public String look() {
		this.message = (Message) this.messageService.load(
				new Message(), this.id);
		return "read";
	}
	
	/* 取消 */
	public String remove() {
		Message messageLoad = (Message) this.messageService.load(new Message(), this.id);
		messageLoad.setStatus(offID);
		this.messageService.update(messageLoad);
		return "listG";
	}
	/*发信 */
	@SuppressWarnings("unchecked")
	public String set() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		
		this.message.setSetter(user.getLoginID());
		this.message.setCreateDate(this.getNowDate());
		this.message.setIsRead("1");
		this.message.setStatus("1");
		this.message.setIsReply("2");
		
		this.messageService.save(this.message);
		return "set";
	}
	
	/* 读取列表 */
	@SuppressWarnings("unchecked")
	public String listG() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		
		if(this.soMessage == null){
			this.soMessage = new Message();
		}
		this.soMessage.setGetter(user.getLoginID());
		this.soMessage.setStatus("1");
		
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		
		this.pageBean = this.messageService.queryForPage(this.getPageCount(), this.currentPage,
				this.soMessage, list);
		
		return "listg";
	}
	/* 发送列表 */
	@SuppressWarnings("unchecked")
	public String listS() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		
		if(this.soMessage == null){
			this.soMessage = new Message();
		}
		this.soMessage.setSetter(user.getLoginID());
		this.soMessage.setStatus("1");
		
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		
		this.pageBean = this.messageService.queryForPage(this.getPageCount(), this.currentPage,
				this.soMessage, list);
		
		return "lists";
	}	

}

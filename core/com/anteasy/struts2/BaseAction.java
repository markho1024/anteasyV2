package com.anteasy.struts2;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.anteasy.common.tool.DateUtil;
import com.anteasy.common.tool.PageBean;
import com.app.expand.service.ParamService;
import com.app.util.Params;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	/* action返回值定义 */
	public static final String LIST = "list";
	public static final String ADD = "add";
	public static final String SAVE = "save";
	public static final String EDIT = "edit";
	public static final String UPDATE = "update";
	public static final String DEL = "del";
	public static final String LOAD = "load";

	/* 查询页面的bean 和游标 */
	protected PageBean pageBean;
	protected int currentPage;

	/* 唯一id */
	protected Long id;

	/* 状态取消的ID值 */
	protected String offID;

	/* sql 查询语句list */
	protected List<String> betweens;

	/* 两个日期 */
	protected Date startDate;
	protected Date endDate;

	/* 参数 */
	protected ParamService paramService;

	/* getter 和 setter */

	public PageBean getPageBean() {
		return pageBean;
	}

	public ParamService getParamService() {
		return paramService;
	}

	@Autowired
	public void setParamService(ParamService paramService) {
		this.paramService = paramService;
	}

	public String getOffID() {
		return offID;
	}

	public void setOffID(String offID) {
		this.offID = offID;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<String> getBetweens() {
		return betweens;
	}

	public void setBetweens(List<String> betweens) {
		this.betweens = betweens;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		return LOAD;
	}

	/* 删除 */
	public String del() {
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		return EDIT;
	}

	/* 更新 */
	public String update() {
		return UPDATE;
	}

	/* 保存 */
	public String save() {
		return SAVE;
	}

	/* 列出所有 */
	public String listAll() {
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		return LIST;
	}

	/* Page查询的页面数 */
	public Integer getPageCount() {
		Params load2 = this.paramService.load();
		return load2.getPageCount();
	}

	/* 得到日期 */
	public Date getNowDate() {
		return DateUtil.dateNow();
	}

}

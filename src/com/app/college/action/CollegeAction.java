package com.app.college.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.college.service.CollegeService;
import com.orm.pojo.College;
import com.orm.pojo.User;

@Controller("collegeAction")
public class CollegeAction extends BaseAction {
	private College college;

	private CollegeService collegeService;
	private College soCollege;

	private String jsonType;

	/* getter和setter */

	@Autowired
	public void setCollegeService(CollegeService collegeService) {
		this.collegeService = collegeService;
	}

	public String getJsonType() {
		return jsonType;
	}

	public void setJsonType(String jsonType) {
		this.jsonType = jsonType;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public College getSoCollege() {
		return soCollege;
	}

	public void setSoCollege(College soCollege) {
		this.soCollege = soCollege;
	}

	public CollegeService getCollegeService() {
		return collegeService;
	}

	/* 增加 */
	public String add() {
		long next = this.getCollegeService().findNext("College", "collegeID");
		College collegeNew = new College();
		collegeNew.setCollegeID(next);
		this.setCollege(collegeNew);
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.college = (College) this.collegeService.load(new College(),this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.collegeService.delete(this.college);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.college = (College) this.collegeService.load(new College(),
				this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.college.setStatus("1");
		this.collegeService.saveOrUpdate(this.college);
		setUser();
		return SAVE;
	}
	
	public void setUser() {
		User user = new User();
		user.setLoginID(college.getCollegeID().toString());
		user.setPassword(college.getCollegeID().toString() + "st");
		user.setStatus("1");
		user.setUserName(college.getCollegeName());
		user.setCollegeID(college.getCollegeID());
		user.setUserType("2");
		this.collegeService.saveOrUpdate(user);
	}

	/* 更新 */
	public String update() {
		this.collegeService.update(this.college);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		College collegeLoad = (College) this.collegeService.load(new College(),
				this.id);
		collegeLoad.setStatus(offID);
		this.collegeService.update(collegeLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.collegeService.queryForPage(this.getPageCount(),
				this.currentPage, new College(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getCollegeService().queryForPage(this.getPageCount(),
				this.currentPage, this.soCollege, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer(
				"select collegeID,collegeName from College ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.collegeService.find(sql.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	public void isExist() {
		boolean exist = this.collegeService.isExist(new College(),this.id);
		JsonUtil.outBoolean(exist);
	}

}

package com.app.college.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.college.service.MajorService;
import com.app.user.action.LoginAction;
import com.orm.pojo.Major;
import com.orm.pojo.User;

@Controller("majorAction")
public class MajorAction extends BaseAction {
	private Major major;

	private MajorService majorService;
	private Major soMajor;

	private String jsonType;
	private String jsonValue;

	/* getter和setter */

	@Autowired
	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
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

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public Major getSoMajor() {
		return soMajor;
	}

	public void setSoMajor(Major soMajor) {
		this.soMajor = soMajor;
	}

	public MajorService getMajorService() {
		return majorService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.major = (Major) this.majorService.load(new Major(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.majorService.delete(this.major);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.major = (Major) this.majorService.load(new Major(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.major.setStatus("1");
		this.majorService.saveOrUpdate(this.major);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.majorService.update(this.major);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Major majorLoad = (Major) this.majorService.load(new Major(), this.id);
		majorLoad.setStatus(offID);
		this.majorService.update(majorLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.majorService.queryForPage(this.getPageCount(),
				this.currentPage, new Major(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getMajorService().queryForPage(
				this.getPageCount(), this.currentPage, this.soMajor, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer(
				"select majorID,majorName from Major ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.majorService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select majorID,majorName from Major where collegeID="
						+ Long.parseLong(jsonValue));
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.majorService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	/* json查询下一个 */
	public void next() {
		Long next = this.majorService.findNext("Major", "majorID", "collegeID",Long.parseLong(jsonValue));
		String nextJson = "[{\"next\":" + next + "}]";
		JsonUtil.outResponseJson(nextJson);
	}

	public void isExist() {
		boolean exist = this.majorService.isExist(new Major(), this.id);
		JsonUtil.outBoolean(exist);
	}
	
	/*=================================*/
	/* 增加 */
	public String addC() {
		User loginUser = LoginAction.LoginUser();
		Long collegeID = loginUser.getCollegeID();
		Long next = this.majorService.findNext("Major", "majorID", "collegeID",collegeID);
		
        Long nextNo =collegeID*100 +next%100;
		
		Major majorNew = new Major();
		majorNew.setMajorID(nextNo);
		this.setMajor(majorNew);
		
		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.major = (Major) this.majorService.load(new Major(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.majorService.delete(this.major);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.major = (Major) this.majorService.load(new Major(), this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		User user = LoginAction.LoginUser();
		this.major.setStatus("1");
		this.major.setCollegeID(user.getCollegeID());
		
		this.majorService.saveOrUpdate(this.major);
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.majorService.update(this.major);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Major majorLoad = (Major) this.majorService.load(new Major(), this.id);
		majorLoad.setStatus(offID);
		this.majorService.update(majorLoad);
		return "updatec";
	}

	/* 根据条件查询 */
	public String listC() {
		if(null==soMajor){
			this.soMajor = new Major();
		}
		this.soMajor.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getMajorService().queryForPage(
				this.getPageCount(), this.currentPage, this.soMajor, list);
		return "listc";
	}
}

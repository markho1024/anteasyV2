package com.app.college.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.college.service.ClazzService;
import com.app.user.action.LoginAction;
import com.orm.pojo.Clazz;
import com.orm.pojo.User;

@Controller("clazzAction")
public class ClazzAction extends BaseAction {
	private Clazz clazz;

	private ClazzService clazzService;
	private Clazz soClazz;

	private String jsonType;
	private String jsonValue;
	private String jsonDate;

	/* getter和setter */

	@Autowired
	public void setClazzService(ClazzService clazzService) {
		this.clazzService = clazzService;
	}

	public String getJsonDate() {
		return jsonDate;
	}

	public void setJsonDate(String jsonDate) {
		this.jsonDate = jsonDate;
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

	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public Clazz getSoClazz() {
		return soClazz;
	}

	public void setSoClazz(Clazz soClazz) {
		this.soClazz = soClazz;
	}

	public ClazzService getClazzService() {
		return clazzService;
	}

	/* 增加 */
	public String add() {
		long next = this.getClazzService().findNext("Clazz", "clazzID");
		Clazz clazzNew = new Clazz();
		clazzNew.setClazzID(next);
		this.setClazz(clazzNew);
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.clazz = (Clazz) this.clazzService.load(new Clazz(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.clazzService.delete(this.clazz);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.clazz = (Clazz) this.clazzService.load(new Clazz(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.clazz.setStatus("1");
		this.clazzService.saveOrUpdate(this.clazz);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.clazzService.update(this.clazz);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Clazz clazzLoad = (Clazz) this.clazzService.load(new Clazz(), this.id);
		clazzLoad.setStatus(offID);
		this.clazzService.update(clazzLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.clazzService.queryForPage(this.getPageCount(),
				this.currentPage, new Clazz(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getClazzService().queryForPage(
				this.getPageCount(), this.currentPage, this.soClazz, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer(
				"select clazzID,clazzName from Clazz ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.clazzService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}
	@SuppressWarnings("unchecked")
	public void comboC() {
		StringBuffer sql = new StringBuffer(
				"select clazzID,clazzName from Clazz where collegeID= "
						+ Long.parseLong(jsonValue));
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.clazzService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select clazzID,clazzName from Clazz where majorID= "
						+ Long.parseLong(jsonValue));
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.clazzService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	/* json查询下一个 */
	public void next() {
		String sql = "select max(clazzID) from Clazz where majorID =" + jsonValue
				+ " and year(createDate) like " + jsonDate;
		Long next = this.clazzService.findNext(sql);
		String nextJson = "[{\"next\":" + next + "}]";
		JsonUtil.outResponseJson(nextJson);
	}

	public void isExist() {
		boolean exist = this.clazzService.isExist(new Clazz(), this.id);
		JsonUtil.outBoolean(exist);
	}
	
	/*=================================*/
	/* 增加 */
	public String addC() {
		User loginUser = LoginAction.LoginUser();
		Long collegeID = loginUser.getCollegeID();
		Clazz clazzNew = new Clazz();
		clazzNew.setCollegeID(collegeID);
		this.setClazz(clazzNew);
		
		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.clazz = (Clazz) this.clazzService.load(new Clazz(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.clazzService.delete(this.clazz);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.clazz = (Clazz) this.clazzService.load(new Clazz(), this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		this.clazz.setStatus("1");
		this.clazzService.saveOrUpdate(this.clazz);
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.clazzService.update(this.clazz);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Clazz clazzLoad = (Clazz) this.clazzService.load(new Clazz(), this.id);
		clazzLoad.setStatus(offID);
		this.clazzService.update(clazzLoad);
		return "updatec";
	}

	/* 根据条件查询 */
	public String listC() {
		if(null==soClazz){
			this.soClazz = new Clazz();
		}
		this.soClazz.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getClazzService().queryForPage(
				this.getPageCount(), this.currentPage, this.soClazz, list);
		return "listc";
	}
}

package com.app.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.user.service.TeacherService;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Teacher;
import com.orm.pojo.User;

@Controller("teacherAction")
public class TeacherAction extends BaseAction {
	private Teacher teacher;

	private TeacherService teacherService;
	private Teacher soTeacher;

	private String jsonType;
	private String jsonValue;
	private String jsonDate;

	/* getter和setter */

	@Autowired
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
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

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Teacher getSoTeacher() {
		return soTeacher;
	}

	public void setSoTeacher(Teacher soTeacher) {
		this.soTeacher = soTeacher;
	}

	public TeacherService getTeacherService() {
		return teacherService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.teacher = (Teacher) this.teacherService.load(new Teacher(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.teacherService.delete(this.teacher);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.teacher = (Teacher) this.teacherService.load(new Teacher(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.teacher.setStatus("1");
		this.teacherService.saveOrUpdate(this.teacher);
		setUser();
		return SAVE;
	}

	public void setUser() {
		User user = new User();
		user.setLoginID(teacher.getTeacherID().toString());
		user.setPassword(teacher.getTeacherID().toString() + "st");
		user.setStatus("1");
		user.setUserName(teacher.getTeacherName());
		user.setCollegeID(teacher.getCollegeID());
		user.setUserType("3");
		this.teacherService.saveOrUpdate(user);
	}
	/* 更新 */
	public String update() {
		this.teacherService.update(this.teacher);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Teacher teacherLoad = (Teacher) this.teacherService.load(new Teacher(), this.id);
		teacherLoad.setStatus(offID);
		this.teacherService.update(teacherLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.teacherService.queryForPage(this.getPageCount(),
				this.currentPage, new Teacher(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getTeacherService().queryForPage(
				this.getPageCount(), this.currentPage, this.soTeacher, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer(
				"select teacherID,teacherName from teacher ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.teacherService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select teacherID,teacherName from teacher where collegeID= "
						+ this.jsonValue);
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.teacherService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	/* json查询下一个 */
	public void next() {
		Long next = this.teacherService.findNext("Teacher", "teacherID", "collegeID",Long.parseLong(jsonValue));
		String nextJson = "[{\"next\":" + next + "}]";
		JsonUtil.outResponseJson(nextJson);
	}

	public void isExist() {
		boolean exist = this.teacherService.isExist(new Teacher(), this.id);
		JsonUtil.outBoolean(exist);
	}
	
/*===================================*/	
	
	/* 读取特定 */
	public String loadT() {
		this.loadLogin();
		System.out.println("loaded===================");
		return "loadt";
	}
	
	/* 编辑 */
	public String editT() {
		this.loadLogin();
		return "editt";
	}
	
	/* 更新 */
	public String updateT() {
		this.teacherService.update(this.teacher);
		setLogin();
		return "updatet";
	}
	
	/*登入管理*/
	@SuppressWarnings("unchecked")
	public void loadLogin(){
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		this.teacher = (Teacher) session.get("loginTeacher");
	}
	@SuppressWarnings("unchecked")
	public void setLogin(){
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		session.put("loginTeacher", this.teacher);
	}
	
	/*======================*/
	/* 增加 */
	public String addC() {
		User loginUser = LoginAction.LoginUser();
		Teacher teacherNew = new Teacher();
		teacherNew.setCollegeID(loginUser.getCollegeID());
		this.teacher = teacherNew;
		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.teacher = (Teacher) this.teacherService.load(new Teacher(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.teacherService.delete(this.teacher);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.teacher = (Teacher) this.teacherService.load(new Teacher(), this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		this.teacher.setStatus("1");
		this.teacherService.saveOrUpdate(this.teacher);
		setUser();
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.teacherService.update(this.teacher);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Teacher teacherLoad = (Teacher) this.teacherService.load(new Teacher(), this.id);
		teacherLoad.setStatus(offID);
		this.teacherService.update(teacherLoad);
		return "updatec";
	}

	/* 列出所有 */
	public String listC() {
		if(null==this.soTeacher){
			this.soTeacher=new Teacher();
		}
		this.soTeacher.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.teacherService.queryForPage(
				this.getPageCount(), this.currentPage, this.soTeacher, list);
		
		return "listc";
	}
	
}

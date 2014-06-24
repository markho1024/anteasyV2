package com.app.course.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.orm.pojo.Student;
import com.anteasy.struts2.BaseAction;
import com.app.course.service.PlanService;
import com.app.user.action.LoginAction;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Plan;

@Controller("planAction")
public class PlanAction extends BaseAction {
	private Plan plan;

	private PlanService planService;
	private Plan soPlan;

	private String jsonType;
	private String jsonValue;
	private String jsonKind;
	private int count;

	/* getter和setter */

	@Autowired
	public void setPlanService(PlanService planService) {
		this.planService = planService;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getJsonKind() {
		return jsonKind;
	}

	public void setJsonKind(String jsonKind) {
		this.jsonKind = jsonKind;
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

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public Plan getSoPlan() {
		return soPlan;
	}

	public void setSoPlan(Plan soPlan) {
		this.soPlan = soPlan;
	}

	public PlanService getPlanService() {
		return planService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.plan = (Plan) this.planService.load(new Plan(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.planService.delete(this.plan);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.plan = (Plan) this.planService.load(new Plan(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.plan.setStatus("1");
		this.plan.setCreateDate(this.getNowDate());
		this.planService.save(this.plan);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.planService.update(this.plan);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Plan planLoad = (Plan) this.planService.load(new Plan(), this.id);
		planLoad.setStatus(offID);
		this.planService.update(planLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.planService.queryForPage(this.getPageCount(),
				this.currentPage, new Plan(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getPlanService().queryForPage(this.getPageCount(),
				this.currentPage, this.soPlan, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer("select planID,planName from Plan ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.planService
				.find(sql.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select planID,planName from Plan where collegeID= "
						+ Long.parseLong(jsonValue));
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.planService
				.find(sql.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	public void isExist() {
		boolean exist = this.planService.isExist(new Plan(), this.id);
		JsonUtil.outBoolean(exist);
	}

	/* json grade */
	@SuppressWarnings("unchecked")
	public void comboG() {
		StringBuffer sql = new StringBuffer(
				"select gradeID,gradeName from Grade ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.planService
				.find(sql.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboGP() {
		StringBuffer sql = new StringBuffer(
				"select gradeID,gradeName from Grade where studentType = "
						+ jsonValue);
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.planService
				.find(sql.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	/* 学生查看 */
	@SuppressWarnings("unchecked")
	public String listT() {
		List<String> list = new ArrayList<String>();

		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		Student student = (Student) session.get("loginStudent");

		if (null == this.soPlan) {
			this.soPlan = new Plan();
		}

		this.soPlan.setStudentType(student.getStudentType());
		this.soPlan.setMajorID(student.getMajorID());

		this.pageBean = this.getPlanService().queryForPage(this.getPageCount(),
				this.currentPage, this.soPlan, list);

		return "listt";
	}

	/* ================================= */
	/* 增加 */
	public String addC() {
		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.plan = (Plan) this.planService.load(new Plan(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.planService.delete(this.plan);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.plan = (Plan) this.planService.load(new Plan(), this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		this.plan.setStatus("1");
		this.plan.setCreateDate(getNowDate());
		this.planService.save(this.plan);
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.planService.update(this.plan);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Plan planLoad = (Plan) this.planService.load(new Plan(), this.id);
		planLoad.setStatus(offID);
		this.planService.update(planLoad);
		return "updatec";
	}

	/* 根据条件查询 */
	public String listC() {
		if (null == soPlan) {
			this.soPlan = new Plan();
		}
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		String sql = "majorID in (select majorID from Major where collegeID = "+LoginAction.LoginUser().getCollegeID()+")";
		list.add(sql);
		this.pageBean = this.getPlanService().queryForPage(this.getPageCount(),
				this.currentPage, this.soPlan, list);
		return "listc";
	}
}

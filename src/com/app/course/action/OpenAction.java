package com.app.course.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.DateUtil;
import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.course.service.OpenService;
import com.app.user.action.LoginAction;
import com.app.util.Params;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Open;
import com.orm.pojo.User;

@Controller("openAction")
public class OpenAction extends BaseAction {
	private Open open;

	private OpenService openService;
	private Open soOpen;

	private String jsonType;
	private String jsonValue;
	private String jsonKind;

	private Float lowCredit;
	private Float highCredit;

	private Long order;

	/* getter和setter */

	@Autowired
	public void setOpenService(OpenService openService) {
		this.openService = openService;
	}

	public Long getOrder() {
		return order;
	}

	public void setOrder(Long order) {
		this.order = order;
	}

	public Float getLowCredit() {
		return lowCredit;
	}

	public void setLowCredit(Float lowCredit) {
		this.lowCredit = lowCredit;
	}

	public Float getHighCredit() {
		return highCredit;
	}

	public void setHighCredit(Float highCredit) {
		this.highCredit = highCredit;
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

	public Open getOpen() {
		return open;
	}

	public void setOpen(Open open) {
		this.open = open;
	}

	public Open getSoOpen() {
		return soOpen;
	}

	public void setSoOpen(Open soOpen) {
		this.soOpen = soOpen;
	}

	public OpenService getOpenService() {
		return openService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.open = (Open) this.openService.load(new Open(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.openService.delete(this.open);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.open = (Open) this.openService.load(new Open(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.open.setStatus("1");
		this.open.setCountNow(new Long(0));
		this.open.setCreateDate(this.getNowDate());
		this.openService.save(this.open);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.openService.update(this.open);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Open openLoad = (Open) this.openService.load(new Open(), this.id);
		openLoad.setStatus(offID);
		this.openService.update(openLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.openService.queryForPage(this.getPageCount(),
				this.currentPage, new Open(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenInt("credit", lowCredit, highCredit));
		this.pageBean = this.getOpenService().queryForPage(this.getPageCount(),
				this.currentPage, this.soOpen, list);
		return LIST;
	}

	/* json查询 */

	/* json grade */
	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select o.courseID,c.courseName from Open as o,Course as c where o.courseID = c.courseID and o.teacherID = "
						+ Long.parseLong(jsonValue) + " group by o.courseID");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.openService
				.find(sql.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboO() {
		if (null != jsonKind && !jsonKind.equals("")) {
			StringBuffer sql = new StringBuffer(
					"select orderID,orderID from Open where teacherID = "
							+ Long.parseLong(jsonValue) + " and courseID = "
							+ Long.parseLong(jsonKind));
			if (this.jsonType.equals("ing")) {
				sql.append(" and status = '1'");
			}
			List<Object> list = (List<Object>) this.openService.find(sql
					.toString());
			JsonUtil.jsonMap(list, jsonType);
		} else {
			JsonUtil.jsonMap(null, jsonType);
		}
	}

	/* json查询下一个 */
	public void next() {
		String sql = "select max(orderID) from Open where courseID ="
				+ Long.parseLong(jsonValue);
		Long next = this.openService.findNext(sql);
		String nextJson = "[{\"next\":" + next + "}]";
		JsonUtil.outResponseJson(nextJson);
	}

	public void hasCourse() {
		String sql = "from Open where courseID = " + id;
		List<?> list = this.openService.find(sql);
		boolean is = false;
		if (list != null) {
			for (Object ob : list) {
				if (ob != null) {
					is = true;
				}
			}
		}
		JsonUtil.outBoolean(is);
	}

	public void hasOrder() {
		String sql = "from Open where courseID = " + id + "and orderID="
				+ order;
		List<?> list = this.openService.find(sql);
		boolean is = false;
		if (list != null) {
			for (Object ob : list) {
				if (ob != null) {
					is = true;
				}
			}
		}
		JsonUtil.outBoolean(is);
	}

	/* 学生查看开课 */
	@SuppressWarnings("unchecked")
	public String listB() {
		if (canLog()) {
			Map<String, Object> session = (Map<String, Object>) ActionContext
					.getContext().get("session");
			User user = (User) session.get("loginUser");
			
			List<String> list = new ArrayList<String>();
			if (this.soOpen == null) {
				this.soOpen = new Open();
			}
			
			long teacherID = Long.parseLong(user.getLoginID());
			this.soOpen.setTeacherID(teacherID);
			this.soOpen.setStatus("1");

			this.pageBean = this.getOpenService().queryForPage(
					this.getPageCount(), this.currentPage, this.soOpen, list);
			return "listb";
		} else {
			return "dislog";
		}
	}
	/* 学生查看开课 */
	public String listT() {
		if (canChoose()) {
			List<String> list = new ArrayList<String>();
			if (this.soOpen == null) {
				this.soOpen = new Open();
			}
			
			this.pageBean = this.getOpenService().queryForPage(
					this.getPageCount(), this.currentPage, this.soOpen, list);
			return "listt";
		} else {
			return "dischoose";
		}
	}

	public String loadT() {
		this.open = (Open) this.openService.load(new Open(), this.id);
		return "loadt";
	}

	/* ================================= */
	/* 增加 */
	public String addC() {
		User loginUser = LoginAction.LoginUser();
		Long collegeID = loginUser.getCollegeID();
		Open openNew = new Open();
		openNew.setCollegeID(collegeID);
		this.setOpen(openNew);

		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.open = (Open) this.openService.load(new Open(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.openService.delete(this.open);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.open = (Open) this.openService.load(new Open(), this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		User user = LoginAction.LoginUser();
		this.open.setStatus("1");
		this.open.setCollegeID(user.getCollegeID());

		this.openService.save(this.open);
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.openService.update(this.open);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Open openLoad = (Open) this.openService.load(new Open(), this.id);
		openLoad.setStatus(offID);
		this.openService.update(openLoad);
		return "updatec";
	}

	/* 根据条件查询 */
	public String listC() {
		if (null == soOpen) {
			this.soOpen = new Open();
		}
		this.soOpen.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getOpenService().queryForPage(this.getPageCount(),
				this.currentPage, this.soOpen, list);
		return "listc";
	}

	/* 判断是否可以选课 */
	public boolean canChoose() {
		Params params = this.paramService.load();
		Date start = params.getChoiceOne();
		Date end = params.getChoiceTwo();
		Date now = DateUtil.dateNow();
		long diff = -3561;

		if (now.after(start) && now.before(end)) {
			diff = Math.abs(now.getTime() - start.getTime());
		}
		if (now.after(end)) {
			diff = Math.abs(end.getTime() - now.getTime());

		}

		int days = (int) (diff / (1000 * 60 * 60 * 24));

		if (days < 15 && days > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/* 是否能够录入成绩 */
	public boolean canLog() {
		Params params = this.paramService.load();
		Date start = params.getLogOne();
		Date end = params.getLogTwo();
		Date now = DateUtil.dateNow();
		long diff = -3561;

		if (now.after(start) && now.before(end)) {
			diff = Math.abs(now.getTime() - start.getTime());
		}
		if (now.after(end)) {
			diff = Math.abs(end.getTime() - now.getTime());

		}

		int days = (int) (diff / (1000 * 60 * 60 * 24));

		if (days < 30 && days > 0) {
			return true;
		} else {
			return false;
		}
	}
}
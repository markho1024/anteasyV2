package com.app.choice.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.app.user.action.LoginAction;
import com.app.util.TimeTable;
import com.anteasy.common.tool.DateUtil;
import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.PageBean;
import com.anteasy.common.tool.SqlUtil;
import com.orm.pojo.Open;
import com.orm.pojo.User;
import com.anteasy.struts2.BaseAction;
import com.app.util.Params;
import com.app.choice.service.ChoiceService;
import com.app.course.service.OpenService;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Pick;

@Controller("choiceAction")
public class ChoiceAction extends BaseAction {
	private Pick pick;
	private Open open;

	private ChoiceService choiceService;
	private OpenService openService;

	private Pick soPick;
	private Open soOpen;
	private TimeTable timeTable;

	/* getter和setter */

	@Autowired
	public void setChoiceService(ChoiceService choiceService) {
		this.choiceService = choiceService;
	}

	public OpenService getOpenService() {
		return openService;
	}

	@Autowired
	public void setOpenService(OpenService openService) {
		this.openService = openService;
	}

	public TimeTable getTimeTable() {
		return timeTable;
	}

	public void setTimeTable(TimeTable timeTable) {
		this.timeTable = timeTable;
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

	public Pick getPick() {
		return pick;
	}

	public void setPick(Pick pick) {
		this.pick = pick;
	}

	public Pick getSoPick() {
		return soPick;
	}

	public void setSoPick(Pick soPick) {
		this.soPick = soPick;
	}

	public ChoiceService getChoiceService() {
		return choiceService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.pick = (Pick) this.choiceService.load(new Pick(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.choiceService.delete(this.pick);
		Open open2 = (Open) this.openService.load(new Open(),
				this.pick.getOpenID());
		this.openService.countSub(open2);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.pick = (Pick) this.choiceService.load(new Pick(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.setDefault();
		this.choiceService.save(this.pick);
		return SAVE;
	}

	@SuppressWarnings("unchecked")
	public void setDefault() {
		if (null == this.pick) {
			this.pick = new Pick();
		}
		// 是否录入成绩
		this.pick.setLogStatus("1");
		// 考试类型
		this.pick.setScoreType("1");
		// 现在时间
		this.pick.setCreateDate(getNowDate());
		// 状态
		this.pick.setStatus("1");

		String sql = "from Open where courseID = " + open.getCourseID()
				+ "and orderID = " + open.getOrderID();
		List<Open> find = (List<Open>) this.choiceService.find(sql);
		for (Open openOne : find) {
			System.out.println("Open:==========" + openOne.getOpenID());
			this.openService.countAdd(openOne);
			this.pick.setOpenID(openOne.getOpenID());
		}
	}

	/* 更新 */
	public String update() {
		this.choiceService.update(this.pick);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Pick pickLoad = (Pick) this.choiceService.load(new Pick(), this.id);
		pickLoad.setStatus(offID);
		this.choiceService.update(pickLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.choiceService.queryForPage(this.getPageCount(),
				this.currentPage, new Pick(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getChoiceService().queryForPage(
				this.getPageCount(), this.currentPage, this.soPick, list);
		return LIST;
	}

	/* ===================== */
	/* 教师查看最近选课 */
	@SuppressWarnings("unchecked")
	public String choiceT() {

		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");

		if (this.soPick == null) {
			this.soPick = new Pick();
		}
		if (this.soOpen == null) {
			this.soOpen = new Open();
		}

		long teacherID = Long.parseLong(user.getLoginID());

		this.soOpen.setTeacherID(teacherID);
		this.soOpen.setStatus("1");

		String ql = this.choiceService.querySql(this.soOpen, null);
		String s2 = " openID in ( select openID " + ql + ")";
		List<String> list = new ArrayList<String>();
		list.add(s2);
		list.add(this.choiceDate());
		this.pageBean = this.choiceService.queryForPage(this.getPageCount(),
				this.currentPage, this.soPick, list);

		return "choicet";
	}

	/* 学生查看最近选课 */
	@SuppressWarnings("unchecked")
	public String choiceS() {

		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");

		if (this.soPick == null) {
			this.soPick = new Pick();
		}
		if (this.soOpen == null) {
			this.soOpen = new Open();
		}

		long studentID = Long.parseLong(user.getLoginID());

		this.soPick.setStudentID(studentID);
		this.soPick.setStatus("1");

		String ql = this.choiceService.querySql(this.soOpen, null);
		String s2 = " openID in ( select openID " + ql + ")";
		List<String> list = new ArrayList<String>();
		list.add(s2);
		list.add(this.choiceDate());
		this.pageBean = this.choiceService.queryForPage(this.getPageCount(),
				this.currentPage, this.soPick, list);

		this.timeTable();
		return "choices";
	}

	/* 学生选课 */
	@SuppressWarnings("unchecked")
	public String choose() {
		if(canChoose()){
				Map<String, Object> session = (Map<String, Object>) ActionContext
						.getContext().get("session");
				User user = (User) session.get("loginUser");
		
				if (this.soPick == null) {
					this.soPick = new Pick();
				}
				if (this.soOpen == null) {
					this.soOpen = new Open();
				}
		
				long studentID = Long.parseLong(user.getLoginID());
		
				this.soPick.setStudentID(studentID);
				this.soPick.setStatus("1");
		
				String ql = this.choiceService.querySql(this.soOpen, null);
				String s2 = " openID in ( select openID " + ql + ")";
				List<String> list = new ArrayList<String>();
				list.add(s2);
				list.add(this.choiceDate());
				this.pageBean = this.choiceService.queryForPage(this.getPageCount(),
						this.currentPage, this.soPick, list);
		
				this.timeTable();
				return "choose";
		}
		else{
			return "dischoose";
		}
	}

	/* 课程表 */
	@SuppressWarnings("unchecked")
	public void timeTable() {

		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");

		Pick tPick = new Pick();
		Open tOpen = new Open();

		long studentID = Long.parseLong(user.getLoginID());

		tPick.setStudentID(studentID);
		tPick.setStatus("1");

		String ql = this.choiceService.querySql(tPick, null);
		String s2 = " openID in ( select openID " + ql + ")";
		List<String> list = new ArrayList<String>();
		list.add(s2);
		list.add(this.choiceDate());
		PageBean pb = this.choiceService.queryForPage(this.getPageCount(),
				this.currentPage, tOpen, list);

		timeTable = new TimeTable(7, 5);
		List<Open> list2 = (List<Open>) pb.getList();
		for (Open pn : list2) {
			if (null != pn.getTableDay() && null != pn.getTableWeek()) {
				Integer day = pn.getTableDay() - 1;
				Integer week = pn.getTableWeek() - 1;
				timeTable.getDay()[day].getWeek()[week].getCourse().add(pn);
			}
		}
	}

	/* 保存选课 */
	@SuppressWarnings("unchecked")
	public String saveChoose() {
		this.setDefault();
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");

		long studentID = Long.parseLong(user.getLoginID());
		this.pick.setStudentID(studentID);

		this.choiceService.save(this.pick);
		return "schoose";
	}

	public void isSaveS() {
		System.out.println("0.pro:==========");
		Long studentID = Long.parseLong(LoginAction.LoginUser().getLoginID());
		if (pick == null) {
			this.pick = new Pick();
			this.pick.setStudentID(studentID);
		}
		System.out.println("1.isSaveS invoked:========" + studentID);
		doSave();
	}

	@SuppressWarnings("unchecked")
	public void doSave() {
		Long countNow = new Long(0);
		Long countLimit = new Long(0);
		Long openID = null;
		String errWords = null;
		System.out.println("2.doSave invoked:============");

		String sql = "from Open where courseID=" + open.getCourseID()
				+ " and orderID=" + open.getOrderID();

		System.out.println("3.sql  pre:=============" + sql);
		List<Open> opens = (List<Open>) this.choiceService.find(sql);
		System.out.println("4. sql ed:===============");
		for (Open op : opens) {
			openID = op.getCollegeID();
			countNow = op.getCountNow();
			countLimit = op.getCountLimit();
			System.out.println("5.OPen======" + countNow + "/" + countLimit);
		}

		if ((countNow + 1) > countLimit) {
			errWords = "课程人数已经超标。";
		}

		Open openNew = (Open) this.choiceService.load(new Open(), openID);
		String pt = openNew.getPeriodType();

		System.out.println("6.sql2 pre===============");
		String sql2 = "select o.periodType from Open as o,Pick as p where o.openID = p.openID and o.tableWeek = "
				+ openNew.getTableWeek()
				+ " and o.tableDay="
				+ openNew.getTableDay()
				+ " and p.studentID="
				+ pick.getStudentID()
				+ " and "
				+ this.choiceDate("p.createDate");

		System.out.println("7. sql2 ed================" + sql2);
		List<String> ptps = (List<String>) this.choiceService.find(sql2);
		System.out.println("72. list ed================");
		for (String ptp : ptps) {
			int pn1 = Integer.parseInt(pt);
			int pn2 = Integer.parseInt(ptp);
			System.out.println("8. ptp:===============" + pn1 + "/" + pn2);
			if ((pn1 == pn2) || ((pn1 / 10) != (pn2 / 10))) {
				errWords = "课程冲突。";
			}
		}
		System.out.println(errWords);
		String json = "[{\"ew\":\"" + errWords + "\"}]";
		JsonUtil.outResponseJson(json);
	}

	/* 删除选课 */
	public String delT() {
		this.choiceService.delete(this.pick);
		Open open2 = (Open) this.openService.load(new Open(),
				this.pick.getOpenID());
		this.openService.countSub(open2);
		return "delt";
	}

	/* ========================================== */

	/* 选课时间判断 */
	@SuppressWarnings("deprecation")
	public String choiceDate(String str) {
		if (str == null) {
			str = "createDate";
		}

		Params params = this.paramService.load();

		Date start = params.getChoiceOne();
		Date end = params.getChoiceTwo();
		Date now = DateUtil.dateNow();
		Date choiceStart;
		Date choiceEnd;

		if (now.before(start)) {
			choiceStart = new Date(end.getYear() - 1, end.getMonth(),
					end.getDay());
			choiceEnd = start;
		} else if (now.after(start) && now.before(end)) {
			choiceStart = start;
			choiceEnd = end;
		} else {
			choiceStart = end;
			choiceEnd = new Date(start.getYear() + 1, start.getMonth(),
					start.getDay());
		}
		return SqlUtil.betweenDate(str, choiceStart, choiceEnd);
	}

	public String choiceDate() {
		return choiceDate(null);
	}

	/* ================================= */
	/* 增加 */
	public String addC() {
		return "addc";
	}

	/* 删除 */
	public String delC() {
		this.choiceService.delete(this.pick);
		Open open2 = (Open) this.openService.load(new Open(),
				this.pick.getOpenID());
		this.openService.countSub(open2);
		return "delc";
	}

	/* 保存 */
	public String saveC() {
		this.setDefault();
		this.choiceService.save(this.pick);
		return "savec";
	}

	/* 根据条件查询 */
	@SuppressWarnings("unchecked")
	public String listC() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");

		if (this.soPick == null) {
			this.soPick = new Pick();
		}
		if (this.soOpen == null) {
			this.soOpen = new Open();
		}

		long collegeID = Long.parseLong(user.getLoginID());

		String ql = this.choiceService.querySql(this.soOpen, null);
		String s2 = " openID in ( select openID " + ql + ")";

		String s3 = " studentID in (select studentID from Student where collegeID = "
				+ collegeID + ")";

		List<String> list = new ArrayList<String>();
		list.add(s2);
		list.add(s3);

		list.add(this.choiceDate());

		this.pageBean = this.getChoiceService().queryForPage(
				this.getPageCount(), this.currentPage, this.soPick, list);
		return "listc";
	}

	/*判断是否可以选课*/
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
}
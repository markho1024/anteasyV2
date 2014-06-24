package com.app.choice.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.DateUtil;
import com.anteasy.common.tool.SqlUtil;
import com.orm.pojo.User;
import com.anteasy.struts2.BaseAction;
import com.app.util.Params;
import com.app.choice.service.ScoreService;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Open;
import com.orm.pojo.Pick;

@Controller("scoreAction")
public class ScoreAction extends BaseAction {
	private Pick pick;
	private Open open;

	private ScoreService scoreService;

	private Pick soPick;
	private Open soOpen;

	private String isPass;

	private ArrayList<Long> ids;
	private ArrayList<String> scores;

	/* getter和setter */

	@Autowired
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}

	public ArrayList<Long> getIds() {
		return ids;
	}

	public void setIds(ArrayList<Long> ids) {
		this.ids = ids;
	}

	public ArrayList<String> getScores() {
		return scores;
	}

	public void setScores(ArrayList<String> scores) {
		this.scores = scores;
	}

	public Open getSoOpen() {
		return soOpen;
	}

	public void setSoOpen(Open soOpen) {
		this.soOpen = soOpen;
	}

	public Open getOpen() {
		return open;
	}

	public void setOpen(Open open) {
		this.open = open;
	}

	public String getIsPass() {
		return isPass;
	}

	public void setIsPass(String isPass) {
		this.isPass = isPass;
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

	public ScoreService getScoreService() {
		return scoreService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.scoreService.delete(this.pick);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		this.open = (Open) this.scoreService.load(new Open(),
				this.pick.getOpenID());
		return EDIT;
	}

	/* 录入成绩 */
	public String log() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		this.open = (Open) this.scoreService.load(new Open(),
				this.pick.getOpenID());
		return "log";
	}

	public String loged() {
		this.pick.setLogStatus("9");
		this.toPoint(this.pick);
		this.scoreService.update(this.pick);
		return "loged";
	}

	/* 保存 */
	public String save() {
		this.pick.setStatus("1");
		this.pick.setCreateDate(this.getNowDate());
		this.scoreService.save(this.pick);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.toPoint(this.pick);
		this.pick.setLogStatus("9");
		this.scoreService.update(this.pick);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Pick pickLoad = (Pick) this.scoreService.load(new Pick(), this.id);
		pickLoad.setStatus(offID);
		this.scoreService.update(pickLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.scoreService.queryForPage(this.getPageCount(),
				this.currentPage, new Pick(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		System.out.println("int:");
		String ql = this.scoreService.querySql(this.soOpen, null);
		String s2 = " openID in ( select openID " + ql + ")";
		System.out.println("sql:" + s2);
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("examDate", startDate, endDate));
		list.add(s2);

		this.soPick.setOpenID(null);
		this.pageBean = this.getScoreService().queryForPage(
				this.getPageCount(), this.currentPage, this.soPick, list);
		return LIST;
	}

	/* 教师批量录入成绩 */
	public String logBatch() {
		if (canLog()) {
			if (this.soPick == null) {
				this.soPick = new Pick();
			}
			List<String> list = new ArrayList<String>();
			list.add(this.logDate());

			this.open = (Open) this.scoreService.load(new Open(),
					this.soPick.getOpenID());

			this.pageBean = this.scoreService.queryForPage(this.getPageCount(),
					this.currentPage, this.soPick, list);
			System.out.println("1:=================");
			return "batch";
		} else {
			return "dislog";
		}
	}

	public String batchSave() {
		for (int i = 0; i < ids.size(); i++) {
			if (ids != null) {
				Long idOne = ids.get(i);
				String scoreOne = this.scores.get(i);

				System.out.println(idOne + "//" + scoreOne);

				Pick pickSave = (Pick) this.scoreService
						.load(new Pick(), idOne);
				pickSave.setScore(scoreOne);
				this.toPoint(pickSave);
				pickSave.setLogStatus("9");
				pickSave.setExamDate(DateUtil.dateNow());
				this.scoreService.update(pickSave);
			}
		}
		return "batchs";
	}

	@SuppressWarnings("unchecked")
	/* 教师查看最近成绩 */
	public String scoreT() {
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

		String ql = this.scoreService.querySql(this.soOpen, null);
		String s2 = " openID in ( select openID " + ql + ")";
		List<String> list = new ArrayList<String>();
		list.add(s2);
		list.add(this.logDate());

		if (isPass != null && isPass.equals("1")) {
			list.add("point > 0");
		} else if (isPass != null && isPass.equals("9")) {
			list.add("point <= 0");
		}

		this.pageBean = this.scoreService.queryForPage(this.getPageCount(),
				this.currentPage, this.soPick, list);

		return "scoret";
	}

	/* 老师录入成绩 */
	public String logT() {
		if (canLog()) {
			this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
			this.open = (Open) this.scoreService.load(new Open(),
					this.pick.getOpenID());
			return "logt";
		} else {
			return "dislog";
		}
	}

	public String logedT() {
		this.pick.setLogStatus("9");
		this.toPoint(this.pick);
		this.scoreService.update(this.pick);
		return "logedt";
	}

	/* 读取 */
	public String loadT() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		return "loadt";
	}

	/* 学生查看所有成绩 */
	@SuppressWarnings("unchecked")
	public String scoreAll() {
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

		List<String> list2 = new ArrayList<String>();
		if (isPass != null && isPass.equals("9")) {
			String sql = "courseID in ( select o.courseID,max(p.point) from Pick as p, Open as o where p.openID = o.openID group by o.courseID)";
			list2.add(sql);
		}
		String ql = this.scoreService.querySql(this.soOpen, list2);
		String s2 = " openID in ( select openID " + ql + ")";
		List<String> list = new ArrayList<String>();
		list.add(s2);
		if (isPass != null && isPass.equals("1")) {
			list.add("point > 0");
		} else if (isPass != null && isPass.equals("8")) {
			list.add("point <= 0");
		} else if (isPass != null && isPass.equals("9")) {
			list.add("point <= 0");
		}

		this.pageBean = this.getScoreService().queryForPage(
				this.getPageCount(), this.currentPage, this.soPick, list);

		return "scorea";
	}

	/* 学生查看最近成绩 */
	@SuppressWarnings("unchecked")
	public String scoreS() {

		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		if (this.soPick == null) {
			this.soPick = new Pick();
		}

		long studentID = Long.parseLong(user.getLoginID());
		this.soPick.setStudentID(studentID);
		this.soPick.setStatus("1");
		List<String> list = new ArrayList<String>();
		list.add(this.logDate());

		if (isPass != null && isPass.equals("1")) {
			list.add("point > 0");
		} else if (isPass != null && isPass.equals("9")) {
			list.add("point <= 0");
		}

		this.pageBean = this.getScoreService().queryForPage(
				this.getPageCount(), this.currentPage, this.soPick, list);

		return "scores";
	}

	/* 绩点换算 */
	public void toPoint(Pick pickTo) {
		if (null != pickTo.getScore()) {
			long pot = 0;
			if (this.open.getScoreKind().equals("1")) {
				Long i = Long.parseLong(pickTo.getScore());
				if (i < 60) {
					pot = 0;
				} else if (i >= 60 && i < 70) {
					pot = 1;
				} else if (i >= 70 && i < 80) {
					pot = 2;
				} else if (i >= 80 && i < 90) {
					pot = 3;
				} else {
					pot = 4;
				}
			} else {
				String s = pickTo.getScore();
				if (s.equals("A")) {
					pot = 4;
				} else if (s.equals("B")) {
					pot = 3;
				} else if (s.equals("C")) {
					pot = 2;
				} else if (s.equals("D")) {
					pot = 1;
				} else if (s.equals("E")) {
					pot = 0;
				}
			}
			pickTo.setPoint(pot);
		}
	}

	/* ======================== */
	/* 选课考试判断 */
	@SuppressWarnings("deprecation")
	public String logDate() {
		Params params = this.paramService.load();
		Date start = params.getLogOne();
		Date end = params.getLogTwo();
		Date now = DateUtil.dateNow();
		Date logStart;
		Date logEnd;

		if (now.before(start)) {
			logStart = new Date(end.getYear() - 1, end.getMonth(), end.getDay());
			logEnd = start;
			return SqlUtil.betweenDate("createDate", logStart, logEnd);
		} else if (now.after(start) && now.before(end)) {
			logStart = start;
			logEnd = end;
			return SqlUtil.betweenDate("createDate", logStart, logEnd);
		} else {
			logStart = end;
			logEnd = new Date(start.getYear() + 1, start.getMonth(),
					start.getDay());
			return SqlUtil.betweenDate("createDate", logStart, logEnd);
		}
	}

	/* ================================= */
	/* 读取 */
	public String loadC() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		return "loadc";
	}

	/* 编辑 */
	public String editC() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		this.open = (Open) this.scoreService.load(new Open(),
				this.pick.getOpenID());
		return "editc";
	}

	/* 更新 */
	public String updateC() {
		this.toPoint(this.pick);
		this.pick.setLogStatus("9");
		this.scoreService.update(this.pick);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Pick pickLoad = (Pick) this.scoreService.load(new Pick(), this.id);
		pickLoad.setStatus(offID);
		this.scoreService.update(pickLoad);
		return "updatec";
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

		String ql = this.scoreService.querySql(this.soOpen, null);
		String s2 = " openID in ( select openID " + ql + ")";

		String s3 = " studentID in (select studentID from Student where collegeID = "
				+ collegeID + ")";

		List<String> list = new ArrayList<String>();
		list.add(s2);
		list.add(s3);

		if (isPass != null && isPass.equals("1")) {
			list.add("point > 0");
		} else if (isPass != null && isPass.equals("9")) {
			list.add("point <= 0");
		}

		list.add(this.logDate());

		this.pageBean = this.scoreService.queryForPage(this.getPageCount(),
				this.currentPage, this.soPick, list);
		return "listc";
	}

	/* 录入成绩 */
	public String logC() {
		this.pick = (Pick) this.scoreService.load(new Pick(), this.id);
		this.open = (Open) this.scoreService.load(new Open(),
				this.pick.getOpenID());
		return "logc";
	}

	public String logedC() {
		this.pick.setLogStatus("9");
		this.toPoint(this.pick);
		this.scoreService.update(this.pick);
		return "logedc";
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

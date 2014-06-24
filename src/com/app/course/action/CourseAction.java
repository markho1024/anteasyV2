package com.app.course.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.course.service.CourseService;
import com.app.user.action.LoginAction;
import com.orm.pojo.Course;
import com.orm.pojo.User;

@Controller("courseAction")
public class CourseAction extends BaseAction {
	private Course course;

	private CourseService courseService;
	private Course soCourse;

	private String jsonType;
	private String jsonValue;
	private String jsonKind;
	private int count;

	/* getter和setter */

	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
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

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Course getSoCourse() {
		return soCourse;
	}

	public void setSoCourse(Course soCourse) {
		this.soCourse = soCourse;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		System.out.println("load:============" + id);
		this.course = (Course) this.courseService.load(new Course(), this.id);
		System.out
				.println("loaded=============:" + this.course.getCourseName());
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.courseService.delete(this.course);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.course = (Course) this.courseService.load(new Course(), this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		if (this.getCount() != 0 || this.getCount() != 1) {
			String courseNameOld = course.getCourseName();
			Long courseIDOld = course.getCourseID();
			for (int i = 0; i < this.getCount(); i++) {
				int no = i + 1;
				Long courseID = courseIDOld + no;
				String courseName = courseNameOld + "(" + no + ")";
				this.course.setCourseID(courseID);
				this.course.setCourseName(courseName);
				this.course.setStatus("1");
				this.courseService.saveOrUpdate(this.course);
			}
		}else if(this.getCount()==1){
			this.course.setStatus("1");
		    this.courseService.save(this.course);
		}
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.courseService.update(this.course);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Course courseLoad = (Course) this.courseService.load(new Course(),
				this.id);
		courseLoad.setStatus(offID);
		this.courseService.update(courseLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.courseService.queryForPage(this.getPageCount(),
				this.currentPage, new Course(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getCourseService().queryForPage(
				this.getPageCount(), this.currentPage, this.soCourse, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer(
				"select courseID,courseName from Course ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.courseService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select courseID,courseName from Course where collegeID= "
						+ Long.parseLong(jsonValue));
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.courseService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	/* json查询下一个 */
	public void next() {
		String sql = "select max(courseID) from Course where collegeID ="
				+ jsonValue + " and courseKind = " + jsonKind;
		Long next = this.courseService.findNext(sql);
		String nextJson = "[{\"next\":" + next + "}]";
		JsonUtil.outResponseJson(nextJson);
	}

	public void isExist() {
		boolean exist = this.courseService.isExist(new Course(), this.id);
		JsonUtil.outBoolean(exist);
	}
	
	/*=================================*/
	/* 增加 */
	public String addC() {
		User loginUser = LoginAction.LoginUser();
		Long collegeID = loginUser.getCollegeID();
		Course courseNew = new Course();
		courseNew.setCollegeID(collegeID);
		this.setCourse(courseNew);
		
		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.course = (Course) this.courseService.load(new Course(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.courseService.delete(this.course);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.course = (Course) this.courseService.load(new Course(), this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		if (this.getCount() != 0 || this.getCount() != 1) {
			String courseNameOld = course.getCourseName();
			Long courseIDOld = course.getCourseID();
			for (int i = 0; i < this.getCount(); i++) {
				int no = i + 1;
				Long courseID = courseIDOld + no;
				String courseName = courseNameOld + "(" + no + ")";
				this.course.setCourseID(courseID);
				this.course.setCourseName(courseName);
				this.course.setStatus("1");
				this.courseService.saveOrUpdate(this.course);
			}
		}else if(this.getCount()==1){
			this.course.setStatus("1");
		    this.courseService.saveOrUpdate(this.course);
		}
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.courseService.update(this.course);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Course courseLoad = (Course) this.courseService.load(new Course(), this.id);
		courseLoad.setStatus(offID);
		this.courseService.update(courseLoad);
		return "updatec";
	}

	/* 根据条件查询 */
	public String listC() {
		if(null==soCourse){
			this.soCourse = new Course();
		}
		this.soCourse.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getCourseService().queryForPage(
				this.getPageCount(), this.currentPage, this.soCourse, list);
		return "listc";
	}
}

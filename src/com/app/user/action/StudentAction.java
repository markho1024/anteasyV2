package com.app.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.user.service.StudentService;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Student;
import com.orm.pojo.User;

@Controller("studentAction")
public class StudentAction extends BaseAction {
	private Student student;

	private StudentService studentService;
	private Student soStudent;

	private String jsonType;
	private String jsonValue;
	private String jsonKind;
	private String jsonDate;

	/* getter和setter */

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String getJsonKind() {
		return jsonKind;
	}

	public void setJsonKind(String jsonKind) {
		this.jsonKind = jsonKind;
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

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Student getSoStudent() {
		return soStudent;
	}

	public void setSoStudent(Student soStudent) {
		this.soStudent = soStudent;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	/* 增加 */
	public String add() {
		long next = this.getStudentService().findNext("Student", "studentID");
		Student studentNew = new Student();
		studentNew.setStudentID(next);
		this.setStudent(studentNew);
		return ADD;
	}

	/* 读取 */
	public String load() {
		System.out.println("load:============" + id);
		this.student = (Student) this.studentService.load(new Student(),
				this.id);
		System.out.println("loaded=============:"
				+ this.student.getStudentName());
		return LOAD;
	}

	/* 删除 */
	public String del() {
		this.studentService.delete(this.student);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.student = (Student) this.studentService.load(new Student(),
				this.id);
		return EDIT;
	}

	/* 保存 */
	public String save() {
		this.student.setStatus("1");
		this.studentService.saveOrUpdate(this.student);
		setUser();
		return SAVE;
	}

	public void setUser() {
		User user = new User();
		user.setLoginID(student.getStudentID().toString());
		user.setPassword(this.student.getStudentID().toString() + "st");
		user.setStatus("1");
		user.setUserName(this.student.getStudentName());
		user.setCollegeID(this.student.getCollegeID());
		user.setUserType("4");
		this.studentService.saveOrUpdate(user);
	}

	/* 更新 */
	public String update() {
		this.studentService.update(this.student);
		return UPDATE;
	}

	/* 取消 */
	public String off() {
		Student studentLoad = (Student) this.studentService.load(new Student(),
				this.id);
		studentLoad.setStatus(offID);
		this.studentService.update(studentLoad);
		return UPDATE;
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.studentService.queryForPage(this.getPageCount(),
				this.currentPage, new Student(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getStudentService().queryForPage(
				this.getPageCount(), this.currentPage, this.soStudent, list);
		return LIST;
	}

	/* json查询 */
	@SuppressWarnings("unchecked")
	public void combo() {
		StringBuffer sql = new StringBuffer(
				"select studentID,studentName from student ");
		if (this.jsonType.equals("ing")) {
			sql.append(" where status = '1'");
		}
		List<Object> list = (List<Object>) this.studentService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	@SuppressWarnings("unchecked")
	public void comboP() {
		StringBuffer sql = new StringBuffer(
				"select studentID,studentName from student where collegeID= "
						+ this.jsonValue);
		if (this.jsonType.equals("ing")) {
			sql.append(" and status = '1'");
		}
		List<Object> list = (List<Object>) this.studentService.find(sql
				.toString());
		JsonUtil.jsonMap(list, jsonType);
	}

	/* json查询下一个 */
	public void next() {
		String sql = "select max(studentID) from Student where collegeID ="
				+ jsonValue + " and year(createDate) like " + jsonDate
				+ " and studentType=" + jsonKind;
		Long next = this.studentService.findNext(sql);
		String nextJson = "[{\"next\":" + next + "}]";
		JsonUtil.outResponseJson(nextJson);
	}

	public void isExist() {
		boolean exist = this.studentService.isExist(new Student(), this.id);
		JsonUtil.outBoolean(exist);
	}
	
/*===================================*/	
	
	/* 读取特定 */
	public String loadT() {
		this.loadLogin();
		return "loadt";
	}
	
	/* 编辑 */
	public String editT() {
		this.loadLogin();
		return "editt";
	}
	
	/* 更新 */
	public String updateT() {
		this.studentService.update(this.student);
		setLogin();
		return "updatet";
	}
	
	/*登入管理*/
	@SuppressWarnings("unchecked")
	public void loadLogin(){
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		this.student = (Student) session.get("loginStudent");
	}
	@SuppressWarnings("unchecked")
	public void setLogin(){
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		session.put("loginStudent", this.student);
	}
	
	/*========================*/
	/* 增加 */
	public String addC() {
		Student studentNew = new Student();
		studentNew.setStudentID(LoginAction.LoginUser().getCollegeID());
		this.setStudent(studentNew);
		return "addc";
	}

	/* 读取 */
	public String loadC() {
		this.student = (Student) this.studentService.load(new Student(),
				this.id);
		return "loadc";
	}

	/* 删除 */
	public String delC() {
		this.studentService.delete(this.student);
		return "delc";
	}

	/* 编辑 */
	public String editC() {
		this.student = (Student) this.studentService.load(new Student(),
				this.id);
		return "editc";
	}

	/* 保存 */
	public String saveC() {
		this.student.setStatus("1");
		this.studentService.saveOrUpdate(this.student);
		setUser();
		return "savec";
	}

	/* 更新 */
	public String updateC() {
		this.studentService.update(this.student);
		return "updatec";
	}

	/* 取消 */
	public String offC() {
		Student studentLoad = (Student) this.studentService.load(new Student(),
				this.id);
		studentLoad.setStatus(offID);
		this.studentService.update(studentLoad);
		return "updatec";
	}

	/* 列出所有 */
	public String listC() {
		if(null==this.soStudent){
			this.soStudent=new Student();
		}
		
		this.soStudent.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		
		this.pageBean = this.studentService.queryForPage(this.getPageCount(),
				this.currentPage, new Student(), this.betweens);
		this.pageBean = this.studentService.queryForPage(
				this.getPageCount(), this.currentPage, this.soStudent, list);
		
		return "listc";
	}
}

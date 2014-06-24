package com.app.user.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.app.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.orm.pojo.College;
import com.orm.pojo.Student;
import com.orm.pojo.Teacher;
import com.orm.pojo.User;

@Controller("loginAction")
public class LoginAction extends ActionSupport{
	private String loginID;
	private String password;
	private User user;
	private UserService userService;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String login() throws Exception {
		if (this.loginUser() && user.getPassword().equals(password)) {
			setLogin(user);
			return LOGIN;
		} else
			return ERROR;
	}

	public String logout() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return "logouted";
	}

	public String logined() {
		return "logined";
	}
	
	public String main() {
		return "main";
	}

	/* json */
	public Boolean loginUser() {
		String sql = "from User where loginID = '" + loginID + "'";
		User logUser = null;
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) this.userService.find(sql);
		for (User users : list) {
			logUser = users;
		}
		if (logUser == null) {
			return false;
		} else {
			setUser(logUser);
			return true;
		}
	}

	@SuppressWarnings("unchecked")
	private void setLogin(User user) {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		session.put("loginUser", user);
		String ot = user.getUserType();
		int op = Integer.parseInt(ot);
		if (op == 2) {
			College LoginCollege = (College) this.userService.load(
					new College(), Long.parseLong(user.getLoginID()));
			session.put("loginCollege", LoginCollege);
		} else if (op == 3) {
			Teacher teacher = (Teacher) this.userService.load(new Teacher(),
					Long.parseLong(user.getLoginID()));
			session.put("loginTeacher", teacher);
		} else if (op == 4) {
			Student student = (Student) this.userService.load(new Student(),
					Long.parseLong(user.getLoginID()));
			session.put("loginStudent", student);
		}
	}

	public void hasUser() {
		JsonUtil.outBoolean(this.loginUser());
	}

	public void isLogin() {
		JsonUtil.outBoolean(this.loginUser()
				&& user.getPassword().equals(password));

	}
	
	@SuppressWarnings("unchecked")
	public static User LoginUser(){
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		return user;
	}

}

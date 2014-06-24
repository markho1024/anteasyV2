package com.app.user.action;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.common.tool.SqlUtil;
import com.anteasy.struts2.BaseAction;
import com.app.user.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.User;

@Controller("userAction")
public class UserAction extends BaseAction {
	private User user;
	private User soUser;
	private UserService userService;

	private String loginID;
	private String pw;

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getSoUser() {
		return soUser;
	}

	public void setSoUser(User soUser) {
		this.soUser = soUser;
	}

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/* 增加 */
	public String add() {
		return ADD;
	}

	/* 读取 */
	public String load() {
		this.user = (User) this.userService.load(new User(), this.id);
		return LOAD;
	}

	/* 读取 */
	public String loadC() {
		this.user = (User) this.userService.load(new User(), this.id);
		return "loadc";
	}

	/* 删除 */
	public String del() {
		this.userService.delete(this.user);
		return DEL;
	}

	/* 编辑 */
	public String edit() {
		this.user = (User) this.userService.load(new User(), this.id);
		return EDIT;
	}

	/* 编辑 */
	public String editC() {
		this.user = (User) this.userService.load(new User(), this.id);
		return "editc";
	}

	/* 保存 */
	public String save() {
		this.userService.save(this.user);
		return SAVE;
	}

	/* 更新 */
	public String update() {
		this.userService.update(this.user);
		return UPDATE;
	}

	public String updateT() {
		this.setLogin();
		this.userService.update(this.user);
		return "updatet";
	}

	public String updateC() {
		this.userService.update(this.user);
		return "updatec";
	}

	/* 取消 */
	public String off() {
		User userLoad = (User) this.userService.load(new User(), this.getId());
		userLoad.setStatus(offID);
		this.userService.update(userLoad);
		return UPDATE;
	}

	/* 取消 */
	public String offC() {
		User userLoad = (User) this.userService.load(new User(), this.getId());
		userLoad.setStatus(offID);
		this.userService.update(userLoad);
		return "updatec";
	}

	/* 列出所有 */
	public String listAll() {
		this.pageBean = this.userService.queryForPage(this.getPageCount(),
				this.currentPage, new User(), this.betweens);
		return LIST;
	}

	/* 根据条件查询 */
	public String query() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));

		this.pageBean = this.getUserService().queryForPage(this.getPageCount(),
				this.currentPage, this.soUser, list);
		return LIST;
	}

	/* 根据条件查询 */
	@SuppressWarnings("unchecked")
	public String listC() {
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));

		if (this.soUser == null) {
			this.soUser = new User();
		}
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
			soUser.setCollegeID(user.getCollegeID());
		list.add("userType !='2' ");
		this.pageBean = this.getUserService().queryForPage(this.getPageCount(),
				this.currentPage, this.soUser, list);
		return "listc";
	}

	/* 修改密码 */
	@SuppressWarnings("unchecked")
	public String editPw() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		this.setUser(user);
		return "editpw";
	}

	/* 登入管理 */
	@SuppressWarnings("unchecked")
	public void loadLogin() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		this.user = (User) session.get("loginUser");
	}

	@SuppressWarnings("unchecked")
	public void setLogin() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		session.put("loginUser", this.user);
	}

	public void isExist() {
		String sql = "from User where loginID = '" + this.loginID + "'";
		boolean exist = this.userService.isExist(sql);
		JsonUtil.outBoolean(exist);
	}

	/* 用户密码校验 */
	@SuppressWarnings("unchecked")
	public void isPw() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		User user = (User) session.get("loginUser");
		boolean doPw = false;
		if (user.getPassword().equals(pw)) {
			doPw = true;
		}
		JsonUtil.outBoolean(doPw);
	}
}

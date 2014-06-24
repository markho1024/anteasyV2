	/*=================================*/
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
		if(null==soOpen){
			this.soOpen = new Open();
		}
		this.soOpen.setCollegeID(LoginAction.LoginUser().getCollegeID());
		List<String> list = new ArrayList<String>();
		list.add(SqlUtil.betweenDate("createDate", startDate, endDate));
		this.pageBean = this.getOpenService().queryForPage(
				this.getPageCount(), this.currentPage, this.soOpen, list);
		return "listc";
	}
}

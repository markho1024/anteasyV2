package com.orm.pojo;

import java.sql.Date;

public class Clazz {
	private Long clazzID;
	private String clazzName;
	private Long collegeID;
	private Long majorID;

	private String remark;
	private Date createDate;
	private String status;

	public Long getClazzID() {
		return clazzID;
	}

	public void setClazzID(Long clazzID) {
		this.clazzID = clazzID;
	}

	public String getClazzName() {
		return clazzName;
	}

	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}

	public Long getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(Long collegeID) {
		this.collegeID = collegeID;
	}

	public Long getMajorID() {
		return majorID;
	}

	public void setMajorID(Long majorID) {
		this.majorID = majorID;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}

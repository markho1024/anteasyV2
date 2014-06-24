package com.orm.pojo;

import java.sql.Date;

public class Major {
	private Long majorID;
	private String majorName;
	private Long collegeID;

	private String remark;
	private Date createDate;
	private String status;

	public Long getMajorID() {
		return majorID;
	}

	public void setMajorID(Long majorID) {
		this.majorID = majorID;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public Long getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(Long collegeID) {
		this.collegeID = collegeID;
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
